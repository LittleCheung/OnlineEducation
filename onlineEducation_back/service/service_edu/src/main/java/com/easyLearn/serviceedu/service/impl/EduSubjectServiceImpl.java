package com.easyLearn.serviceedu.service.impl;

import com.alibaba.excel.EasyExcel;
import com.easyLearn.serviceedu.entity.EduSubject;
import com.easyLearn.serviceedu.entity.excel.SubjectData;
import com.easyLearn.serviceedu.entity.subject.OneSubject;
import com.easyLearn.serviceedu.entity.subject.TwoSubject;
import com.easyLearn.serviceedu.listener.SubjectExcelListener;
import com.easyLearn.serviceedu.mapper.EduSubjectMapper;
import com.easyLearn.serviceedu.service.EduSubjectService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 课程科目服务实现类
 */

@Service
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements EduSubjectService {

    @Override
    public void saveSubject(MultipartFile file, EduSubjectService eduSubjectService) {
        try {
            InputStream is = file.getInputStream();
            EasyExcel.read(is, SubjectData.class, new SubjectExcelListener(eduSubjectService)).sheet().doRead();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OneSubject> getAllOneTwoSubject() {
        //查询出所有一级分类，parent_id=0
        QueryWrapper<EduSubject> wrapperOne = new QueryWrapper<>();
        wrapperOne.eq("parent_id", "0");
        List<EduSubject> oneSubjectList = baseMapper.selectList(wrapperOne);

        //查询出所有二级分类，parent_id!=0
        QueryWrapper<EduSubject> wrapperTwo = new QueryWrapper<>();
        wrapperTwo.ne("parent_id", "0");
        List<EduSubject> twoSubjectList = baseMapper.selectList(wrapperTwo);

        List<OneSubject> finalSubjectList = new ArrayList<>();
        //封装一级分类
        for (EduSubject eduSubject : oneSubjectList) {
            OneSubject oneSubject = new OneSubject();
            BeanUtils.copyProperties(eduSubject, oneSubject);
            finalSubjectList.add(oneSubject);


            //创建list集合封装每一个一级分类的二级分类
            ArrayList<TwoSubject> twoFinalList = new ArrayList<>();
            //封装二级分类
            for (EduSubject eduSubjectTwo : twoSubjectList) {
                //当一级分类的id等于二级分类的parent_id时进行封装
                if (eduSubject.getId().equals(eduSubjectTwo.getParentId())) {
                    TwoSubject twoSubject = new TwoSubject();
                    BeanUtils.copyProperties(eduSubjectTwo, twoSubject);
                    twoFinalList.add(twoSubject);
                }
            }
            oneSubject.setChildren(twoFinalList);
        }
        return finalSubjectList;
    }
}
