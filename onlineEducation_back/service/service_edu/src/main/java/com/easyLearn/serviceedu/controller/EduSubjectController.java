package com.easyLearn.serviceedu.controller;


import com.easyLearn.commonutils.R;
import com.easyLearn.serviceedu.entity.subject.OneSubject;
import com.easyLearn.serviceedu.service.EduSubjectService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 课程科目前端控制器
 */
@Api(description = "课程管理")
@RestController
@RequestMapping("/eduservice/subject")
@CrossOrigin
public class EduSubjectController {

    @Autowired
    private EduSubjectService eduSubjectService;

    @PostMapping("addSubject")
    public R addSubject(MultipartFile file) {
        eduSubjectService.saveSubject(file, eduSubjectService);
        return R.ok();
    }


    //课程分类返回结构(树形)
    @GetMapping("getAllSubject")
    public R getAllSubject() {
        List<OneSubject> list = eduSubjectService.getAllOneTwoSubject();
        return R.ok().data("list", list);
    }


}

