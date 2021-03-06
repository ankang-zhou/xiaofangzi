<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2020/1/6
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Title</title>
    <link href="https://cdn.bootcss.com/font-awesome/5.8.0/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/header.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/main.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/rBox.css"/>
    <link media="(max-width:768px)" rel="stylesheet" href="${ctx}/static/css/mobile.css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.12.4.js"></script>
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/main.js"></script>
</head>
<body>
<%--top begin--%>
<header id="header">
    <a href="${ctx}/article/articleList">
        <i id="menu" class="layui-icon layui-icon-home"></i>
    </a>
    <nav>
        <ul id="lul" class="layui-nav" lay-filter="">
            <li class="layui-nav-item"><a href="">最新活动</a></li>
            <li class="layui-nav-item layui-this"><a href="${ctx}/article/mainYe">首页</a></li>
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
            <input id="searchText" class="search-txt " type="text" value="java" />
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
                <li id="navItem" class="layui-nav-item">
                    <a href="javascript:void(0)"><img src="${ctx}/${users.userHead}" class="layui-nav-img"></a>
                    <dl class="layui-nav-child">
                        <dd><a href="${ctx}">个人主页</a></dd>
                        <dd><a href="${ctx}/user/SkipPersonalPage">个人中心</a></dd>
                        <dd><a href="${ctx}/user/validateSession">退出</a></dd>
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
<article>
    <%-- lbox begin --%>
    <div id="searchBox">
        <div class="search-box2">
            <input id="searchText2" class="search-txt2  " type="text" value="java" />
            <a id="button2" class="search-btn2">
                <i class="fas fa-search"></i>
            </a>
        </div>
    </div>
    <div id="lBox">
        <%--左侧导航栏--%>
        <div class="navUl" style="top: 320px">
            <ul id="navul">
                <li  style="background:#F44444;color: white">推荐</li>
                <c:forEach items="${typeList}" var="typeList">
                    <li id="navli">
                        <a class="li" id="li" href="javascript:void(0)">
                            <span class="typeId" style="display: none" >${typeList.typeId}</span>${typeList.typeName}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div id="LAY_demo1" class="articleList flow-default">
            <c:forEach items="${articleList}" var="articles">
                <div class="fenGe">
                    <p class="articleId" id="articleId" style="display: none" >${articles.articleId}</p>
                    <p class="titleP"><span id="typeName" >${articles.typeName}</span> <a href="${ctx}/article/ArticleById?articleId=${articles.articleId}">${articles.articleTitle}</a></p>
                    <div class="summaryP">${articles.articleSummary}</div>
                    <div class="clearDiv"></div>
                    <div class="liColor">
                        <a href="${ctx}">
                            <img id="userPhoto" title="${articles.userNickName}" src="${ctx}/${articles.userHead}">
                        </a>
                    </div>
                    <ul id="ul">
                        <li>
                            <i class="layui-icon layui-icon-user" style="font-size: 15px; color: #565656;"></i>
                            <a id="userNickName" href="${ctx}">${articles.userNickName}</a>
                        </li>
                        <li>
                            <i class="layui-icon layui-icon-date" style="font-size: 15px; color: #565656;"></i>
                            <span><fmt:formatDate value="${articles.articleTime}" pattern="yyyy年MM月dd日"/></span>
                        </li>
                        <li>
                            <a href="${ctx}/article/ArticleById?articleId=${articles.articleId}">
                                <i class="layui-icon layui-icon-read" style="font-size: 15px; color: #565656;"></i>
                                &nbsp<span class="numColor">${articles.articlePageview}</span>
                            </a>
                        </li>
                        <li>
                            <a class="likeA" href="javascript:void(0)">
                                <i class="layui-icon layui-icon-praise likeIcon" style="font-size: 15px; color: #565656;"></i>
                                <span class="numColor likeNum">
                                        ${articles.articleLike}
                                </span>
                            </a>
                        </li>
                    </ul>
                    <div class="clearDiv"></div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%-- rbox begin --%>
    <div id="rBox">
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
                    <c:forEach items="${articleTop}" var="articleTop">
                        <li>
                            <a href="${ctx}/article/ArticleById?articleId=${articleTop.articleId}">
                                <img src="${ctx}/${articleTop.articlePhoto}"><span>${articleTop.articleTitle}</span>

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
                    <a id="middleA1" class="btn" href="https://github.com/">
                        <i class="fab fa-github"></i>
                    </a>
                    <div id="middleA1Img"><img class="middleImg" src="${ctx}/static/images/img/gitHub.jpg" /></div>
                    <a id="middleA2" class="btn" href="#">
                        <i class="fab fa-weixin"></i>
                    </a>
                    <div id="middleA2Img"><img class="middleImg" src="${ctx}/static/images/img/weixin.jpg" /></div>
                    <a id="middleA3" class="btn" href="#">
                        <i class="fab fa-qq"></i>
                    </a>
                    <div id="middleA3Img"><img class="middleImg" src="${ctx}/static/images/img/qq.png" /></div>
                </div>

                <ul id="footUl">
                    <li>
                        <a href="#">
                            关于我们
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            关于我们
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            关于我们
                        </a>
                    </li>
                </ul>
                <p class="footFont">
                    <a href="http://www.xiaofangzi.top" target="_blank">
                        Copyright © <span class="hoverSpan" >www.xiaofangzi.top </span>All Rights Reserved
                    </a>
                    <br/>
                    <a href="http://www.beian.miit.gov.cn" target="_blank">
                        <span class="footA">备案号：<span class="hoverSpan">豫ICP备19041699号-1</span></span>
                    </a>
                    <br/>

                    <img src="${ctx}/static/images/img/gongan.png" style="float: left;margin-left: 35px">
                    <a href="#">
                        <span>公安备案号 11010502030143</span>
                    </a>
                </p>
            </div>
        </div>
    </div>
</article>
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
<span id="userId" style="display: none" >${users.userId}</span>
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

        //选择分类导航
        $(".li").click(function () {
            var typeId = $(this).children('span').text();
            $("#LAY_demo1").html("");
            location.href="${ctx}/article/articleListByTypeId?typeId="+typeId;
        });
    });
    //键盘操作
    $("#searchText").keypress(function (e) {
        if (e.which == 13) {
            var articleTitle = $("#searchText").val();
            location.href="${ctx}/article/queryArticle?articleTitle="+articleTitle;
        }
    });
    $(function () {
        //点赞
        $(".likeA").click(function () {
            var userId = $("#userId").text();//用户Id
            if(userId != ''){
                var articleId = $(this).parent().parent().parent().children('p').eq(0).text();//文章Id

                var likeNum  = $(this).children('span').text().trim();   //当前文章点赞量
                var mythis = $(this);   //ajax函数里不能用this调用只能在外部声明一个变量再使用。
                $.ajax({
                    url:"${ctx}/article/like",
                    data:{"articleId":articleId,"userId":userId},
                    success:function (data) {
                        if(data > likeNum){
                            mythis.children('i').css("color","red");
                        }else{
                            mythis.children('i').css("color","#565656");
                        }
                        mythis.children('span').text(data);
                    }
                })
            }else {
                alert("请您登录后再进行操作");
            }
        });
    });
</script>
</html>