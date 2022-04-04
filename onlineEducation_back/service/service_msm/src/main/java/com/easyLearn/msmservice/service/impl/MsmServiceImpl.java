package com.easyLearn.msmservice.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.easyLearn.msmservice.service.MsmService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Transactional
@Service
public class MsmServiceImpl implements MsmService {

    /**
     * 发送短信
     */
    @Override
    public boolean send(Map<String, Object> param, String phone) {

            if(StringUtils.isEmpty(phone)) {return false;}

            DefaultProfile profile =
                    DefaultProfile.getProfile("default", "LTAI4GJ6aa5zmUTuAMmteoss", "53eD9YFsPyTEHxBLxgpyB1mDY4ChHD");
            IAcsClient client = new DefaultAcsClient(profile);

            CommonRequest request = new CommonRequest();
            //request.setProtocol(ProtocolType.HTTPS);固定参数
            request.setMethod(MethodType.POST);
            request.setDomain("dysmsapi.aliyuncs.com");
            request.setVersion("2017-05-25");
            request.setAction("SendSms");

            request.putQueryParameter("PhoneNumbers", phone);
            //填写申请阿里云的签名名称
            request.putQueryParameter("SignName", "易学在线教育平台");
            //填写申请阿里云的模板code
            request.putQueryParameter("TemplateCode", "SMS_199222499");
            //验证码数据，转换为json数据传递
            request.putQueryParameter("TemplateParam", JSONObject.toJSONString(param));

            try {
                //最终发送
                CommonResponse response = client.getCommonResponse(request);
                System.out.println(response.getData());
                return response.getHttpResponse().isSuccess();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        }

}
