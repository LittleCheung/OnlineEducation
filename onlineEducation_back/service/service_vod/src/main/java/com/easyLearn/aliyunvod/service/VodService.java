package com.easyLearn.aliyunvod.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public interface VodService {

    String uploadVideo(MultipartFile file);

    void removeVideo(String videoId);

    void removeAllVideo(List videoIdList);
}
