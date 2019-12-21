package cn.bdqn.service;

import cn.bdqn.domain.Article;

public interface ArticleService {

    //获得最大的文章编号
    public Integer getMaxArticleId();

    //添加博客
    public Integer addArticle(Article article);
}
