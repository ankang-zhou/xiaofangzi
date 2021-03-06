<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2019/12/22
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>${article.articleTitle}</title>
    <link href="https://cdn.bootcss.com/font-awesome/5.8.0/css/all.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/header.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/blogContent.css">
    <link media="(max-width:768px)" rel="stylesheet" href="${ctx}/static/css/blogContentMobile.css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.12.4.js"></script>
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<header id="header">
    <a href="${ctx}/article/articleList">
        <i id="menu" class="layui-icon layui-icon-home"></i>
    </a>
    <nav>
        <ul id="lul" class="layui-nav" lay-filter="">
            <li class="layui-nav-item"><a href="">最新活动</a></li>
            <li id="homeMenu" class="layui-nav-item layui-this"><a href="${ctx}/article/mainYe">首页</a></li>
            <li class="layui-nav-item"><a href="">大数据</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">解决方案</a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="">移动模块</a></dd>
                    <dd><a href="">后台模版</a></dd>
                    <dd><a href="">电商平台</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">社区</a></li>
        </ul>

        <div class="search-box">
            <input id="searchText" class="search-txt " type="text" value="java"/>
            <a id="button" class="search-btn button" href="#">
                <i class="fas fa-search"></i>
            </a>
        </div>

        <ul id="rul" class="layui-nav">
            <c:if test="${users.userId != null}">
                <li class="layui-nav-item">
                    <a href="${ctx}/type/queryAllTypes">
                        <i class="layui-icon layui-icon-edit" style="font-size: 15px; color: white;"></i>写博客
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="${ctx}">个人中心<span class="layui-badge-dot"></span></a>
                </li>
                <li class="layui-nav-item">
                    <a href=""><img src="${ctx}/${users.userHead}" class="layui-nav-img"></a>
                    <dl class="layui-nav-child">
                        <dd><a href="${ctx}">个人主页</a></dd>
                        <dd><a href="${ctx}">个人中心</a></dd>
                        <dd><a href="${ctx}">退出</a></dd>
                    </dl>
                </li>
            </c:if>
            <c:if test="${users.userId == null}">
                <li class="layui-nav-item">
                    <a href="${ctx}/login">登录/注册</a>
                </li>
            </c:if>
        </ul>
    </nav>
</header>
<div class="clear"></div>
<div class="container">
    <div class="space_container"></div>
    <main>
        <div class="blog-content-box">
            <div class="article-head">
                <h1 class="title">${article.articleTitle}</h1>
                <p>
                <ul>
                    <li class="typeName">${article.typeName}</li>
                    <li class="userName">
                        <a href="">${article.userNickName}</a>
                    </li>
                    <li><fmt:formatDate value="${article.articleTime}" pattern="yyyy年MM月dd日 HH:mm:SS"/></li>
                    <li>浏览${article.articlePageview}</li>
                </ul>
                </p>
            </div>
            <article class="article-content" >
                <div class="content">
                    <p>${article.articleSummary}</p>
                    <p>${article.articleContent}</p>
                </div>
                <div class="toolBox">
                    点赞
                </div>
            </article>
            <a id="commentBox" name="commentBox"></a>
            <div id="commentMain">
                <div id="replyComment">
                    <form action="${ctx}/comment/AddComment" method="post" id="form">
                        <p><img src="${ctx}/${users.userHead}">&nbsp;${users.userNickname}：</p>
                        <!--文章id-->
                        <input type="hidden" id="article_id" name="articleId" value="1"/>
                        <!--被回复评论的id，当没有被回复人时value为0-->
                        <input type="hidden" value="0" id="comment_reply" name="commentReply"/>
                        <!--回复人id也就是用户id-->
                        <input type="hidden" id="comment_revert" value="${users.userId}" name="commentRevert"/>
                        <!--评论的内容-->
                        <textarea id="textarea" placeholder="想对博主说点什么" name="commentContent"></textarea>
                        <span><a href="#" onclick="document:form.submit()">发表</a></span>
                    </form>
                </div>
                <div id="comment">
                    <c:forEach items="${comments}" var="comment">
                        <ul class="ul1">
                            <li class="li1">
                                <p class="reply"><a href="#">回复</a></p>
                                <input type="hidden" value="${comment.commentId}"/>
                                <p class="info">
                                    <img src="${ctx}/${comment.user.userHead}"/>
                                    <span class="nickname"><a href="${pageContext.request.contextPath}/user/SkipUserPage?id=${comment.user.userId}">${comment.user.userNickname}</a></span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="time"><fmt:formatDate value="${comment.commentTime}" pattern="yyyy年MM月dd日 HH:mm"/></span>
                                </p>
                                <p class="content">
                                        ${comment.commentContent}
                                </p>
                                <c:if test="${comment.replyComment.size()!=0}">
                                    <c:forEach items="${comment.replyComment}" var="replyComment">
                                        <ul class="ul2">
                                            <li>
                                                <p class="info">
                                                    <img src="${ctx}/${replyComment.user.userHead}"/>
                                                    <span class="nickname"><a href="${ctx}/user/SkipUserPage?id=${replyComment.user.userId}">${replyComment.user.userNickname}</a>&nbsp;&nbsp;回复&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/${comment.user.userHead}"/>&nbsp;<a href="${pageContext.request.contextPath}/user/SkipUserPage?id=${comment.user.userId}">${comment.user.userNickname}</a></span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span class="time"><fmt:formatDate value="${replyComment.commentTime}" pattern="yyyy年MM月dd日 HH:mm"/></span>
                                                </p>
                                                <p class="content">
                                                        ${replyComment.commentContent}
                                                </p>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </c:if>
                            </li>
                        </ul>
                    </c:forEach>
                </div>
            </div>
        </div>

    </main>
    <aside>
        文章作者主页
    </aside>
    <div class="tool-box" style="right:114px;top: 75px">
        侧边工具
    </div>
</div>
<div id="footMobile">
    <div id="footMobileDiv">
        <p>
            Copyright ©
            <a href="http://www.xiaofangzi.top" target="_blank">
                www.xiaofangzi.top
            </a>
            All Rights Reserved.
        </p>
        <p style="text-align: center">
            备案号：
            <a href="http://www.beian.miit.gov.cn" target="_blank">
                豫ICP备19041699号-1
            </a>
        </p>
    </div>
</div>
<div class="return_top">
    <i class="layui-icon layui-icon-top" style="font-size: 40px; color: #ffffff;margin-left: 5px;line-height: 50px"></i>
</div>
</body>
<script type="text/javascript">
    //点击搜索框
    $(function () {
        $("#button").click(function () {
            var articleTitle = $("#searchText").val();
            location.href = "${ctx}/article/queryArticle?articleTitle=" + articleTitle;
        });
        //键盘操作
        $("#searchText").keypress(function (e) {
            if (e.which == 13) {
                var articleTitle = $("#searchText").val();
                location.href = "${ctx}/article/queryArticle?articleTitle=" + articleTitle;
            }
        });
        $(document).ready(function() {
            $(".return_top").fadeOut(1);
            $(window).scroll(function() {
                if($(window).scrollTop()>300){
                    $(".return_top").fadeIn(300);
                }else{
                    $(".return_top").fadeOut(300);
                }
            });
            //为返回顶部元素添加点击事件
            $('.return_top').click(function() {
                //将当前窗口的内容区滚动高度改为0，即顶部
                $("html,body").animate({
                    scrollTop: 0
                }, "fast");
            });
        });
    })
    $(function(){
        $(".reply").hide()
        $(".ul1 li").hover(function(){
            $(this).children(".reply").show()
        },function(){
            $(this).children(".reply").hide()
        });
        if ($("#comment_revert").val()==null||$("#comment_revert").val()==0||$("#comment_revert").val()==""){
            $("#replyComment").hide()
        }
        $(".reply").click(function () {
            if ($(this).text()=="回复"){
                var name = $(this).next().next().children('span').eq(0).text()
                $("#comment_reply").val($(this).next().val());
                $("textarea").attr('placeholder','回复'+name+'的评论');
                $(".reply").children().text("回复")
                $(this).children().text("取消回复")
            }else if($(this).text()=="取消回复"){
                $("#comment_reply").val(0);
                $("textarea").attr('placeholder','想对博主说点啥');
                $(".reply").children().text("回复")
                $(this).children().text("回复")
            }
            var name = $(this).next().next().children($("span:first").text())
            $("#comment_reply").val($(this).next().val())

            $("textarea").attr('placeholder','回复'+name+'的评论')
        })
    })
</script>
</html>
