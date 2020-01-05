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
        if ($("#comment_revert").val()==null||$("#comment_revert").val()==0||$("#comment_revert").val()==""){
            $("#replyComment").hide()
        }
        $(".reply").click(function () {
            alert($(this).text())
            if ($(this).text()=="回复"){
                var name = $(this).next().next().children('span').eq(0).text()
                $("#comment_reply").val($(this).next().val());
                $("textarea").attr('placeholder','回复'+name+'的评论');
                $(".reply").children().text("回复")
                $(this).children().text("取消回复")
            }else if($(this).text()=="取消回复"){
                $("#comment_reply").val(0);
                $("textarea").attr('placeholder','想对博主说点啥');
                $(".reply").children().text("回复")
                $(this).children().text("回复")
            }
        })
    })
</script>
<body>
<div id="commentMain">
    <div id="replyComment">
        <form action="${pageContext.request.contextPath}/comment/AddComment" method="post" id="form">
            <p><img src="${pageContext.request.contextPath}/${users.userHead}">&nbsp;${users.userNickname}：</p>
            <!--文章id-->
            <input type="hidden" id="article_id" name="articleId" value="1"/>
            <!--被回复评论的id，当没有被回复人时value为0-->
            <input type="hidden" value="0" id="comment_reply" name="commentReply"/>
            <!--回复人id也就是用户id-->
            <input type="hidden" id="comment_revert" value="${users.userId}" name="commentRevert"/>
            <!--评论的内容-->
            <textarea id="textarea" placeholder="想对博主说点什么" name="commentContent"></textarea>
            <span><a href="#" onclick="document:form.submit()">发表</a></span>
        </form>
    </div>
    <div id="comment">
        <c:forEach items="${comments}" var="comment">
            <ul class="ul1">
                <li class="li1">
                    <p class="reply"><a href="#">回复</a></p>
                    <input type="hidden" value="${comment.commentId}"/>
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
</div>
</body>
</html>
