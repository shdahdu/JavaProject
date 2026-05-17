package com.example.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 工具类
 */
public class MyUtil {

    /**
     * 生成唯一文件名
     */
    public static String createFileName(String originalFileName) {
        String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
        return UUID.randomUUID().toString().replace("-", "") + ext;
    }

    /**
     * 获取当前时间字符串
     */
    public static String getNowDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(new Date());
    }

    /**
     * 获取当前时间（Date类型）
     */
    public static Date getNow() {
        return new Date();
    }
}
