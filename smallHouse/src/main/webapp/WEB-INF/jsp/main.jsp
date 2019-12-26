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
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/personagePage.css"/>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/main.js"></script>
</head>
<body>
<%--top begin--%>
<header id="header">
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
        <ul id="rul" class="layui-nav">
            <li class="layui-nav-item">
                <a href="">写博客<span class="layui-badge">9</span></a>
            </li>
            <li class="layui-nav-item">
                <a href="">个人中心<span class="layui-badge-dot"></span></a>
            </li>
            <li class="layui-nav-item">
                <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="${ctx}/user/SkipPersonalPage">个人中心</a></dd>
                    <dd><a href="javascript:;">退出</a></dd>
                </dl>
            </li>
        </ul>
    </nav>
</header>
<div class="clear"></div>
<article>
    <div class="layui-row layui-col-md-offset1 ">
        <%-- lbox begin --%>
        <div class="layui-col-xs12 layui-col-md8  lbox">
            <div id="leftDiv">
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
                <div class="clear"></div>
                <div class="articleList">
                    <c:forEach items="${articleList}" var="articles">
                        <div class="fenGe">
                            <p class="titleP"><a href="${pageContext.request.contextPath}/article/ArticleById?articleId=${articles.articleId}">${articles.articleTitle}</a></p>
                            <div class="imgDiv">
                                <a class="blogA" href="${pageContext.request.contextPath}/article/ArticleById?articleId=${articles.articleId}">
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
            </div>
        </div>
        <%-- rbox begin --%>
        <div class="layui-col-xs6  layui-col-md4 rbox">
            <div id="rightDiv"></div>
        </div>
    </div>
    <%--左侧导航栏--%>
    <div class="navUl">
        <ul>
            <li style="background:#F44444;color: white">推荐</li>
            <c:forEach items="${typeList}" var="typeList">
                <li><a id="li" href="${ctx}/">${typeList.typeName}</a></li>
            </c:forEach>
        </ul>
    </div>

</article>
<footer></footer>

</body>

</html>
