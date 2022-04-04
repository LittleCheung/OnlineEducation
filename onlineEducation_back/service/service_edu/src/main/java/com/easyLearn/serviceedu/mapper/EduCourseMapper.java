package com.easyLearn.serviceedu.mapper;

import com.easyLearn.serviceedu.entity.EduCourse;
import com.easyLearn.serviceedu.entity.frontVo.CourseWebVo;
import com.easyLearn.serviceedu.entity.vo.CoursePublishVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 课程Mapper接口
 */
public interface EduCourseMapper extends BaseMapper<EduCourse> {

    CoursePublishVo getPublishCourseInfo(String id);

    CourseWebVo getBaseCourseInfo(String courseId);
}
