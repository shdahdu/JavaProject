package com.example.controller;

import com.example.model.Card;
import com.example.model.MyUser;
import com.example.service.CardService;
import com.example.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * 名片管理控制器
 */
@Controller
public class CardController {

    @Autowired
    private CardService cardService;

    /**
     * 名片列表（分页）
     */
    @RequestMapping("/cardList")
    public String cardList(@RequestParam(defaultValue = "1") Integer pageNum,
                           String keyword, HttpSession session, HttpServletRequest request) {
        MyUser user = (MyUser) session.getAttribute("user");
        if (user == null) {
            return "redirect:/toLogin";
        }

        int pageSize = 5;

        if (keyword != null && !keyword.trim().isEmpty()) {
            // 搜索模式
            List<Card> cardList = cardService.searchCards(keyword, user.getId(), pageNum, pageSize);
            int totalCount = cardService.countSearchCards(keyword, user.getId());
            Map<String, Object> pageInfo = cardService.getPageInfo(totalCount, pageNum, pageSize);

            request.setAttribute("cardList", cardList);
            request.setAttribute("pageInfo", pageInfo);
            request.setAttribute("keyword", keyword);
        } else {
            // 普通分页
            Card card = new Card();
            card.setUserId(user.getId());
            card.setStartIndex((pageNum - 1) * pageSize);
            card.setPageSize(pageSize);

            List<Card> cardList = cardService.findCardsByPage(card);
            int totalCount = cardService.countCards(card);
            Map<String, Object> pageInfo = cardService.getPageInfo(totalCount, pageNum, pageSize);

            request.setAttribute("cardList", cardList);
            request.setAttribute("pageInfo", pageInfo);
        }

        return "main";
    }

    /**
     * 跳转到添加名片页面
     */
    @RequestMapping("/toAddCard")
    public String toAddCard() {
        return "addCard";
    }

    /**
     * 添加名片
     */
    @RequestMapping("/addCard")
    public String addCard(Card card, @RequestParam("logoFile") MultipartFile logoFile,
                          HttpSession session, HttpServletRequest request) {
        MyUser user = (MyUser) session.getAttribute("user");
        if (user == null) {
            return "redirect:/toLogin";
        }

        try {
            // 处理文件上传
            if (!logoFile.isEmpty()) {
                String uploadPath = request.getServletContext().getRealPath("/upload");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                String fileName = MyUtil.createFileName(logoFile.getOriginalFilename());
                logoFile.transferTo(new File(uploadDir, fileName));
                card.setLogo("upload/" + fileName);
            }

            card.setUserId(user.getId());
            cardService.addCard(card);

            return "redirect:/cardList";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "添加名片失败：" + e.getMessage());
            return "addCard";
        }
    }

    /**
     * 跳转到修改名片页面
     */
    @RequestMapping("/toUpdateCard")
    public String toUpdateCard(Integer id, HttpServletRequest request) {
        Card card = cardService.findCardById(id);
        request.setAttribute("card", card);
        return "updateCard";
    }

    /**
     * 修改名片
     */
    @RequestMapping("/updateCard")
    public String updateCard(Card card, @RequestParam("logoFile") MultipartFile logoFile,
                             HttpServletRequest request) {
        try {
            // 处理文件上传
            if (!logoFile.isEmpty()) {
                String uploadPath = request.getServletContext().getRealPath("/upload");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                String fileName = MyUtil.createFileName(logoFile.getOriginalFilename());
                logoFile.transferTo(new File(uploadDir, fileName));
                card.setLogo("upload/" + fileName);
            }

            cardService.updateCard(card);
            return "redirect:/cardList";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "修改名片失败：" + e.getMessage());
            Card oldCard = cardService.findCardById(card.getId());
            request.setAttribute("card", oldCard);
            return "updateCard";
        }
    }

    /**
     * 删除名片
     */
    @RequestMapping("/deleteCard")
    public String deleteCard(Integer id) {
        cardService.deleteCard(id);
        return "redirect:/cardList";
    }
}
