package cn.bdqn.controller;

import cn.bdqn.domain.User;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/user")
@SessionAttributes(names = "user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/addUserInfo")
    public String addUserInfo(User user,Model model){

        userService.insertUserInfo(user);

        return "login";
    }

    @RequestMapping("/LoginVerify")
    public String loginVerify(String nickName,String email, String pwd, Model model){

        User user = userService.selectUserByUserInfo(nickName,email,pwd);

        model.addAttribute("user",user);

        return "main";
    }

    @RequestMapping("/EmailVerify")
    @ResponseBody
    public String EmailVerify(String userEamil){

        int num = userService.selectNumByEmail(userEamil);
        System.out.println(num);

        return String.valueOf(num);
    }

}
