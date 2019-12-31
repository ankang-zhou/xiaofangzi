<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/30
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/comment.css" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js" ></script>
<script type="text/javascript">
    $(function(){
        $(".reply").hide()
        $(".ul1 li").hover(function(){
            $(this).children(".reply").show()
        },function(){
            $(this).children(".reply").hide()
        });
    })
</script>
<body>

<div id="comment">
    <c:forEach items="${comments}" var="comment">
        <ul class="ul1">
            <li class="li1">
                <p class="reply"><a href="#">回复</a></p>
                <p class="info">
                    <img src="${pageContext.request.contextPath}/${comment.user.userHead}"/>
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
                                    <img src="${pageContext.request.contextPath}/${replyComment.user.userHead}"/>
                                    <span class="nickname"><a href="${pageContext.request.contextPath}/user/SkipUserPage?id=${replyComment.user.userId}">${replyComment.user.userNickname}</a>&nbsp;&nbsp;&nbsp;&nbsp;回复了&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/${comment.user.userHead}"/>&nbsp;<a href="${pageContext.request.contextPath}/user/SkipUserPage?id=${comment.user.userId}">${comment.user.userNickname}</a></span>
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
</body>
</html>
