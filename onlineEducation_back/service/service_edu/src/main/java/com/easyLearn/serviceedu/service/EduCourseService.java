package com.easyLearn.serviceedu.service;

import com.easyLearn.serviceedu.entity.EduCourse;
import com.easyLearn.serviceedu.entity.frontVo.CourseQueryVo;
import com.easyLearn.serviceedu.entity.frontVo.CourseWebVo;
import com.easyLearn.serviceedu.entity.vo.CourseInfoVo;
import com.easyLearn.serviceedu.entity.vo.CoursePublishVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * 课程服务类
 */
public interface EduCourseService extends IService<EduCourse> {

    String saveCourseInfo(CourseInfoVo courseInfoVo);

    CourseInfoVo getCourseInfo(String courseId);

    void updateCourseInfo(CourseInfoVo courseInfoVo);

    CoursePublishVo getPublishCourseInfo(String id);

    void removeCourse(String courseId);

    Map<String, Object> getTeacherInfo(Page<EduCourse> queryVoPage, CourseQueryVo courseQueryVo);

    CourseWebVo getBaseCourseInfo(String courseId);
}
