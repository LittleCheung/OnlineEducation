package com.easyLearn.serviceedu.entity.chapter;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 课程章节类
 */
@Data
public class ChapterVo {
    private String id;
    private String title;
    private List<VideoVo> children = new ArrayList<>();
}
