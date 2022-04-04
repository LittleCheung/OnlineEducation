package com.easyLearn.msmservice.controller;

import com.easyLearn.commonutils.R;
import com.easyLearn.commonutils.RandomUtil;
import com.easyLearn.msmservice.service.MsmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/edumsm/msm")
@CrossOrigin
public class MsmController {

    @Autowired
    private MsmService msmService;

    /**
     * 设置redis过期时间
     */
    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    /**
     * 发送短信的方法
     */
    @GetMapping("send/{phone}")
    public R sendMsm(@PathVariable String phone){
        //先从redis中获取验证码，如果获取到直接返回
        String code = redisTemplate.opsForValue().get(phone);
        if (!StringUtils.isEmpty(code)){
            return R.ok();
        }
        //如果redis获取不到，进行阿里云发送，生成随机数，传递阿里云进行发送
        code = RandomUtil.getFourBitRandom();
        Map<String, Object> param = new HashMap<>();
        param.put("code",code);
        //调用service的方法进行发送
        boolean isSend = msmService.send(param,phone);
        if (isSend) {
            //阿里云发送成功，把发送成功的验证码放入redis缓存中，设置有效时间为5分钟
            redisTemplate.opsForValue().set(phone, code,5, TimeUnit.MINUTES);
            return R.ok();
        }else {
            return R.error().message("短信发送失败");
        }
    }
}
