package cn.bdqn.controller;

import cn.bdqn.domain.User;
import cn.bdqn.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    //获得最大的文章编号
    //required = false 作用 当session没有数据时也不会报错
    @RequestMapping(value = "/queryMaxArticleId")
    public String queryMaxArticleId(@SessionAttribute(value = "users",required = false) User user){

        Integer maxArticleId = articleService.getMaxArticleId();

        System.out.println(maxArticleId);

        System.out.println(user);

        return "writeBlog";
    }
}
