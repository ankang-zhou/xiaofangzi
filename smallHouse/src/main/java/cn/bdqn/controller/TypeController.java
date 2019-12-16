package cn.bdqn.controller;
/*
类型Controller
 */

import cn.bdqn.domain.Type;
import cn.bdqn.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/type")
public class TypeController {

    @Autowired
    private TypeService typeService;

    //查询所有的博客类型
    @RequestMapping(value = "/queryAllTypes")
    public String queryAllTypes(ModelMap modelMap){

        List<Type> typeList = typeService.selectTypeList();

        modelMap.addAttribute("typeList",typeList);

        return "writeBlog";
    }

}
