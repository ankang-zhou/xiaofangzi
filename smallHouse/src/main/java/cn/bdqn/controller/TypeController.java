package cn.bdqn.controller;
/*
类型Controller
 */

import cn.bdqn.domain.Type;
import cn.bdqn.domain.User;
import cn.bdqn.service.ArticleService;
import cn.bdqn.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
@RequestMapping("/type")
public class TypeController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private TypeService typeService;

    //@SessionAttribute 获取Session中的数据，将required = false 即使Session为空也不会报错
    //查询所有的博客类型
    @RequestMapping(value = "/queryAllTypes")
    public String queryAllTypes(@SessionAttribute(value = "users",required = false) User user,ModelMap modelMap){

        List<Type> typeList = typeService.selectTypeList();

        Integer maxArticleId = articleService.getMaxArticleId();
        //类型列表
        modelMap.addAttribute("typeList",typeList);
        //最大的文章数
        modelMap.addAttribute("maxArticleId",maxArticleId);
        //从Session中获取用户Id
        Integer userId = user.getUserId();
        //将用户Id放在Request作用域中
        modelMap.addAttribute("userId",userId);

        return "writeBlog";
    }



}
