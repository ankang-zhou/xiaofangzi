package cn.bdqn.service.impl;

import cn.bdqn.domain.Article;
import cn.bdqn.mapper.ArticleMapper;
import cn.bdqn.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public Integer getMaxArticleId() {
        return articleMapper.getMaxArticleId();
    }

    @Override
    public Integer addArticle(Article article) {
        return articleMapper.insertSelective(article);
    }

    @Override
    public Article selectArticleById(Integer articleId) {
        return articleMapper.selectArticleById(articleId);
    }

    @Override
    public List<Article> selectArticlesByTitle(String articleTitle) {
        return articleMapper.selectArticlesByTitle(articleTitle);
    }

    @Override
    public List<Article> selectArticleList() {
        return articleMapper.selectArticleList();
    }


}
