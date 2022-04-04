package com.easyLearn.commonutils.exceptionhandler;


import com.easyLearn.commonutils.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 统一异常处理类
 */
@Slf4j
@ControllerAdvice
public class Globalexceptionhandler {

    /**
     * 全局异常出现时执行的方法
     * @param e 异常对象
     * @return R
     */
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public R error(Exception e){
        e.printStackTrace();
        return R.error().message("执行了全局异常处理");
    }


    /**
     * 自定义异常出现时执行的方法
     * @param e 异常对象
     * @return
     */
    @ExceptionHandler(SearchException.class)
    @ResponseBody
    public R error(SearchException e){
        log.error(e.getMessage());
        e.printStackTrace();
        return R.error().code(e.getCode()).message(e.getMsg());
    }

}
