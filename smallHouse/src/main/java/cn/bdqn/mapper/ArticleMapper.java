package cn.bdqn.mapper;

import cn.bdqn.domain.Article;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer articleId);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer articleId);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);
}