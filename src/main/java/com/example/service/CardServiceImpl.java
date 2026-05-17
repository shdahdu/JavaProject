package com.example.service;

import com.example.dao.CardMapper;
import com.example.model.Card;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 名片业务逻辑实现类
 */
@Service("cardService")
public class CardServiceImpl implements CardService {

    @Autowired
    private CardMapper cardMapper;

    @Override
    public int addCard(Card card) {
        return cardMapper.addCard(card);
    }

    @Override
    public int deleteCard(Integer id) {
        return cardMapper.deleteCard(id);
    }

    @Override
    public int updateCard(Card card) {
        return cardMapper.updateCard(card);
    }

    @Override
    public Card findCardById(Integer id) {
        return cardMapper.findCardById(id);
    }

    @Override
    public List<Card> findCardsByPage(Card card) {
        return cardMapper.findCardsByPage(card);
    }

    @Override
    public int countCards(Card card) {
        return cardMapper.countCards(card);
    }

    @Override
    public List<Card> searchCards(String keyword, Integer userId, Integer pageNum, Integer pageSize) {
        Integer startIndex = (pageNum - 1) * pageSize;
        return cardMapper.searchCards(keyword, userId, startIndex, pageSize);
    }

    @Override
    public int countSearchCards(String keyword, Integer userId) {
        return cardMapper.countSearchCards(keyword, userId);
    }

    @Override
    public Map<String, Object> getPageInfo(int totalCount, int pageNum, int pageSize) {
        Map<String, Object> pageMap = new HashMap<>();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        pageMap.put("totalCount", totalCount);
        pageMap.put("totalPages", totalPages);
        pageMap.put("pageNum", pageNum);
        pageMap.put("pageSize", pageSize);

        // 生成分页按钮列表
        List<Integer> pageList = new ArrayList<>();
        int startPage = Math.max(1, pageNum - 2);
        int endPage = Math.min(totalPages, pageNum + 2);
        for (int i = startPage; i <= endPage; i++) {
            pageList.add(i);
        }
        pageMap.put("pageList", pageList);

        return pageMap;
    }
}
