package com.easyLearn.serviceedu.client;

import com.easyLearn.commonutils.R;
import com.easyLearn.serviceedu.client.impl.VodClientImpl;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 调用vod模块中的方法的接口
 */
@FeignClient(name = "service-vod", fallback = VodClientImpl.class)
@Component
public interface VodClient {
    //注意要写调用方法的全路径
    @DeleteMapping(value = "/eduvod/video/removeVideo/{videoId}")
    public R removeVideo(@PathVariable("videoId") String videoId);


    @DeleteMapping("/eduvod/video/deleteBatch")
    public R deleteBatch(@RequestParam("videoIdList") List<String> videoIdList);
}
