package com.easyLearn.serviceedu.controller;


import com.easyLearn.commonutils.R;
import com.easyLearn.serviceedu.entity.EduChapter;
import com.easyLearn.serviceedu.entity.chapter.ChapterVo;
import com.easyLearn.serviceedu.service.EduChapterService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 课程章节前端控制器
 */
@Api(description = "章节小节管理")
@RestController
@RequestMapping("/eduservice/chapter")
@CrossOrigin
public class EduChapterController {

    @Autowired
    private EduChapterService chapterService;

    /**
     * 课程大纲列表，根据课程id进行查询
     */
    @GetMapping("getChapterVideo/{courseId}")
    public R getChapterVo(@PathVariable String courseId) {
        List<ChapterVo> list = chapterService.getChapterVoByCourseId(courseId);
        return R.ok().data("allChapterVideo", list);
    }

    /**
     * 添加课程章节
     */
    @PostMapping("addChapter")
    public R addChapter(@RequestBody EduChapter eduChapter) {
        chapterService.save(eduChapter);
        return R.ok();
    }

    /**
     * 根据id查询课程章节
     */
    @GetMapping("getChapterInfo/{chapterId}")
    public R getChapterInfo(@PathVariable String chapterId) {
        EduChapter chapterById = chapterService.getById(chapterId);
        return R.ok().data("chapter", chapterById);
    }


    /**
     * 修改课程章节
     */
    @PostMapping("updateChapter")
    public R updateChapter(@RequestBody EduChapter eduChapter) {
        chapterService.updateById(eduChapter);
        return R.ok();
    }


    /**
     * 删除课程章节
     */
    @DeleteMapping("{chapterId}")
    public R deleteChapter(@PathVariable String chapterId) {
        boolean flag = chapterService.deleteChapterById(chapterId);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}

