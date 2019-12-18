package cn.bdqn.controller;

import cn.bdqn.domain.User;
import cn.bdqn.service.ArticleService;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/user")
@SessionAttributes(value = {"users"})
public class UserController {

    @Autowired
    private UserService userService;

    //跳转登录页面
    @RequestMapping(value = "/skipLogin")
    public String skipLogin(){

        return "login";
    }

    @RequestMapping("/addUserInfo")
    public String addUserInfo(User user,Model model){

        userService.insertUserInfo(user);

        return "login";
    }

    @RequestMapping("/LoginVerify")
    public String loginVerify(String userEamil, String userPassword, ModelMap model){

        User user = userService.selectUserByUserInfo(userEamil,userPassword);

        if(user != null){
            model.addAttribute("users",user);

            return "main";
        }else{
            return "hint";
        }
    }

    @RequestMapping("/EmailVerify")
    @ResponseBody
    public String EmailVerify(String userEamil){

        int num = userService.selectNumByEmail(userEamil);
        System.out.println(num);

        return String.valueOf(num);
    }

}
