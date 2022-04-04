package com.easyLearn.serviceedu.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.easyLearn.commonutils.exceptionhandler.SearchException;
import com.easyLearn.serviceedu.entity.EduSubject;
import com.easyLearn.serviceedu.entity.excel.SubjectData;
import com.easyLearn.serviceedu.service.EduSubjectService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import java.util.Map;

/**
 * 课程管理监听器
 */
public class SubjectExcelListener extends AnalysisEventListener<SubjectData> {

    public EduSubjectService eduSubjectService;
    public SubjectExcelListener(EduSubjectService eduSubjectService) {
        this.eduSubjectService = eduSubjectService;
    }
    public SubjectExcelListener() {
    }

    @Override
    public void invoke(SubjectData subjectData, AnalysisContext analysisContext) {
        if (subjectData == null) {
            throw new SearchException(20001, "文件数据为空");
        }
        //判断一级分类进行添加
        EduSubject oneSubject = this.existOneSubject(eduSubjectService, subjectData.getOneSubjectName());
        if (oneSubject == null) {
            oneSubject = new EduSubject();
            oneSubject.setParentId("0");
            oneSubject.setTitle(subjectData.getOneSubjectName());
            eduSubjectService.save(oneSubject);
        }

        //判断二级分类进行添加
        String pid = oneSubject.getId();
        EduSubject twoSubject = this.existTwoSubject(eduSubjectService, subjectData.getTwoSubjectName(), pid);
        if (twoSubject == null) {
            twoSubject = new EduSubject();
            twoSubject.setParentId(pid);
            twoSubject.setTitle(subjectData.getTwoSubjectName());
            eduSubjectService.save(twoSubject);
        }
    }

    /**
     * 判断二级分类是否已经存在
     * @param eduSubjectService
     * @param name
     * @return
     */
    private EduSubject existOneSubject(EduSubjectService eduSubjectService, String name) {
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title", name);
        wrapper.eq("parent_id", "0");
        EduSubject one = eduSubjectService.getOne(wrapper);
        return one;
    }

    /**
     * 判断二级分类是否已经存在
     * @param eduSubjectService
     * @param name
     * @param pid
     * @return
     */
    private EduSubject existTwoSubject(EduSubjectService eduSubjectService, String name, String pid) {
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title", name);
        wrapper.eq("parent_id", pid);
        EduSubject one = eduSubjectService.getOne(wrapper);
        return one;
    }



    @Override
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
        super.invokeHeadMap(headMap, context);
    }


    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
