package com.easyLearn.oss.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.easyLearn.oss.service.OssService;
import com.easyLearn.oss.utils.ConstantPropertiesUtils;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.UUID;

@Service
public class OssServiceImpl implements OssService {
    @Override
    public String upload(MultipartFile file) {

        String endPoint = ConstantPropertiesUtils.END_POINT;
        String accessKeyId = ConstantPropertiesUtils.ACCESS_KEY_ID;
        String accessKeySecret = ConstantPropertiesUtils.ACCESS_KEY_SECRET;
        String bucketName = ConstantPropertiesUtils.BUCKET_NAME;

        try {
            // 创建OSSClient实例
            OSS ossClient = new OSSClientBuilder().build(endPoint, accessKeyId, accessKeySecret);

            // 上传文件流
            InputStream inputStream = file.getInputStream();

            //获取文件名称
            String fileOriginalFilename = file.getOriginalFilename();

            //使用uuid在文件名称里面添加随机唯一值
            String uuid = UUID.randomUUID().toString().replace("-", "");
            fileOriginalFilename = uuid + fileOriginalFilename;

            //把文件按照日期进行分类
            String datePach = new DateTime().toString("yyyy/MM/dd");
            fileOriginalFilename = datePach + "/" + fileOriginalFilename;

            //调用oss进行上传
            ossClient.putObject(bucketName, fileOriginalFilename, inputStream);

            // 关闭OSSClient。
            ossClient.shutdown();

            //返回路径
            String url = "http://" + bucketName + "." + endPoint + "/" + fileOriginalFilename;
            return url;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
