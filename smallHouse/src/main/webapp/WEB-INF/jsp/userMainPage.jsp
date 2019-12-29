<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/24
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/userMainPage.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js" ></script>
    <script>
        $(function(){
            $("#leftDiv_bottom_blogs").show();
            $("#leftDiv_bottom_fans").hide()
            $("#leftDiv_bottom_attention").hide()
            $("#blogs").click(function () {
                $("#leftDiv_bottom_blogs").show();
                $("#leftDiv_bottom_fans").hide()
                $("#leftDiv_bottom_attention").hide()
            })
            $("#fans").click(function () {
                $("#leftDiv_bottom_blogs").hide();
                $("#leftDiv_bottom_fans").show()
                $("#leftDiv_bottom_attention").hide()
            })
            $("#attention").click(function () {
                $("#leftDiv_bottom_blogs").hide();
                $("#leftDiv_bottom_fans").hide()
                $("#leftDiv_bottom_attention").show()
            })
        })
    </script>
</head>
<body>
<div id="article">
    <div id="leftDiv">
        <div id="leftDiv_top">
            <div id="divimg">
                <img src="${pageContext.request.contextPath}/${userInfo.userHead}" width="100px" height="100px" style="border-radius: 50%;" />
            </div>
            <div id="divp">
                <p id="div_p">
                    ${userInfo.userNickname}
                </p>
                <p id="div_p_2">
                    粉丝:${userFans.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关注:${userAttention.size()}
                </p>
                <hr />
            </div>
        </div>
        <div id="leftDiv_bottom">
            <div id="leftDiv_bottom_head">
                <ul>
                    <li><a href="#" id="blogs">博客</a></li>
                    <li><a href="#" id="fans">关注</a></li>
                    <li><a href="#" id="attention">粉丝</a></li>
                </ul>
                <hr />
            </div>
            <div id="leftDiv_bottom_blogs">
                <ul>
                    <c:forEach items="${userArticle}" var="articles">
                        <li>
                            <a href="${pageContext.request.contextPath}/article/ArticleById?articleId=${articles.articleId}">
                                <div>
                                    <p class="title">${articles.articleTitle}</p>
                                    <p class="content">${articles.articleSummary}</p>
                                    <p class="browse">${articles.articlePageview}</p>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="leftDiv_bottom_fans">
                <div id="divFans">
                    <ul>
                        <c:forEach items="${userFans}" var="fans">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/SkipUserPage?id=${fans.userId}">
                                    <div id="divFans_divimg">
                                        <c:if test="${fans.userHead!=null}">
                                            <img src="${pageContext.request.contextPath}/${fans.userHead}" />
                                        </c:if>
                                        <c:if test="${fans.userHead==null}">
                                            <img src="${pageContext.request.contextPath}/static/images/banner.jpg" />
                                        </c:if>
                                        <p>${fans.userNickname}</p>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div id="leftDiv_bottom_attention">
                <div id="divAttention">
                    <ul>
                        <c:forEach items="${userAttention}" var="attention">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/SkipUserPage?id=${attention.userId}">
                                    <div id="divAttention_divimg">
                                            <c:if test="${attention.userHead!=null}">
                                                <img src="${pageContext.request.contextPath}/${attention.userHead}" />
                                            </c:if>
                                            <c:if test="${attention.userHead==null}">
                                                <img src="${pageContext.request.contextPath}/static/images/banner.jpg" />
                                            </c:if>
                                            <p>${attention.userNickname}</p>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <div id="rightDiv">
        afwa
    </div>
</div>
</body>
</html>
