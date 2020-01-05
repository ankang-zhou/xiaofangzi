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
    <link href="https://cdn.bootcss.com/font-awesome/5.8.0/css/all.css" rel="stylesheet"/>
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

<section id="section">
    <div id="searchBox">
        <div class="search-box3">
            <input id="searchText2" class="search-txt2  " type="text" value="java" />
            <a id="button2" class="search-btn2">
                <i class="fas fa-search"></i>
            </a>
        </div>
    </div>
    <div id="left">
        <c:if test="${articles == null}">
        <div class="fenGe">
            <p style="font-size: 13px;color: #c4c4c4;margin-left: 35%;padding-top: 10%">你已经到达了世界的尽头</p>
            <div style="margin-bottom: 0px"><img style="width: 100%;" src="${ctx}/static/images/img/end.png"/></div>
        </div>
        </c:if>
        <c:forEach items="${articles}" var="articles">
            <div class="fenGe">
                <p class="articleId" id="articleId" style="display: none" >${articles.articleId}</p>
                <p class="titleP">
                    <span id="typeName" >${articles.typeName}</span><a href="${ctx}/article/ArticleById?articleId=${articles.articleId}">${articles.articleTitle}</a>
                </p>
                <div class="imgDiv">
                    <a class="blogA"
                       href="${ctx}/article/ArticleById?articleId=${articles.articleId}">
                        <img class="blogImg" src="${ctx}/${articles.articlePhoto}">
                    </a>
                </div>
                <div class="summaryP">${articles.articleSummary}</div>
                <div class="clearDiv"></div>
                <ul id="ul">
                    <li>
                        <a class="liColor" href="#">
                            <i class="layui-icon layui-icon-user" style="font-size: 15px; color: #565656;"></i>&nbsp&nbsp${articles.userNickName}
                        </a>
                    </li>
                    <li>
                        <i class="layui-icon layui-icon-date" style="font-size: 15px;color: black"></i>&nbsp
                        <fmt:formatDate value="${articles.articleTime}" pattern="yyyy年MM月dd日 HH:mm"/>&nbsp
                    </li>
                    <li>
                        <a href="${ctx}/article/ArticleById?articleId=${articles.articleId}">
                            <i class="layui-icon layui-icon-read" style="font-size: 15px; color: #565656;"></i>&nbsp<span class="numColor">${articles.articlePageview}</span>
                        </a>
                    </li>
                    <li>
                        <a class="likeA" href="javascript:void(0)">
                            <i class="layui-icon layui-icon-praise likeIcon" style="font-size: 15px; color: #565656;"></i>
                            <span class="numColor likeNum">${articles.articleLike}</span>
                        </a>
                    </li>
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
<footer>

</footer>
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
        $("#button2").click(function () {
            var articleTitle = $("#searchText2").val();
            location.href = "${ctx}/article/queryArticle?articleTitle=" + articleTitle;
        });
        //点赞
        $(".likeA").click(function () {
            var articleId = $(this).parent().parent().parent().children('p').eq(0).text();//文章Id
            var userId = ${users.userId}//用户Id
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
        });

    })
</script>
</html>
