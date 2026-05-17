package com.example.service;

import com.example.model.Card;

import java.util.List;
import java.util.Map;

/**
 * 名片业务逻辑接口
 */
public interface CardService {

    /**
     * 添加名片
     */
    int addCard(Card card);

    /**
     * 删除名片
     */
    int deleteCard(Integer id);

    /**
     * 修改名片
     */
    int updateCard(Card card);

    /**
     * 根据ID查询名片
     */
    Card findCardById(Integer id);

    /**
     * 分页查询名片列表
     */
    List<Card> findCardsByPage(Card card);

    /**
     * 查询名片总数
     */
    int countCards(Card card);

    /**
     * 搜索名片（带分页）
     */
    List<Card> searchCards(String keyword, Integer userId, Integer pageNum, Integer pageSize);

    /**
     * 搜索名片总数
     */
    int countSearchCards(String keyword, Integer userId);

    /**
     * 获取分页信息
     */
    Map<String, Object> getPageInfo(int totalCount, int pageNum, int pageSize);
}
