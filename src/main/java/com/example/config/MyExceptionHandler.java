package com.example.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 全局异常处理类
 */
@ControllerAdvice
public class MyExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public ModelAndView handleException(HttpServletRequest request, Exception e) {
        e.printStackTrace();
        ModelAndView mv = new ModelAndView();
        mv.addObject("errorMsg", "系统出现异常：" + e.getMessage());
        mv.addObject("url", request.getRequestURL().toString());
        mv.setViewName("error");
        return mv;
    }
}
