<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/30
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <c:forEach items="${comments}" var="comment">
        <ul>
            <li>
                ${comment.user.userNickname}
                ${comment.commentContent}
                <c:if test="${comment.replyComment.size()!=0}">
                    <c:forEach items="${comment.replyComment}" var="replyComment">
                        <ul>
                            <li>
                                ${replyComment.user.userNickname}
                                ${replyComment.commentContent}
                            </li>
                        </ul>
                    </c:forEach>
                </c:if>
            </li>
        </ul>
    </c:forEach>
</body>
</html>
