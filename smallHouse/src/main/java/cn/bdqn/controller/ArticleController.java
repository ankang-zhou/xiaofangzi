package cn.bdqn.controller;

import cn.bdqn.domain.Article;
import cn.bdqn.domain.User;
import cn.bdqn.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 * Article Controller
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/saveArticle")
    public String saveArticle(Article article){

        //获取发表文章内容
        String articleTitle = article.getArticleTitle(); //标题

        //String articlePhoto = article.getArticlePhoto(); //图片

        Integer typeId = article.getTypeId();   //类别

        String articleSummary = article.getArticleSummary();//简介

        String articleContent = article.getArticleContent();//内容

        System.out.println("标题:"+articleTitle
                +"/n类别:"+typeId
                +"/n简介:"+articleSummary
                +"/n内容:"+articleContent);

        return "main";
    }


}
