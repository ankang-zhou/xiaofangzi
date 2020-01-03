<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2019/12/22
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>博客内容</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blogContent.css">
</head>
<body>
<div>
    <h1>${article.articleTitle}</h1>
    <p>
    <ul>
        <li class="liColor">${article.typeName}</li>
        <li class="liColor">${article.userNickName}</li>
        <li><fmt:formatDate value="${article.articleTime}" pattern="yyyy年MM月dd日"/></li>
        <li>浏览${article.articlePageview}</li>
    </ul>
    </p>
    <p>${article.articleSummary}</p>
    <p>${article.articleContent}</p>
    <a href="${pageContext.request.contextPath}/comment/show">评论</a>
</div>
</body>
</html>
