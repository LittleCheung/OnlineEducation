package com.easyLearn.serviceedu.controller;


import com.easyLearn.commonutils.R;
import com.easyLearn.commonutils.exceptionhandler.SearchException;
import com.easyLearn.serviceedu.client.VodClient;
import com.easyLearn.serviceedu.entity.EduVideo;
import com.easyLearn.serviceedu.service.EduVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * 课程小节前端控制器
 */
@RestController
@RequestMapping("/eduservice/video")
@CrossOrigin
public class EduVideoController {

    @Autowired
    private EduVideoService eduVideoService;

    /**
     * 注入vodClient使能够在service_edu中使用service_vod中的方法
     */
    @Autowired
    private VodClient vodClient;

    /**
     * 添加小节
     * @param eduVideo
     * @return
     */
    @PostMapping("addVideo")
    public R addVideo(@RequestBody EduVideo eduVideo) {
        eduVideoService.save(eduVideo);
        return R.ok();
    }


    /**
     * 删除小节同时把小节中的视频删除
     * @param id
     * @return
     */
    @DeleteMapping("{id}")
    public R deleteVideo(@PathVariable String id) {
        System.out.println(id);
        //根据小节id查询出视频id
        EduVideo eduVideobyId = eduVideoService.getById(id);
        String videoSourceId = eduVideobyId.getVideoSourceId();
        if (!StringUtils.isEmpty(videoSourceId)) {
            //远程调用vod删除视频
            R result = vodClient.removeVideo(videoSourceId);
            if (result.getCode() == 20001) {
                throw new SearchException(20001,"删除视频失败，触发熔断器");
            }
        }
        //删除视频后删除小节
        eduVideoService.removeById(id);
        return R.ok();
    }


}

