package com.easyLearn.serviceedu.service.impl;

import com.easyLearn.commonutils.R;
import com.easyLearn.commonutils.exceptionhandler.SearchException;
import com.easyLearn.serviceedu.client.VodClient;
import com.easyLearn.serviceedu.entity.EduVideo;
import com.easyLearn.serviceedu.mapper.EduVideoMapper;
import com.easyLearn.serviceedu.service.EduVideoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 课程小节服务实现类
 */
@Transactional
@Service
public class EduVideoServiceImpl extends ServiceImpl<EduVideoMapper, EduVideo> implements EduVideoService {

    @Autowired
    private VodClient vodClient;

    @Override
    public void removeByCourseId(String courseId) {
        //根据课程id查出所有视频的id
        QueryWrapper<EduVideo> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id", courseId);
        wrapper.select("video_source_id");
        List<EduVideo> eduVideos = baseMapper.selectList(wrapper);
        ArrayList<String> videoIds = new ArrayList<>();
        for (EduVideo eduVideo : eduVideos) {
            String videoSourceId = eduVideo.getVideoSourceId();
            if (!videoSourceId.isEmpty()) {
                videoIds.add(videoSourceId);
            }
        }
        if (videoIds.size() > 0) {
            //删除小节里的所有视频
            R result = vodClient.deleteBatch(videoIds);
            if (result.getCode() == 20001) {
                throw new SearchException(20001, "删除视频失败");
            }
        }

        QueryWrapper<EduVideo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id", courseId);
        baseMapper.delete(queryWrapper);
    }


}
