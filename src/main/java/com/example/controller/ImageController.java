package com.example.controller;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 验证码控制器
 */
@Controller
public class ImageController {

    /**
     * 生成验证码图片
     */
    @RequestMapping("/image")
    public void getImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 设置响应头，不缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // 设置响应类型为图片
        response.setContentType("image/jpeg");

        int width = 80, height = 30;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        Graphics g = image.getGraphics();
        Random random = new Random();

        // 设置背景色
        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);

        // 设置字体
        g.setFont(new Font("Times New Roman", Font.PLAIN, 20));

        // 设置干扰线
        g.setColor(getRandColor(160, 200));
        for (int i = 0; i < 155; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }

        // 生成4位验证码
        String sRand = "";
        for (int i = 0; i < 4; i++) {
            String rand = String.valueOf(random.nextInt(10));
            sRand += rand;
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
            g.drawString(rand, 13 * i + 6, 22);
        }

        // 将验证码存入Session
        HttpSession session = request.getSession();
        session.setAttribute("code", sRand);

        g.dispose();

        // 输出图片
        ImageIO.write(image, "JPEG", response.getOutputStream());
    }

    /**
     * 获取随机颜色
     */
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) fc = 255;
        if (bc > 255) bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
}
