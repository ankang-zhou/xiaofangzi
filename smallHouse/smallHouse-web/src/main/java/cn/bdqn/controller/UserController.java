package cn.bdqn.controller;

import cn.bdqn.domain.Address;
import cn.bdqn.domain.Article;
import cn.bdqn.domain.User;
import cn.bdqn.service.AddressService;
import cn.bdqn.service.ArticleService;
import cn.bdqn.service.UserService;
import cn.bdqn.utils.BlogImageUtil;
import cn.bdqn.utils.MD5Util;
import cn.bdqn.utils.StringSplitUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
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
    public String addUserInfo(User user, Model model){
        //用户密码加密

        user.setUserPassword(MD5Util.toMd5(user.getUserPassword()));
        System.out.println(MD5Util.toMd5(user.getUserPassword()));
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
        String pwd = MD5Util.toMd5(userPassword);

        User user = userService.selectUserByUserInfo(userEamil,pwd);

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

    /**
     * 跳转个人中心
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/SkipPersonalPage")
    public String skipPersonalPage(@SessionAttribute(value = "users") User user, Model model){
        user = userService.selectInfoByUserId(user.getUserId());
        List<User> userFansList = null;
        List<User> userAttentionList = null;
        if (user.getUserFans()!=null&&!user.getUserFans().equals("")){
            String[] strings = StringSplitUtils.splitString(user.getUserFans(), ",");
            List<String> list = new ArrayList<String>();
            list = Arrays.asList(strings);
            list.remove(" ");
            userFansList = userService.selectUsersInfoByIds(list);
        }
        if(user.getUserAttention()!=null&&!user.getUserAttention().equals("")){
            String[] strings1 = StringSplitUtils.splitString(user.getUserAttention(), ",");
            List<String> list = new ArrayList<String>();
            list = Arrays.asList(strings1);
            list.remove(" ");
            userAttentionList =userService.selectUsersInfoByIds(list);
        }
        List<Address> addresses = addressService.selectAllStair();
        List<Article> articles = articleService.selectArticleByUserId(user.getUserId());
        String address = "";
        if(user.getUserAddress()!=0){
            Address cityAddress = addressService.selectInfoById(user.getUserAddress());
            Address provinceAddress = addressService.selectParentLevelById(cityAddress.getAddressId());
            Address nationAddress = addressService.selectParentLevelById(provinceAddress.getAddressId());
            address = nationAddress.getAddressName()+provinceAddress.getAddressName()+cityAddress.getAddressName();
        }
        model.addAttribute("articles",articles);
        model.addAttribute("address",address);
        model.addAttribute("users",user);
        model.addAttribute("userAttention",userAttentionList);
        model.addAttribute("userFans",userFansList);
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
    public String fileUpLoad(@SessionAttribute(value = "users") User user, HttpServletRequest request, MultipartFile photo)throws Exception{

        String realPath = request.getSession().getServletContext().getRealPath("/"); //获得真实路径

        String articlePhoto = BlogImageUtil.uploadImage(photo,realPath);

        user.setUserHead(articlePhoto);

        userService.updateUserInfo(user);

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

        List<User> fanss = null;
        List<User> attentions = null;
        if (user.getUserFans()!=null&&!user.getUserFans().equals("")){
            String[] strings = StringSplitUtils.splitString(user.getUserFans(), ",");
            List<String> list = new ArrayList<String>();
            list = Arrays.asList(strings);
            list.remove(" ");
            fanss = userService.selectUsersInfoByIds(list);
        }
        if(user.getUserAttention()!=null&&!user.getUserAttention().equals("")){
            String[] strings1 = StringSplitUtils.splitString(user.getUserAttention(), ",");
            List<String> list = new ArrayList<String>();
            list = Arrays.asList(strings1);
            list.remove(" ");
            attentions =userService.selectUsersInfoByIds(list);
        }

        model.addAttribute("userAttention",attentions);
        model.addAttribute("userFans",fanss);
        model.addAttribute("userInfo",user);
        model.addAttribute("userArticle",articles);

        return "userMainPage";
    }


    //清空Session
    @RequestMapping(value = "/validateSession")
    public String validateSession(SessionStatus status) {

        //清空
        status.setComplete();

        return "redirect:/article/articleList";
    }

    //取消关注
    @RequestMapping("/CancelAttention")
    //要取消关注的id
    public String cancelAttention(@SessionAttribute(value = "users") User user,int id){
        String[] attentions = StringSplitUtils.splitString(user.getUserAttention(),",");
        String attention = "";
        String Id = id+"";
        for (int i = 0;i<attentions.length;i++){
            if (!attentions[i].equals(Id)){
                attention = attention+attentions[i]+",";
            }
        }
        user.setUserAttention(attention);
        userService.cancelAttention(user);
        return "forward:/user/SkipPersonalPage";
    }

    //增加关注
    @RequestMapping("/AddAttention")
    //要添加关注的id
    public String addAttention(@SessionAttribute(value = "users") User user,int id){
        String attention =user.getUserAttention();
        if (attention==null||attention.equals("")){
            attention = id+"";
        }else {
            attention = attention+","+id;
        }
        user.setUserAttention(attention);
        userService.Attention(user);
        return "forward:/user/SkipPersonalPage";
    }
}
