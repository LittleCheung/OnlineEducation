package com.easyLearn.serviceedu.service;

import com.easyLearn.serviceedu.entity.EduChapter;
import com.easyLearn.serviceedu.entity.chapter.ChapterVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 课程章节服务类
 */
public interface EduChapterService extends IService<EduChapter> {

    List<ChapterVo> getChapterVoByCourseId(String courseId);

    boolean deleteChapterById(String chapterId);

    void removeChapterByCourseId(String courseId);

}
