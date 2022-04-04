package com.easyLearn.serviceedu.controller;


import com.easyLearn.commonutils.R;
import com.easyLearn.commonutils.exceptionhandler.SearchException;
import com.easyLearn.serviceedu.entity.EduTeacher;
import com.easyLearn.serviceedu.entity.vo.TeachQuery;
import com.easyLearn.serviceedu.service.EduTeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * 与讲师相关的增删改查
 */
@Api(description = "讲师管理")
@RestController
@RequestMapping("/eduservice/teacher")
@CrossOrigin
public class EduTeacherController {

    @Autowired
    private EduTeacherService teacherService;

    /**
     * 普通查询所有讲师
     * @return R
     */
    @ApiOperation(value = "所有讲师列表")
    @GetMapping("/findAll")
    public R findAllTeacher() {
        List<EduTeacher> list = teacherService.list(null);
        return R.ok().data("teachers", list);
    }

    /**
     * 根据id删除讲师
     * @param id 删除对象的id值
     * @return R
     */
    @ApiOperation(value = "逻辑删除讲师")
    @DeleteMapping("/{id}")
    public R deleteTeacher(@ApiParam(name="id", value="讲师id", required=true) @PathVariable String id) {
        boolean removeById = teacherService.removeById(id);
        if (removeById) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    /**
     * 实现分页功能查询讲师
     * @param current 当前页
     * @param limit 每页的记录数
     * @return R
     */
    @ApiOperation(value = "分页查询讲师")
    @GetMapping("/pageTeacher/{current}/{limit}")
    public R pageTeacher(@PathVariable Long current, @PathVariable Long limit) {

        Page<EduTeacher> pageTeacher = new Page<>(current, limit);
        try {
            int i = 1 / 0;
        } catch (Exception e) {
            throw new SearchException(20001, "方法执行SearchException异常");
        }
        //调用方法，把所有数据封装到pageTeacher中
        teacherService.page(pageTeacher, null);
        //分页后总记录数
        long total = pageTeacher.getTotal();
        //获取分页后的list集合
        List<EduTeacher> records = pageTeacher.getRecords();

        HashMap<String, Object> map = new HashMap<>();
        map.put("total", total);
        map.put("rows", records);
        return R.ok().data(map);
    }

    /**
     * 条件查询带分页
     * @param current 当前页
     * @param limit 每页的记录数
     * @param teachQuery 封装查询条件的值对象
     * @return R
     */
    @ApiOperation(value = "条件查询带分页")
    @PostMapping("/pageTeacherCondition/{current}/{limit}")
    public R pageTeacherCondition(@PathVariable Long current,
                                  @PathVariable Long limit,
                                  @RequestBody(required = false) TeachQuery teachQuery) {
        Page<EduTeacher> pageCondition = new Page<>(current, limit);
        QueryWrapper<EduTeacher> wrapper = new QueryWrapper<>();

        //多条件组合查询
        String name = teachQuery.getName();
        Integer level = teachQuery.getLevel();
        String begin = teachQuery.getBegin();
        String end = teachQuery.getEnd();
        //判断条件是否为空，不为空就使用wrapper进行拼接构建条件
        if (!StringUtils.isEmpty(level)) {
            wrapper.eq("level", level);
        }
        if (!StringUtils.isEmpty(name)) {
            wrapper.like("name", name);
        }
        if (!StringUtils.isEmpty(begin)) {
            wrapper.ge("gmt_create", begin);
        }
        if (!StringUtils.isEmpty(end)) {
            wrapper.le("gmt_create", end);
        }
        //根据创建时间降序排列
        wrapper.orderByDesc("gmt_create");

        //调用方法实现条件查询分页
        teacherService.page(pageCondition, wrapper);
        long total = pageCondition.getTotal();
        List<EduTeacher> records = pageCondition.getRecords();
        HashMap<String, Object> map = new HashMap<>();
        map.put("total", total);
        map.put("rows", records);
        return R.ok().data(map);
    }

    /**
     * 添加讲师的接口方法
     * @param eduTeacher 封装讲师信息的对象
     * @return R
     */
    @ApiOperation("添加教师")
    @PostMapping("/addTeacher")
    public R addTeacher(@RequestBody EduTeacher eduTeacher) {
        boolean save = teacherService.save(eduTeacher);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }


    /**
     * 查询下面要修改讲师的对应id
     * @param id 对应讲师的id值
     * @return
     */
    @ApiOperation("根据id查询教师")
    @GetMapping("/getTeacher/{id}")
    public R getTeacher(@PathVariable String id) {
        EduTeacher eduTeacher = teacherService.getById(id);
        return R.ok().data("teacher", eduTeacher);
    }
    /**
     * 根据id修改讲师
     * @param eduTeacher 封装讲师信息的对象
     * @return
     */
    @ApiOperation("根据id修改教师")
    @PostMapping("/updateTeacher")
    public R updateTeacher(@RequestBody EduTeacher eduTeacher) {
        boolean update = teacherService.updateById(eduTeacher);
        if (update) {
            return R.ok();
        } else {
            return R.error();
        }

    }

}

