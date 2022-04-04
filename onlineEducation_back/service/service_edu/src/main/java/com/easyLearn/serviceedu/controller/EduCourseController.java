package com.easyLearn.serviceedu.controller;


import com.easyLearn.commonutils.R;
import com.easyLearn.serviceedu.entity.EduCourse;
import com.easyLearn.serviceedu.entity.vo.CourseInfoVo;
import com.easyLearn.serviceedu.entity.vo.CoursePublishVo;
import com.easyLearn.serviceedu.entity.vo.CourseQuery;
import com.easyLearn.serviceedu.service.EduCourseService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * 具体课程前端控制器
 */
@Api(description = "添加课程信息")
@RestController
@RequestMapping("/eduservice/course")
@CrossOrigin
public class EduCourseController {

    @Autowired
    private EduCourseService eduCourseService;

    /**
     * 添加课程基本信息
     * @param courseInfoVo
     * @return id
     */
    @PostMapping("addCourseInfo")
    public R addCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        String id = eduCourseService.saveCourseInfo(courseInfoVo);
        return R.ok().data("courseId", id);
    }


    /**
     * 根据课程id查询课程基本信息
     * @param courseId
     * @return courseInfoVo
     */
    @GetMapping("getCourseInfo/{courseId}")
    public R getCourseInfo(@PathVariable String courseId) {
        CourseInfoVo courseInfoVo = eduCourseService.getCourseInfo(courseId);
        return R.ok().data("courseInfoVo", courseInfoVo);
    }

    /**
     * 修改课程信息
     * @param courseInfoVo
     * @return
     */
    @PostMapping("updateCourseInfo")
    public R updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        eduCourseService.updateCourseInfo(courseInfoVo);
        return R.ok();
    }

    /**
     * 根据课程id查询课程确认信息
     * @param id
     * @return
     */
    @GetMapping("getPublishCourseInfo/{id}")
    public R getPublishCourseInfo(@PathVariable String id) {
        CoursePublishVo coursePublishVo = eduCourseService.getPublishCourseInfo(id);
        return R.ok().data("publishCourse", coursePublishVo);
    }

    /**
     * 根据课程id最终发布课程
     * @param id
     * @return
     */
    @PostMapping("publishCourse/{id}")
    public R publishCourse(@PathVariable String id) {
        EduCourse eduCourse = new EduCourse();
        eduCourse.setId(id);
        eduCourse.setStatus("Normal");
        eduCourseService.updateById(eduCourse);
        return R.ok();
    }

    /**
     * 根据课程id删除课程
     * @param courseId
     * @return
     */
    @DeleteMapping("{courseId}")
    public R removeCourse(@PathVariable String courseId) {
        eduCourseService.removeCourse(courseId);
        return R.ok();
    }

    /**
     * 查询课程列表
     * @return list
     */
    @GetMapping()
    public R getCourseList() {
        List<EduCourse> list = eduCourseService.list(null);
        return R.ok().data("list", list);
    }


    //条件查询带分页
    //根据课程id查询课程基本信息
    @ApiOperation(value = "分页查询课程")
    @GetMapping("pageCourse/{current}/{limit}")
    public R pageTeacher(@PathVariable Long current,
                         @PathVariable Long limit) {
        //创建page
        Page<EduCourse> pageTeacher = new Page<>(current, limit);
        IPage<EduCourse> page = eduCourseService.page(pageTeacher, null);
        List<EduCourse> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().data("total", total).data("records", records);
    }


    //4.条件查询分页方法
    @ApiOperation(value = "条件查询分页方法")
    @PostMapping("pageCourseCondition/{current}/{limit}")
    public R pageCourseCondition(@PathVariable Long current,
                                 @PathVariable Long limit,
                                 @RequestBody(required = false) CourseQuery courseQuery) {
        //创建page
        Page<EduCourse> pageCondition = new Page<>(current, limit);

        //QueryWrapper,构建
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        //多条件组合查询，动态sql
        String status = courseQuery.getStatus();
        String title = courseQuery.getTitle();
        if (!StringUtils.isEmpty(title)) {
            wrapper.like("title", title);
        }
        if (!StringUtils.isEmpty(status)) {
            wrapper.eq("status", status);
        }

        wrapper.orderByDesc("gmt_create");

        //调用方法，实现分页查询
        IPage<EduCourse> page = eduCourseService.page(pageCondition, wrapper);

        long total = page.getTotal();//获取总记录数
        List<EduCourse> records = page.getRecords();//获取分页后的list集合
        HashMap<String, Object> map = new HashMap<>();
        map.put("total", total);
        map.put("rows", records);
        return R.ok().data(map);
    }
}

