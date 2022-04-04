package com.easyLearn.serviceedu.service;

import com.easyLearn.serviceedu.entity.EduVideo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 课程视频 服务类
 * </p>
 *
 * @author atguigu
 * @since 2020-08-06
 */
public interface EduVideoService extends IService<EduVideo> {

    void removeByCourseId(String courseId);

}
