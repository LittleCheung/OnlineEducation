package com.easyLearn.serviceedu.controller.front;

import com.easyLearn.commonutils.R;
import com.easyLearn.serviceedu.entity.EduCourse;
import com.easyLearn.serviceedu.entity.EduTeacher;
import com.easyLearn.serviceedu.service.EduCourseService;
import com.easyLearn.serviceedu.service.EduTeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("eduservice/teacherfront")
@CrossOrigin
public class TeacherFrontController {

    @Autowired
    private EduTeacherService eduTeacherService;

    @Autowired
    private EduCourseService eduCourseService;
    //分页查询讲师
    @PostMapping("getTeacherFrontList/{page}/{limit}")
    public R getTeacherFrontList(@PathVariable long page,@PathVariable long limit){
        Page<EduTeacher> pageTeacher = new Page<>(page,limit);
        Map<String,Object> map = eduTeacherService.getTeacherFrontList(pageTeacher);
        return R.ok().data(map);
    }

    //讲师查询的功能
    @GetMapping("getTeacherFrontInfo/{teacherId}")
    public R getTeacherFrontInfo(@PathVariable String teacherId){
        //1、查询讲师基本信息
        EduTeacher eduTeacher = eduTeacherService.getById(teacherId);

        //1、查询讲师课程的基本信息
        QueryWrapper<EduCourse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("teacher_id",teacherId);
        //讲师可能一个课程也可能多个课程
        List<EduCourse> list = eduCourseService.list(queryWrapper);

        return R.ok().data("teacher",eduTeacher).data("courseList",list);
    }
}
