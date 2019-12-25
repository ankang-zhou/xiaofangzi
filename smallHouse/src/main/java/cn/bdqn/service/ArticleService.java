package cn.bdqn.service;

import cn.bdqn.domain.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleService {

    //获得最大的文章编号
    public Integer getMaxArticleId();

    //添加博客
    public Integer addArticle(Article article);

    //根据文章Id查询文章内容(标题，作者，时间，浏览人数，简介，内容，点赞个数)
    public Article selectArticleById(Integer articleId);

    //根据标题模糊查询博客头内容(只显示标题，(文章图片)简介,作者，时间，浏览人数，点赞个数)
    public List<Article> selectArticlesByTitle(String articleTitle);

    //根据用户id查询文章内容
    public List<Article> selectArticleByUserId(@Param("Id") int Id);

    public List<Article> selectArticleList();
}
