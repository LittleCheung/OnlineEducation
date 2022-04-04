package com.easyLearn.serviceedu.service.impl;

import com.easyLearn.commonutils.exceptionhandler.SearchException;
import com.easyLearn.serviceedu.entity.EduCourse;
import com.easyLearn.serviceedu.entity.EduCourseDescription;
import com.easyLearn.serviceedu.entity.frontVo.CourseQueryVo;
import com.easyLearn.serviceedu.entity.frontVo.CourseWebVo;
import com.easyLearn.serviceedu.entity.vo.CourseInfoVo;
import com.easyLearn.serviceedu.entity.vo.CoursePublishVo;
import com.easyLearn.serviceedu.mapper.EduCourseMapper;
import com.easyLearn.serviceedu.service.EduChapterService;
import com.easyLearn.serviceedu.service.EduCourseDescriptionService;
import com.easyLearn.serviceedu.service.EduCourseService;
import com.easyLearn.serviceedu.service.EduVideoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 课程服务实现类
 */
@Transactional
@Service
public class EduCourseServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements EduCourseService {

    @Autowired
    private EduCourseDescriptionService eduCourseDescriptionService;

    @Autowired
    private EduChapterService eduChapterService;

    @Autowired
    private EduVideoService eduVideoService;

    /**
     * 添加课程基本信息
     * @param courseInfoVo
     * @return CourseId
     */
    @Override
    public String saveCourseInfo(CourseInfoVo courseInfoVo) {
        //添加相关课程
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo, eduCourse);
        int insert = baseMapper.insert(eduCourse);
        if (insert <= 0) {
            throw new SearchException(20001, "添加课程信息失败");
        }
        //获取添加之后的课程id
        String courseId = eduCourse.getId();

        //向课程简介表中添加课程简介
        EduCourseDescription description = new EduCourseDescription();
        BeanUtils.copyProperties(courseInfoVo, description);
        //设置描述表的id就是课程id
        description.setId(courseId);
        eduCourseDescriptionService.save(description);

        return courseId;
    }

    /**
     * 根据课程id查询课程基本信息
     * @param courseId
     * @return courseInfoVo
     */
    @Override
    public CourseInfoVo getCourseInfo(String courseId) {
        //查询课程表内容，并封装到CourseInfoVo中
        EduCourse eduCourse = baseMapper.selectById(courseId);
        CourseInfoVo courseInfoVo = new CourseInfoVo();
        BeanUtils.copyProperties(eduCourse, courseInfoVo);

        //查询课程描述表内容，并把描述信息设置进CourseInfoVo中
        EduCourseDescription eduCourseDescription = eduCourseDescriptionService.getById(courseId);
        courseInfoVo.setDescription(eduCourseDescription.getDescription());

        return courseInfoVo;
    }

    /**
     * 修改课程信息
     * @param courseInfoVo
     */
    @Override
    public void updateCourseInfo(CourseInfoVo courseInfoVo) {
        //修改课程表内容
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo, eduCourse);
        int update = baseMapper.updateById(eduCourse);
        if (update == 0) {
            throw new SearchException(20001, "修改课程信息失败");
        }
        //修改课程描述表内容
        EduCourseDescription description = new EduCourseDescription();
        description.setId(courseInfoVo.getId());
        description.setDescription(courseInfoVo.getDescription());
        eduCourseDescriptionService.updateById(description);
    }

    /**
     * 根据课程id查询课程确认信息
     * @param id
     * @return
     */
    @Override
    public CoursePublishVo getPublishCourseInfo(String id) {
        //调用mapper
        CoursePublishVo coursePublishVo = baseMapper.getPublishCourseInfo(id);
        return coursePublishVo;
    }


    /**
     * 删除课程，按顺序分别根据课程id删除小节、章节、课程描述和课程本身
     * @param courseId
     */
    @Override
    public void removeCourse(String courseId) {
        eduVideoService.removeByCourseId(courseId);
        eduChapterService.removeChapterByCourseId(courseId);
        eduCourseDescriptionService.removeById(courseId);
        int i = baseMapper.deleteById(courseId);
        if (i == 0) {
            throw new SearchException(20001, "删除失败");
        }
    }

    @Override
    public Map<String, Object> getTeacherInfo(Page<EduCourse> queryVoPage, CourseQueryVo courseQueryVo) {
        QueryWrapper<EduCourse> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isEmpty(courseQueryVo.getSubjectParentId())){
            queryWrapper.eq("subject_parent_id",courseQueryVo.getSubjectParentId());
        }
        if (!StringUtils.isEmpty(courseQueryVo.getSubjectId())){
            queryWrapper.eq("subject_id",courseQueryVo.getSubjectId());
        }
        if (!StringUtils.isEmpty(courseQueryVo.getBuyCountSort())) {
            queryWrapper.orderByDesc("buy_count");
        }
        if (!StringUtils.isEmpty(courseQueryVo.getGmtCreateSort())) {
            queryWrapper.orderByDesc("gmt_create");
        }
        if (!StringUtils.isEmpty(courseQueryVo.getPriceSort())) {
            queryWrapper.orderByDesc("price");
        }
        //封装到page里面
        baseMapper.selectPage(queryVoPage, queryWrapper);

        long total = queryVoPage.getTotal();
        List<EduCourse> records = queryVoPage.getRecords();
        long current = queryVoPage.getCurrent();
        long size = queryVoPage.getSize();
        boolean hasNext = queryVoPage.hasNext();
        boolean hasPrevious = queryVoPage.hasPrevious();
        long pages = queryVoPage.getPages();

        HashMap<String, Object> map = new HashMap<>();
        map.put("teachers", records);
        map.put("current", current);
        map.put("pages", pages);
        map.put("size", size);
        map.put("total", total);
        map.put("hasNext", hasNext);
        map.put("hasPrevious", hasPrevious);
        return map;
    }


    @Override
    public CourseWebVo getBaseCourseInfo(String courseId) {
        return baseMapper.getBaseCourseInfo(courseId);
    }
}
