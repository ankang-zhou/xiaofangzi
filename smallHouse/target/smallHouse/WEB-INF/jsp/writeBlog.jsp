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
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/tinymce/tinymce.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
</head>
<body>
<form method="post">
    <textarea >你好，世界！</textarea>
    <input type="submit" value="提交">
</form>
</body>
<script type="text/javascript">
    tinymce.init({
        selector: "textarea",
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

            var form = new FormData();

            // blobInfo.blob()为数据流

            // blobInfo.filename()为文件名

            //  根据自己的需求取值
            form.append('files', blobInfo.blob(), blobInfo.filename());
            $.ajax({
                url: ApiUrl,
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function(data) {
                    success(data.url); // 这里为图片上传成功之后所获取的图片路径赋值给下面的截图中的地址一栏
                },
                error: function(e) {
                    alert("图片上传失败");
                }
            });
        },
    });
</script>
</html>
