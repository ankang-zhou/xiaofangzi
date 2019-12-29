<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2019/12/22
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>显示博客页面</title>
    <link href="https://cdn.bootcss.com/font-awesome/5.8.0/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/header.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/rBox.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/showBlog.css">
    <link media="(max-width:768px)" rel="stylesheet" href="${ctx}/static/css/mobile.css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.12.4.js"></script>
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/main.js"></script>
</head>
<body id="body">
<header id="header">
    <a href="${ctx}/article/articleList">
        <i id="menu" class="layui-icon layui-icon-home"></i>
    </a>
    <nav>
        <ul id="lul" class="layui-nav" lay-filter="">
            <li class="layui-nav-item"><a href="">最新活动</a></li>
            <li id="homeMenu" class="layui-nav-item layui-this"><a href="${ctx}/article/articleList">首页</a></li>
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
                    <a href="${ctx}/type/queryAllTypes">写博客</a>
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
                    <a href="${ctx}/">登录/注册</a>
                </li>
            </c:if>
        </ul>
    </nav>
</header>
<div class="clear"></div>
<section id="section">

    <div id="left">
        <c:forEach items="${articles}" var="articles">

            <div class="fenGe">
                <p class="titleP"><a
                        href="${pageContext.request.contextPath}/article/ArticleById?articleId=${articles.articleId}">${articles.articleTitle}</a>
                </p>
                <div class="imgDiv">
                    <a class="blogA"
                       href="${pageContext.request.contextPath}/article/ArticleById?articleId=${articles.articleId}">
                        <img class="blogImg" src="${pageContext.request.contextPath}/${articles.articlePhoto}">
                    </a>
                </div>
                <div class="summaryP">${articles.articleSummary}</div>
                <div class="clearDiv"></div>
                <ul id="ul">
                    <li><p class="liColor">${articles.userNickName}</p></li>
                    <li><p><fmt:formatDate value="${articles.articleTime}" pattern="yyyy年MM月dd日"/></p></li>
                    <li><p>${articles.articlePageview}<span>浏览</span></p></li>
                    <li><p>${articles.articleLike}<span style="color: red">喜欢</span></p></li>
                </ul>
                <div class="clearDiv"></div>
            </div>
        </c:forEach>
    </div>
    <div id="right">
        <div id="rightMenu">
            <div id="ad">
                <div>
                    <img src="${ctx}/static/images/img/1.jpg"/>
                    <span>来去自由</span>
                </div>

                <div>
                    <img src="${ctx}/static/images/img/2.jpg"/>
                    <span>干净如风</span>
                </div>

                <div>
                    <img src="${ctx}/static/images/img/3.jpg"/>
                    <span>甲乙丙丁</span>
                </div>

                <div>
                    <img src="${ctx}/static/images/img/4.jpg"/>
                    <span>向往平淡</span>
                </div>

                <div>
                    <img src="${ctx}/static/images/img/5.jpg"/>
                    <span>不甘平凡</span>
                </div>
            </div>
            <div id="tuiArticle">
                <h3><span style="color: red;font-weight: bold">|</span> 今日推荐</h3>
                <ul>
                    <c:forEach items="${articles}" var="recommend">
                        <li>
                            <a href="${ctx}/article/ArticleById?articleId=${recommend.articleId}">
                                <img src="${ctx}/${recommend.articlePhoto}"><span>${recommend.articleTitle}</span>

                            </a>
                        </li>

                    </c:forEach>
                </ul>
            </div>
            <div id="ad2">
                广告2
            </div>
            <div id="tuiBlog">
                推荐博客
            </div>
            <div id="footer">
                <div id="middle">
                    <a class="btn" href="https://github.com/">
                        <i class="fab fa-github"></i>
                    </a>
                    <a class="btn" href="#">
                        <i class="fab fa-weixin"></i>
                    </a>
                    <a class="btn" href="#">
                        <i class="fab fa-qq"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    //点击搜索框
    $(function(){
        $("#button").click(function(){
            var articleTitle = $("#searchText").val();
            location.href="${ctx}/article/queryArticle?articleTitle="+articleTitle;

        });
        $("#button2").click(function(){
            var articleTitle = $("#searchText2").val();
            location.href="${ctx}/article/queryArticle?articleTitle="+articleTitle;
        });
    })
    $(function(){
        //初始化,i代表遍历的索引,e代表遍历的对象
        $.each($("#box div"),function(i,e){
            $(e).css("transform","translateX("+i*40+"px)").css("transition","1s");
        });


        //点击事件
        /**
         * 小于等于点击的索引  向左
         * 大于点击的索引  向右
         */
        $("#ad div").click(function(){
            //获取点击的索引
            var index = $(this).index();
            $.each($("#ad div"),function(i,e){
                if(i<=index){//小于等于点击的索引  向左
                    $(e).css("transform","translateX("+i*14+"px)").css("transition","1s");
                }else{//大于点击的索引  向右
                    //总长度-5*40=偏移量
                    $(e).css("transform","translateX("+(185-5*14+i*14)+"px)").css("transition","1s");
                }
            });

        });

    })

</script>
</html>
