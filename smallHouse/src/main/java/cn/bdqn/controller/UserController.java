package cn.bdqn.controller;

import cn.bdqn.domain.Address;
import cn.bdqn.domain.Article;
import cn.bdqn.domain.User;
import cn.bdqn.service.AddressService;
import cn.bdqn.service.ArticleService;
import cn.bdqn.service.UserService;
import cn.bdqn.utils.BlogImageUtil;
import cn.bdqn.utils.StringSplitUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
@SessionAttributes(value = {"users"})
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private AddressService addressService;

    //跳转登录页面
    @RequestMapping(value = "/skipLogin")
    public String skipLogin(){

        return "login";
    }

    /**
     * 添加用户信息
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/addUserInfo")
    public String addUserInfo(User user,Model model){

        userService.insertUserInfo(user);

        return "login";
    }

    /**
     * 登录验证
     * @param userEamil
     * @param userPassword
     * @param model
     * @return
     */
    @RequestMapping("/LoginVerify")
    public String loginVerify(String userEamil, String userPassword, ModelMap model){

        User user = userService.selectUserByUserInfo(userEamil,userPassword);

        if(user != null){
            model.addAttribute("users",user);

            //重定向到主页面
            return "redirect:/article/articleList";
        }else{
            return "hint";
        }
    }

    /**
     * 用户邮箱验证
     * @param userEamil
     * @return
     */
    @RequestMapping("/EmailVerify")
    @ResponseBody
    public String EmailVerify(String userEamil){

        int num = userService.selectNumByEmail(userEamil);

        return String.valueOf(num);
    }

//    /**
//     * 跳转修改信息页面
//     */
//    @RequestMapping("/SkipAmend")
//    public String skipAmend(int id,Model model){
//
//        model.addAttribute("user",userService.selectInfoByUserId(id));
//
//        return "amend";
//    }

    /**
     * 跳转个人中心
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/SkipPersonalPage")
    public String skipPersonalPage(@SessionAttribute(value = "users")User user, Model model){
        user = userService.selectInfoByUserId(user.getUserId());
        String[] strings = StringSplitUtils.splitString(user.getUserFans(), "，");
        String[] strings1 = StringSplitUtils.splitString(user.getUserAttention(), "，");

        List<User> userFansList = userService.selectUsersInfoByIds(strings);
        List<User> userAttentionList =userService.selectUsersInfoByIds(strings1);
        List<Address> addresses = addressService.selectAllStair();
        String address = "";
        if(user.getUserAddress()!=null||user.getUserAddress()!=0){
            Address cityAddress = addressService.selectInfoById(user.getUserAddress());
            System.out.println(cityAddress.getAddressName());
            Address provinceAddress = addressService.selectParentLevelById(cityAddress.getAddressId());
            System.out.println(provinceAddress.getAddressName());
            Address nationAddress = addressService.selectParentLevelById(provinceAddress.getAddressId());
            System.out.println(nationAddress.getAddressName());


            address = nationAddress.getAddressName()+provinceAddress.getAddressName()+cityAddress.getAddressName();
        }

        model.addAttribute("address",address);
        model.addAttribute("userAttention",userAttentionList);
        model.addAttribute("userFans",userFansList);
        model.addAttribute("users",user);
        model.addAttribute("addresses",addresses);
        return "personalPage";
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @RequestMapping("/UpdateUserInfo")
    public String updateUserInfo(User user){

        if(user.getUserAddress()==-1){
            user.setUserAddress(null);
        }

        userService.updateUserInfo(user);

        return "forward:/user/SkipPersonalPage";

    }

    /**
     * 文件上传
     * @param user
     * @param request
     * @param photo
     * @return
     * @throws Exception
     */
    @RequestMapping("/FileUpLoad")
    public String fileUpLoad(@SessionAttribute(value = "users")User user,HttpServletRequest request, MultipartFile photo)throws Exception{

        String realPath = request.getSession().getServletContext().getRealPath("/"); //获得真实路径

        String articlePhoto = BlogImageUtil.uploadImage(photo,realPath);

        user.setUserHead(articlePhoto);

        userService.updateUserInfo(user);

        System.out.println(user.getUserHead());

        return "forward:/user/SkipPersonalPage";
    }

    /**
     * 跳转用户个人主页
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/SkipUserPage")
    public String skipUserPage(int id,Model model){

        List<Article> articles = articleService.selectArticleByUserId(id);

        User user = userService.selectInfoByUserId(id);

        String[] fans = StringSplitUtils.splitString(user.getUserFans(), ",");
        String[] attention = StringSplitUtils.splitString(user.getUserAttention(),",");

        List<User> fanss = userService.selectUsersInfoByIds(fans);
        List<User> attentions = userService.selectUsersInfoByIds(attention);

        model.addAttribute("userAttention",attentions);
        model.addAttribute("userFans",fanss);
        model.addAttribute("userInfo",user);
        model.addAttribute("userArticle",articles);

        return "userMainPage";
    }

}
