package cn.bdqn.controller;

import cn.bdqn.domain.User;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/user")
@SessionAttributes(names = "user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/addUserInfo")
    public String addUserInfo(User user){

        userService.insertUserInfo(user);

        return "Login";
    }

    @RequestMapping("/LoginVerify")
    public String LoginVerify(String email, String pwd, Model model){

        User user = userService.selectUserByUserInfo(email,pwd);

        model.addAttribute("user",user);

        return "main";
    }

}
