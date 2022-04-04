package com.easyLearn.serviceedu.entity.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class CoursePublishVo implements Serializable {
    private String id;
    private String title;
    private String cover;
    private Integer lessonNum;
    private String subjectLevelOne;
    private String subjectLevelTwo;
    private String teacherName;
    private String price;
}
