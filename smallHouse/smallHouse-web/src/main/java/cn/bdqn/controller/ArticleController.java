package cn.bdqn.controller;

import cn.bdqn.domain.*;
import cn.bdqn.service.ArticleService;
import cn.bdqn.service.CommentService;
import cn.bdqn.service.GreatService;
import cn.bdqn.service.TypeService;
import cn.bdqn.utils.BlogImageUtil;
import cn.bdqn.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Article Controller
 */
@Controller
@RequestMapping("/article")
@SessionAttributes(value = ("articleSession"))
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private GreatService greatService;

    @Autowired
    private CommentService commentService;

    //写博客
    @RequestMapping(value = "/saveArticle")
    public String saveArticle(@SessionAttribute(value = "users",required = false) User user
            , Article article, HttpServletRequest request, MultipartFile photo)throws Exception{

        //从Session中获取用户Id
        Integer userId = user.getUserId();

        //获取发表文章内容
        String articleTitle = article.getArticleTitle(); //标题

        //String articlePhoto = article.getArticlePhoto(); //图片
        //处理图片上传
        String realPath = request.getSession().getServletContext().getRealPath("/"); //获得真实路径

        String articlePhoto = BlogImageUtil.uploadImage(photo,realPath);
        //end
        Integer typeId = article.getTypeId();   //类别

        String articleSummary = article.getArticleSummary();//简介

        String articleContent = article.getArticleContent();//内容

        article.setArticleTitle(articleTitle);
        article.setTypeId(typeId);
        article.setArticleSummary(articleSummary);
        article.setArticleContent(articleContent);
        article.setArticlePhoto(articlePhoto);
        article.setUserId(userId);

        Integer count  = articleService.addArticle(article);

        return "redirect:/article/mainYe";
    }

    //根据标题模糊查询所有博客内容
    @RequestMapping(value = "/queryArticle")
    public String queryArticleByTitle(ModelMap modelMap,String articleTitle){


        List<Article> articles = articleService.selectArticlesByTitle(articleTitle);

        //显示推荐的文章列表【根据浏览量和点赞量降序10条信息】
        List<Article> articleTop = articleService.selectRecommendArticleList();

        if (articles.size() == 0){
            articles = null;
            //将articleTop列表放在ModelMap中
            modelMap.addAttribute("articleTop",articleTop);
        }else {
            //将article列表放在ModelMap中
            modelMap.addAttribute("articleTop",articleTop);

            modelMap.addAttribute("articles",articles);
        }

        return "showBlog";
    }

    //根据文章Id查询文章内容
    @RequestMapping(value = "/ArticleById")
    public String queryArticleById(@SessionAttribute(value = "articleSession",required = false) Article articles, ModelMap modelMap, Integer articleId){

        //查看方法时先判断Session是否为空，为空先将浏览量+1，再查出数据，将数据保存Session中
        //不为空就是 不是第一次点击的时候，Session中有数据，判断Session中的文章id和当前点击的
        //文章id是否相同，相同浏览量不变，不同浏览量则加1。
        if(articles != null){
            if(articles.getArticleId() != articleId){
                articleService.updateArticlePageView(articleId);
            }
        }else {
            articleService.updateArticlePageView(articleId);
        }

        List<Comment> list = commentService.selectCommentById(1);

        for (Comment com:list
        ) {
            System.out.println(com.getCommentId());
            com.setReplyComment(commentService.selectReplyCommentByCommentId(com));
        }

        modelMap.addAttribute("comments",list);

        articles = articleService.selectArticleById(articleId);
        //将article放在ModelMap中
        modelMap.addAttribute("article",articles);

        //将articleSession放在Session作用域中
        modelMap.addAttribute("articleSession",articles);

        return "blogContent";
    }

    //查询文章列表
    @RequestMapping(value = "/articleList")
    public String queryArticleList(@SessionAttribute(value = "users",required = false) User user, ModelMap modelMap){

        //接收查询到的所有文章信息
        List<Article> articleList = articleService.selectArticleList();

        //接收查询到的所有类型信息
        List<Type> typeList = typeService.selectTypeList();

        //显示推荐的文章列表【根据浏览量和点赞量降序10条信息】
        List<Article> articleTop = articleService.selectRecommendArticleList();

        //将数据放在ModelMap中
        modelMap.addAttribute("articleList",articleList);

        modelMap.addAttribute("typeList",typeList);

        modelMap.addAttribute("articleTop",articleTop);

        return "main";
    }

    //删除文章
    @RequestMapping("/DelArticleById")
    public String delArticleById(int id){

        articleService.delArticleById(id);

        return "forward:/user/SkipPersonalPage";
    }

    //点赞
    @RequestMapping("/like")
    @ResponseBody
    public String giveALike(Integer articleId,Integer userId){
        Integer count;

        System.out.println("文章Id："+articleId+"用户Id："+userId);
        System.out.println("进来了");

        //首先根据文章Id查询文章
        Article article = articleService.selectArticleById(articleId);
        System.out.println(article);
        //然后根据文章Id，和用户Id查询点赞表。
        List<Great> list = greatService.findByArticleIdAndUserId(articleId,userId);
        System.out.println(list);
        //查询是否有该用户对该文章的点赞记录
        if(list != null && list.size() > 0){
            //如果找到了这条记录，则删除该记录，同时文章的点赞数减1
            Great great=list.get(0);
            greatService.delByGreatId(great.getGreatId());
            System.out.println("删除了");
            //执行文章点赞数减1更新
            count = article.getArticleLike()-1;
            articleService.updateArticleLikeById(count,articleId);
        }else{
            //如果没有找到这条记录，则添加这条记录，同时文章点赞数加1
            Great great=new Great();
            great.setArticleId(articleId);
            great.setUserId(userId);

            System.out.println(great);

            //添加记录
            greatService.insertGreat(great);
            //文章点赞数加1
            count = article.getArticleLike()+1;
            System.out.println("添加了");
            articleService.updateArticleLikeById(count,articleId);
        }
        return count.toString();
    }

    //根据文章类别查询文章列表
    @RequestMapping(value = "/articleListByTypeId")
    public String queryArticleListByTypeId(Integer typeId, ModelMap modelMap){

        //接收查询到的所有文章信息
        List<Article> articleList = articleService.selectArticleListByTypeId(typeId);

        //接收查询到的所有类型信息
        List<Type> typeList = typeService.selectTypeList();

        //显示推荐的文章列表【根据浏览量和点赞量降序10条信息】
        List<Article> articleTop = articleService.selectRecommendArticleList();

        //将数据放在ModelMap中
        modelMap.addAttribute("articleList",articleList);

        modelMap.addAttribute("typeList",typeList);

        modelMap.addAttribute("articleTop",articleTop);

        return "main";
    }

    //显示全部文章信息，使用layui流加载
    @RequestMapping(value = "/allArticles",method = RequestMethod.GET)
    @ResponseBody
    public PageResult<List<Article>> allArticles(Integer page,Integer limit) {

        //会自动传入limit和page

        //分页查询，需要参数code（要为0，不然数据表格数据显示不出）,msg（返回的消息），
        // data(表格显示的数据)，totals(查询到数据的总记录数)
        List<Article> articleList = articleService.selectListLimit(page,limit);
        //返回总的记录数
        Integer count = articleService.selectCount();
        PageResult<List<Article>> listPageResult = new PageResult<List<Article>>("",articleList,0,count);

        return listPageResult;
    }

    //打开网页默认显示页面
    @RequestMapping(value = "/mainYe")
    public String mainYe(ModelMap modelMap){

        //接收查询到的所有类型信息
        List<Type> typeList = typeService.selectTypeList();

        //显示推荐的文章列表【根据浏览量和点赞量降序10条信息】
        List<Article> articleTop = articleService.selectRecommendArticleList();

        //将数据放在ModelMap中
        modelMap.addAttribute("typeList",typeList);

        modelMap.addAttribute("articleTop",articleTop);

        return "main";
    }

}
