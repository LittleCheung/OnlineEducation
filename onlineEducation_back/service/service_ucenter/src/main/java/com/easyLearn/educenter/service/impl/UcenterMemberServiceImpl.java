package com.easyLearn.educenter.service.impl;

import com.easyLearn.commonutils.JwtUtils;
import com.easyLearn.commonutils.MD5;
import com.easyLearn.commonutils.exceptionhandler.SearchException;
import com.easyLearn.educenter.entity.UcenterMember;
import com.easyLearn.educenter.entity.vo.RegisterVo;
import com.easyLearn.educenter.mapper.UcenterMemberMapper;
import com.easyLearn.educenter.service.UcenterMemberService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 */
@Service
public class UcenterMemberServiceImpl extends ServiceImpl<UcenterMemberMapper, UcenterMember> implements UcenterMemberService {

    //用来验证与redis中验证码是否匹配
    @Autowired
    private RedisTemplate<String,String> redisTemplate;


    /**
     * 登录的方法
     */
    @Override
    public String login(UcenterMember ucenterMember) {
        //获取登录手机号和密码做登录验证
        String mobile = ucenterMember.getMobile();
        String password = ucenterMember.getPassword();

        //如果手机号或密码任一为空，直接返回登录失败
        if (StringUtils.isEmpty(mobile)||StringUtils.isEmpty(password)){
            throw new SearchException(20001,"手机号和密码为空");
        }
        //判断手机号是否正确
        QueryWrapper<UcenterMember> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("mobile",mobile);
        UcenterMember mobileMember = baseMapper.selectOne(queryWrapper);
        if (mobileMember == null){
            throw new SearchException(20001,"手机号不存在");
        }

        //判断密码是否相等
        //使用MD5对密码进行加密，再与数据库进行比较
        String password1 = mobileMember.getPassword();
        if (!MD5.encrypt(password).equals(password1)){
            throw new SearchException(20001,"密码错误");
        }

        //判断用户是否被禁用
        if(mobileMember.getIsDisabled()){
            throw new SearchException(20001,"用户被禁用登录失败");
        }

        //登录成功，使用jwt工具类生成token字符串返回
        String token = JwtUtils.getJwtToken(mobileMember.getId(), mobileMember.getNickname());
        return token;
    }


    /**
     * 注册的方法
     */
    @Override
    public void register(RegisterVo registerVo) {
        //获取注册基本信息
        String code = registerVo.getCode();
        String mobile = registerVo.getMobile();
        String nickname = registerVo.getNickname();
        String password = registerVo.getPassword();

        //基本信息非空判断
        if (StringUtils.isEmpty(code)||StringUtils.isEmpty(mobile)
                ||StringUtils.isEmpty(nickname)||StringUtils.isEmpty(password)){
            throw new SearchException(20001,"注册失败");
        }

        //判断验证码与redis中验证码是否相同
        String redisCode = redisTemplate.opsForValue().get(mobile);
        System.out.println("redisCode:"+redisCode);
        System.out.println("code:"+code);
        if (!code.equals(redisCode)){
            throw new SearchException(20001,"注册失败");
        }

        //判断手机号在数据库中是否重复，表中存在相同手机号就不再添加
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile",mobile);
        Integer count = baseMapper.selectCount(wrapper);
        if (count > 0){
            throw new SearchException(20001,"注册失败");
        }

        //将数据添加到数据库
        UcenterMember ucenterMember = new UcenterMember();
        ucenterMember.setMobile(mobile);
        ucenterMember.setPassword(MD5.encrypt(password));
        ucenterMember.setNickname(nickname);
        ucenterMember.setIsDisabled(false);
        ucenterMember.setAvatar("https://edu-longyang.oss-cn-beijing.aliyuncs.com/fa104ef58c4e5bc4270d911da1d1b34d.jpg");
        baseMapper.insert(ucenterMember);
    }


    @Override
    public UcenterMember getMenberByOperid(String openid) {
        QueryWrapper<UcenterMember> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("openid",openid);
        UcenterMember member = baseMapper.selectOne(queryWrapper);
        return member;
    }

    @Override
    public Integer ucenterMemberService(String day) {
        return baseMapper.ucenterMemberService(day);
    }
}
