package com.easyLearn.serviceedu.service.impl;

import com.easyLearn.commonutils.exceptionhandler.SearchException;
import com.easyLearn.serviceedu.entity.EduChapter;
import com.easyLearn.serviceedu.entity.EduVideo;
import com.easyLearn.serviceedu.entity.chapter.ChapterVo;
import com.easyLearn.serviceedu.entity.chapter.VideoVo;
import com.easyLearn.serviceedu.mapper.EduChapterMapper;
import com.easyLearn.serviceedu.service.EduChapterService;
import com.easyLearn.serviceedu.service.EduVideoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 课程章节服务实现类
 */
@Transactional
@Service
public class EduChapterServiceImpl extends ServiceImpl<EduChapterMapper, EduChapter> implements EduChapterService {

    @Autowired
    private EduVideoService eduVideoService;

    /**
     * 根据课程id查询章节和小节
     * @param courseId
     * @return finalList
     */
    @Override
    public List<ChapterVo> getChapterVoByCourseId(String courseId) {
        //根据课程id查询课程里面所有的章节
        QueryWrapper<EduChapter> chapterQueryWrapper = new QueryWrapper<>();
        chapterQueryWrapper.eq("course_id", courseId);
        List<EduChapter> eduChapterList = baseMapper.selectList(chapterQueryWrapper);
        //根据课程id查询课程里面所有的小节
        QueryWrapper<EduVideo> videoQueryWrapper = new QueryWrapper<>();
        videoQueryWrapper.eq("course_id", courseId);
        List<EduVideo> eduVideoList = eduVideoService.list(videoQueryWrapper);

        ArrayList<ChapterVo> finalList = new ArrayList<>();
        //遍历查询章节list集合进行封装
        for (EduChapter eduChapter : eduChapterList) {
            ChapterVo chapterVo = new ChapterVo();
            BeanUtils.copyProperties(eduChapter, chapterVo);
            finalList.add(chapterVo);

            ArrayList<VideoVo> videoVoList = new ArrayList<>();
            //遍历查询小节list集合进行封装
            for (EduVideo eduVideo : eduVideoList) {
                if (eduVideo.getChapterId().equals(chapterVo.getId())) {
                    VideoVo videoVo = new VideoVo();
                    BeanUtils.copyProperties(eduVideo, videoVo);
                    videoVoList.add(videoVo);
                }
            }
            chapterVo.setChildren(videoVoList);
        }
        return finalList;
    }

    /**
     * 删除章节的方法
     */
    @Override
    public boolean deleteChapterById(String chapterId) {
        //根据章节判断，如果有小节数据则不能删除
        QueryWrapper<EduVideo> eduVideoWrapper = new QueryWrapper<>();
        eduVideoWrapper.eq("chapter_id", chapterId);
        int count = eduVideoService.count(eduVideoWrapper);
        if (count > 0) {
            throw new SearchException(20001, "有小节，无法删除");
        } else {
            int result = baseMapper.deleteById(chapterId);
            return result > 0;
        }
    }


    @Override
    public void removeChapterByCourseId(String courseId) {
        QueryWrapper<EduChapter> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id", courseId);
        baseMapper.delete(queryWrapper);
    }


}
