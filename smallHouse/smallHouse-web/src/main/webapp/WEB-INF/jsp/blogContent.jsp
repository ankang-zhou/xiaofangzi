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
    <link media="(max-width:768px)" rel="stylesheet" href="${ctx}/static/css/mobile2.css"/>
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
            <div class="comment-box">
                <a href="${pageContext.request.contextPath}/comment/show">评论</a>
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
    })
</script>
</html>
