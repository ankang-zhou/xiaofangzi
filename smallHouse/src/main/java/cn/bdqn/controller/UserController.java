package cn.bdqn.controller;

import cn.bdqn.domain.User;
import cn.bdqn.service.ArticleService;
import cn.bdqn.service.UserService;
import cn.bdqn.utils.StringSplitUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

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

        return String.valueOf(num);
    }

    @RequestMapping("/SkipAmend")
    public String skipAmend(int id,Model model){

        model.addAttribute("user",userService.selectInfoByUserId(id));

        return "amend";
    }

    @RequestMapping("/SkipPersonalPage")
    public String skipPersonalPage(int id,Model model){

        id = 1;
        User user = userService.selectInfoByUserId(id);
        String[] strings = StringSplitUtils.splitString(user.getUserFans(), "，");
        String[] strings1 = StringSplitUtils.splitString(user.getUserAttention(), "，");

        List<User> userFansList = userService.selectUsersInfoByIds(strings);
        List<User> userAttentionList =userService.selectUsersInfoByIds(strings1);


//        System.out.println(userFansList.get(0).getUserNickname());
//        System.out.println(userAttentionList.get(0).getUserNickname());
        model.addAttribute("userAttention",userAttentionList);
        model.addAttribute("userFans",userFansList);
        model.addAttribute("userInfo",user);

        return "personalPage";
    }

    @RequestMapping("/UpdateUserInfo")
    public String updateUserInfo(User user){

        System.out.println(user.getUserId());

        userService.updateUserInfo(user);

        return "";

    }

}
