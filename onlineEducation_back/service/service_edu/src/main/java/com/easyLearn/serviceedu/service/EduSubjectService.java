package com.easyLearn.serviceedu.service;

import com.easyLearn.serviceedu.entity.EduSubject;
import com.easyLearn.serviceedu.entity.subject.OneSubject;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 课程科目服务类
 */
public interface EduSubjectService extends IService<EduSubject> {

    /**
     * 添加课程分类方法
     * @param file
     * @param eduSubjectService
     */
    void saveSubject(MultipartFile file, EduSubjectService eduSubjectService);

    /**
     * 课程树形分级分类方法
     * @return
     */
    List<OneSubject> getAllOneTwoSubject();
}
