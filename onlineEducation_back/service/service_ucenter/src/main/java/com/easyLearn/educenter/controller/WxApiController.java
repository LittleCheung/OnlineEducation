package com.easyLearn.educenter.controller;

import com.easyLearn.commonutils.JwtUtils;
import com.easyLearn.commonutils.exceptionhandler.SearchException;
import com.easyLearn.educenter.entity.UcenterMember;
import com.easyLearn.educenter.service.UcenterMemberService;
import com.easyLearn.educenter.utils.ConstanWxtiesUtil;
import com.easyLearn.educenter.utils.HttpClientUtils;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;

//只请求地址，不返回数据
@Controller
@RequestMapping("/api/ucenter/wx")
@CrossOrigin
public class WxApiController {

    @Autowired
    private UcenterMemberService ucenterMemberService;

    /**
     * 获取扫描人信息，添加数据
     */
    @GetMapping("callback")
    public String callback(String code, String state, HttpSession session){
        try {
        //1、得到授权临时code值

        //2、拿着code请求 微信的固定地址，得到两个值access_token和openid
        String baseAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                "?appid=%s" +
                "&secret=%s" +
                "&code=%s" +
                "&grant_type=authorization_code";

        String accessTokenUrl = String.format(baseAccessTokenUrl,
                ConstanWxtiesUtil.WX_OPEN_APP_ID,
                ConstanWxtiesUtil.WX_OPEN_APP_SECRET,
                code);
        //请求这个拼接好的地址，得到返回两个值access_token和openid
        //使用httpclient发送请求，得到返回结果
            String accessTokenInfo = HttpClientUtils.get(accessTokenUrl);

            //使用gson转换工具Gson
            Gson gson = new Gson();
            HashMap mapAccessToken = gson.fromJson(accessTokenInfo, HashMap.class);

            String access_token = (String)mapAccessToken.get("access_token");
            String openid = (String)mapAccessToken.get("openid");


            //判断该微信信息是否注册过
            UcenterMember menber = ucenterMemberService.getMenberByOperid(openid);
            if (menber == null){
                //3\拿着access_token和openid，再去请求微信提供的固定地址，获取扫描人信息
                //访问微信的资源服务器，获取用户信息
                String baseUserInfoUrl = "https://api.weixin.qq.com/sns/userinfo" +
                        "?access_token=%s" +
                        "&openid=%s";

                //再次拼接微信地址
                String userInfoUrl = String.format(baseUserInfoUrl, access_token, openid);

                String userInfo = HttpClientUtils.get(userInfoUrl);

                //获取的微信个人信息json信息进行转换
                HashMap userInfoMap = gson.fromJson(userInfo, HashMap.class);
                String nickname = (String)userInfoMap.get("nickname");//昵称
                String headimgurl = (String)userInfoMap.get("headimgurl");//头像

                //把微信信息注册到数据库中
                menber = new UcenterMember();
                menber.setNickname(nickname);
                menber.setOpenid(openid);
                menber.setAvatar(headimgurl);
                ucenterMemberService.save(menber);
            }

            //使用jwt生成token字符串
            String jwtToken = JwtUtils.getJwtToken(menber.getId(), menber.getNickname());
            //返回首页面
            return "redirect:http://localhost:3000?token="+jwtToken;
        } catch (Exception e) {
            e.printStackTrace();
            throw new SearchException(20001,"登录失败");
        }
    }

    /**
     * 生成微信二维码
     */
    @GetMapping("login")
    public String getWxCode(){

        // 微信开放平台授权baseUrl，%s相当于占位符，可以填充参数
        String baseUrl = "https://open.weixin.qq.com/connect/qrconnect" +
                "?appid=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=snsapi_login" +
                "&state=%s" +
                "#wechat_redirect";


        //先获取业务服务器重定向地址
        String redirectUrl = ConstanWxtiesUtil.WX_OPEN_REDIRECT_URL;
        try {
            //对redirectURL进行URLEncoder编码
            redirectUrl = URLEncoder.encode(redirectUrl,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        //设置%s参数值
        String url = String.format(
                baseUrl,
                ConstanWxtiesUtil.WX_OPEN_APP_ID,
                redirectUrl,
                "easyLearn");
        //重定向到请求微信地址
        return "redirect:" + url;
    }
}
