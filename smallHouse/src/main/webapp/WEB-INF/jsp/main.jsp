<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2019/12/18
  Time: 12:28
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
    <title>Title</title>
    <link href="https://cdn.bootcss.com/font-awesome/5.8.0/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css"/>
    <link media="(max-width:768px)" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mobile.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/main.js"></script>
</head>
<body>
<%--top begin--%>
<header id="header">
    <i id="menu" class="layui-icon layui-icon-spread-left"></i>
    <nav>
        <ul id="lul" class="layui-nav" lay-filter="">
            <li class="layui-nav-item"><a href="">最新活动</a></li>
            <li class="layui-nav-item layui-this"><a href="">产品</a></li>
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
                    <a href="${ctx}/type/queryAllTypes">写博客</a>
                </li>
            </c:if>
            <li class="layui-nav-item">
                <a href="${ctx}">个人中心<span class="layui-badge-dot"></span></a>
            </li>
            <li class="layui-nav-item">
                <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img"></a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}">修改信息</a></dd>
                    <dd><a href="${ctx}">个人中心</a></dd>
                    <dd><a href="${ctx}">退出</a></dd>
                </dl>
            </li>
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
        <div class="lunbotou">
            <div class="lunBox">
                <div class="layui-carousel" id="test3" lay-filter="test4">
                    <div carousel-item="">
                        <div><a href="${ctx}/"><img src="${ctx}/static/images/lunboimages/1.png"></a></div>
                        <div><a href="${ctx}/"><img src="${ctx}/static/images/lunboimages/2.png"></a></div>
                        <div><a href="${ctx}/"><img src="${ctx}/static/images/lunboimages/3.png"></a></div>
                        <div><a href="${ctx}/"><img src="${ctx}/static/images/lunboimages/4.png"></a></div>
                        <div><a href="${ctx}/"><img src="${ctx}/static/images/lunboimages/5.png"></a></div>
                    </div>
                </div>
            </div>
            <div class="lunRight">
                <div class="lunRightS"><img class="rightSImg"  src="${ctx}/static/images/lunboimages/1.png" /></div>
                <div class="lunRightX"><img class="rightXImg"  src="${ctx}/static/images/lunboimages/2.png" /></div>
            </div>
        </div>

        <%--左侧导航栏--%>
        <div class="navUl">
            <ul id="navul">
                <li  style="background:#F44444;color: white">推荐</li>
                <c:forEach items="${typeList}" var="typeList">
                    <li id="navli"><a id="li" href="${ctx}/">${typeList.typeName}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="articleList">
            <c:forEach items="${articleList}" var="articles">
                <div class="fenGe">
                    <p class="titleP"><a href="${pageContext.request.contextPath}/article/ArticleById?articleId=${articles.articleId}">${articles.articleTitle}</a></p>
                    <div class="summaryP">${articles.articleSummary}</div>
                    <div class="clearDiv"></div>
                    <div class="liColor">
                        <a href="${ctx}">
                            <img id="userPhoto" title="${articles.userNickName}" src="${ctx}/${articles.userHead}">
                        </a>
                    </div>
                    <ul id="ul">
                        <li>
                            <a id="userNickName" href="${ctx}">${articles.userNickName}</a>
                        </li>
                        <li><span><fmt:formatDate value="${articles.articleTime}" pattern="yyyy年MM月dd日"/></span></li>
                        <li><span class="numColor">${articles.articlePageview}</span><span>浏览</span></li>
                        <li>
                            <i class="layui-icon layui-icon-praise" style="font-size: 15px; color: #565656;"></i>
                            <span class="numColor">
                                    ${articles.articleLike}
                            </span>
                        </li>
                    </ul>
                    <div class="clearDiv"></div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%-- rbox begin --%>
    <div id="rBox">
    </div>
</article>
<footer></footer>

</body>
<script type="text/javascript">
    $(function(){
        $("#button").click(function(){
            var articleTitle = $("#searchText").val();
            location.href="${ctx}/article/queryArticle?articleTitle="+articleTitle;

        });
        $("#button2").click(function(){
            var articleTitle = $("#searchText2").val();
            location.href="${ctx}/article/queryArticle?articleTitle="+articleTitle;
        })

    })
</script>
</html>
