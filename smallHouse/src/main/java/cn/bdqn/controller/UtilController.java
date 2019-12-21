package cn.bdqn.controller;

import cn.bdqn.utils.ImageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/utilController")
public class UtilController {
    /**
     上传图片
     * @Title: uploadImage
     * @Description: 上传图片
     * @param: image要上传的图片
     * @param request
     * @return Map<String, Object> location(图片要上传的位置)
     * @throws
     */
    /*实现思路
    * 工具类ImageUtil
    *
    *
    * */
    @RequestMapping(value = "/uploadImage")
    @ResponseBody
    public Map<String, Object> uploadImage(@RequestParam("file") MultipartFile file,
                                           HttpServletRequest request) throws Exception {

        Map<String, Object> ret = new HashMap<>();

        String realPath = request.getSession().getServletContext().getRealPath("/"); //获得真实路径

        Integer userId = Integer.parseInt(request.getParameter("userId"));//获得用户Id

        Integer maxArticleId = Integer.parseInt(request.getParameter("maxArticleId")); // 获得最大的文章编号

        Integer articleId = maxArticleId+1;//当前文章编号

        String location = ImageUtil.uploadImage(file, realPath, userId, articleId);

        ret.put("location", location);

        return ret;
    }

}
