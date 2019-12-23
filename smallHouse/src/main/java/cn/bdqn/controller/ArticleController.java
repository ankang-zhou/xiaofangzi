package cn.bdqn.controller;

import cn.bdqn.domain.Article;
import cn.bdqn.domain.User;
import cn.bdqn.service.ArticleService;
import cn.bdqn.utils.BlogImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * Article Controller
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/saveArticle")
    public String saveArticle(@SessionAttribute(value = "users",required = false)User user
            , Article article, HttpServletRequest request,MultipartFile photo)throws Exception{


        //从Session中获取用户Id
        Integer userId = user.getUserId();

        //获取发表文章内容
        String articleTitle = article.getArticleTitle(); //标题

        //String articlePhoto = article.getArticlePhoto(); //图片
        //处理图片上传
        String realPath = request.getSession().getServletContext().getRealPath("/"); //获得真实路径

        String articlePhoto = BlogImageUtil.uploadImage(photo,realPath);
        //end


        Integer typeId = article.getTypeId();   //类别

        String articleSummary = article.getArticleSummary();//简介

        String articleContent = article.getArticleContent();//内容

        article.setArticleTitle(articleTitle);
        article.setTypeId(typeId);
        article.setArticleSummary(articleSummary);
        article.setArticleContent(articleContent);
        article.setArticlePhoto(articlePhoto);
        article.setUserId(userId);

        Integer count  = articleService.addArticle(article);

        return "main";
    }

    //根据标题模糊查询所有博客内容
    @RequestMapping(value = "/queryArticle")
    public String queryArticleByTitle(ModelMap modelMap,String articleTitle){

        articleTitle = "天气"; //模拟搜索

        List<Article> articles = articleService.selectArticlesByTitle(articleTitle);

        //将article列表放在ModelMap中
        modelMap.addAttribute("articles",articles);

        return "showBlog";
    }

    //根据文章Id查询文章内容
    @RequestMapping(value = "/ArticleById")
    public String queryArticleById(ModelMap modelMap,Integer articleId){

        articleId = 6; //模拟点击要查看的文章，获取了文章Id

        Article article = articleService.selectArticleById(articleId);

        //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        //将article放在ModelMap中
        modelMap.addAttribute("article",article);

        return "blogContent";
    }

}
