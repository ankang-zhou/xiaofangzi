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

<html>
<head>
    <title>显示博客页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/showBlog.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
</head>
<body id="body">
<section>
    <h1>根据搜索显示内容</h1>
    <div id="left">
        <c:forEach items="${articles}" var="articles">

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
</section>
</body>
</html>
