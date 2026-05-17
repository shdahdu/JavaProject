package com.example.dao;

import com.example.model.Card;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 名片数据访问接口
 */
public interface CardMapper {

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
     * 根据条件搜索名片
     */
    List<Card> searchCards(@Param("keyword") String keyword,
                           @Param("userId") Integer userId,
                           @Param("startIndex") Integer startIndex,
                           @Param("pageSize") Integer pageSize);

    /**
     * 根据条件搜索名片总数
     */
    int countSearchCards(@Param("keyword") String keyword,
                         @Param("userId") Integer userId);
}
