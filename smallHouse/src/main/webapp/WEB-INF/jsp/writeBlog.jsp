<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2019/12/16
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/tinymce/tinymce.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js" ></script>
</head>
<body>
    <div class="container">
        <form method="post">
            <table class="table table-hover">
                <tr>
                    <td>标题：</td>
                    <td><input name="title" id="title" type="text" style="width: 400px;"/></td>
                </tr>
                <tr>
                    <td>所属类别：</td>
                    <td>
                        <select id="typeId" style="width: 154px" name="typeId" editable="false" panelHeight="auto">
                            <option value=0>请选择博客类别...</option>
                            <option value=1>1</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>简介：</td>
                    <td>
                        <textarea id="summary" name="summary" style="width:800px" rows="6"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>博客内容：</td>
                    <td>
                        <textarea id="myTextarea" type="text/plain" style="width:800px;height:850px;">你好，世界！</textarea>
                    </td>
                </tr>
            </table>

            <input type="submit" value="提交"/>
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
            xhr = new XMLHttpRequest();
            xhr.withCredentials = false;
            xhr.open('POST', "${pageContext.request.contextPath}/utilController/uploadImage?stuId="+stuId+"&maxLogId="+maxLogId);
            xhr.onload = function() {
                var json;

                if (xhr.status != 200) {
                    failure('HTTP Error: ' + xhr.status);
                    return;
                }
                json = JSON.parse(xhr.responseText);

                if (!json || typeof json.location != 'string') {
                    failure('Invalid JSON: ' + xhr.responseText);
                    return;
                }
                success(json.location);
            };
            formData = new FormData();
            formData.append('file', blobInfo.blob(), fileName(blobInfo));
            xhr.send(formData);
        }
    });
</script>
</html>
