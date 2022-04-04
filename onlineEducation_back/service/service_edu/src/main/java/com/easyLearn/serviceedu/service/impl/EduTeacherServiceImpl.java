package com.easyLearn.serviceedu.service.impl;

import com.easyLearn.serviceedu.entity.EduTeacher;
import com.easyLearn.serviceedu.mapper.EduTeacherMapper;
import com.easyLearn.serviceedu.service.EduTeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 服务实现类
 * </p>
 *
 * @author atguigu
 * @since 2020-08-02
 */
@Transactional
@Service
public class EduTeacherServiceImpl extends ServiceImpl<EduTeacherMapper, EduTeacher> implements EduTeacherService {

    @Override
    public Map<String, Object> getTeacherFrontList(Page<EduTeacher> pageTeacher) {
        QueryWrapper<EduTeacher> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        //分页封装到pageTeacher中
        baseMapper.selectPage(pageTeacher, queryWrapper);
        List<EduTeacher> records = pageTeacher.getRecords();
        long current = pageTeacher.getCurrent();
        long pages = pageTeacher.getPages();
        long size = pageTeacher.getSize();
        long total = pageTeacher.getTotal();

        boolean hasNext = pageTeacher.hasNext();//上一页
        boolean hasPrevious = pageTeacher.hasPrevious();//下一页

        Map<String, Object> map = new HashMap<>();

        map.put("items", records);
        map.put("current", current);
        map.put("pages", pages);
        map.put("size", size);
        map.put("total", total);
        map.put("hasNext", hasNext);
        map.put("hasPrevious", hasPrevious);

        return  map;
    }
}
