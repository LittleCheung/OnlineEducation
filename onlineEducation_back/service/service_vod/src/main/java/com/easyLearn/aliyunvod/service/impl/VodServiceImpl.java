package com.easyLearn.aliyunvod.service.impl;

import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadStreamRequest;
import com.aliyun.vod.upload.resp.UploadStreamResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.DeleteVideoResponse;
import com.easyLearn.aliyunvod.service.VodService;
import com.easyLearn.aliyunvod.util.AliyunVodSDKUtils;
import com.easyLearn.aliyunvod.util.ConstantVodUtils;
import com.easyLearn.commonutils.exceptionhandler.SearchException;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

@Service
public class VodServiceImpl implements VodService {

    @Override
    public String uploadVideo(MultipartFile file) {
        try {
            String fileName = file.getOriginalFilename();
            //title：上传之后显示的名称
            String title = fileName.substring(0, fileName.lastIndexOf("."));
            //inputStream：上传文件输入流
            InputStream inputStream = file.getInputStream();
            UploadStreamRequest request = new UploadStreamRequest(ConstantVodUtils.ACCESS_KEY_ID, ConstantVodUtils.ACCESS_KEY_SECRET, title, fileName, inputStream);

            UploadVideoImpl uploader = new UploadVideoImpl();
            UploadStreamResponse response = uploader.uploadStream(request);

            String videoId = null;
            if (response.isSuccess()) {
                videoId = response.getVideoId();
            } else { //如果设置回调URL无效，不影响视频上传，可以返回VideoId同时会返回错误码。其他情况上传失败时，VideoId为空，此时需要根据返回错误码分析具体错误原因
                videoId = response.getVideoId();
            }
            return videoId;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public void removeVideo(String videoId) {
        try {
            //初始化对象
            DefaultAcsClient client = AliyunVodSDKUtils.initVodClient(
                    ConstantVodUtils.ACCESS_KEY_ID,
                    ConstantVodUtils.ACCESS_KEY_SECRET);
            //创建删除视频的request对象
            DeleteVideoRequest request = new DeleteVideoRequest();
            //向request中设置videoId
            request.setVideoIds(videoId);
            //调用删除方法
            DeleteVideoResponse response = client.getAcsResponse(request);

            System.out.print("RequestId = " + response.getRequestId() + "\n");

        } catch (ClientException e) {
            throw new SearchException(20001, "视频删除失败");
        }
    }

    @Override
    public void removeAllVideo(List videoIdList) {
        try {
            //初始化对象
            DefaultAcsClient client = AliyunVodSDKUtils.initVodClient(
                    ConstantVodUtils.ACCESS_KEY_ID,
                    ConstantVodUtils.ACCESS_KEY_SECRET);
            //创建删除视频的request对象
            DeleteVideoRequest request = new DeleteVideoRequest();
            String join = StringUtils.join(videoIdList.toArray(), ",");
            request.setVideoIds(join);
            DeleteVideoResponse response = client.getAcsResponse(request);

            System.out.print("RequestId = " + response.getRequestId() + "\n");

        } catch (ClientException e) {
            throw new SearchException(20001, "视频删除失败");
        }
    }
}
