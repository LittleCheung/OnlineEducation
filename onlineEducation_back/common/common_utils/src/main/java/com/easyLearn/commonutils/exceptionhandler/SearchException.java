package com.easyLearn.commonutils.exceptionhandler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 自定义异常类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchException extends RuntimeException {
    private Integer code;//状态码
    private String msg;//输出消息
}
