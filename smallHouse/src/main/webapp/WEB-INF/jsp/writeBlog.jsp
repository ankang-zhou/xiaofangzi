<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2019/12/16
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>写文章-小房子博客</title>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <%-- writeBlog CSS   --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/writeBlog.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/tinymce/tinymce.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js" ></script>
    <%-- writeBlog JS --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/writeBlog.js"></script>
</head>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/article/saveArticle"
            method="post"
            enctype="multipart/form-data" >
        <table class="table table-hover">
            <tr>
                <td class="titleTd">标题：</td>
                <td><input name="articleTitle" id="title" type="text"/></td>
            </tr>
            <tr>
                <td class="titleTd">博客图片：</td>
                <td>
                    <input name="photo" id="photo" type="file" required="false"/>
                </td>
            </tr>
            <tr>
                <td class="titleTd">所属类别：</td>
                <td>
                    <select id="typeId"  name="typeId" editable="false" panelHeight="auto">
                        <option value=0>请选择博客类别...</option>
                        <c:forEach items="${typeList}" var="typeList">
                            <option value="${typeList.typeId}">${typeList.typeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="titleTd">简介：</td>
                <td>
                    <textarea id="summary" name="articleSummary" rows="4"></textarea>
                </td>
            </tr>
            <tr>
                <td class="titleTd">博客内容：</td>
                <td>
                    <textarea id="myTextarea" type="text/plain" name="articleContent" >你好，世界！</textarea>
                </td>
            </tr>
        </table>
        <input type="submit" id="submit" value="提          交" />
    </form>
</div>
</body>
<script type="text/javascript">
    tinymce.init({
        selector: "#myTextarea",
        language: 'zh_CN',
        plugins: [
            'advlist autolink lists image link charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen',
            'insertdatetime media nonbreaking save table contextmenu directionality',
            'save table contextmenu directionality emoticons template paste imagetools textcolor',
            'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc help'
        ],
        //工具框，也可自己随意配置
        toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | preview | forecolor backcolor emoticons | codesample help uploadimage',
        image_advtab: true,
        menubar: false,
        images_upload_handler: function (blobInfo, success, failure) {
            var xhr, formData;
            var userId = ${userId};//用户Id
            var maxArticleId = ${maxArticleId};//最大文章数
            xhr = new XMLHttpRequest();
            xhr.withCredentials = false;
            xhr.open('POST', "${pageContext.request.contextPath}/utilController/uploadImage?userId="+userId+"&maxArticleId="+maxArticleId);
            formData = new FormData();
            formData.append("file", blobInfo.blob());
            xhr.onload = function(e){
                var json;

                if (xhr.status != 200) {
                    failure('HTTP Error: ' + xhr.status);
                    return;
                }
                json = JSON.parse(this.responseText);

                if (!json || typeof json.location != 'string') {
                    failure('Invalid JSON: ' + xhr.responseText);
                    return;
                }
                success(json.location);
            };
            xhr.send(formData);

        }
    });
</script>
</html>
