package cn.bdqn.service.impl;

import cn.bdqn.mapper.ArticleMapper;
import cn.bdqn.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public Integer getMaxArticleId() {
        return articleMapper.getMaxArticleId();
    }
}
