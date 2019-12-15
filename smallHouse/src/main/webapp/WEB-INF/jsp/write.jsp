<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2019/12/15
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!--引入js文件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/tinymce/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/tinymce/js/jquery-form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/tinymce/js/tinymce/tinymce.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/tinymce/js/tinymce/jquery.tinymce.min.js"></script>

<script type="text/javascript">
    tinymce.init({
        selector: "textarea",
        upload_image_url: './upload', //配置的上传图片的路由
        height: 400,
        language: 'zh_CN',
        plugins: [
            'advlist autolink lists image link charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen',
            'insertdatetime media nonbreaking save table contextmenu directionality',
            'save table contextmenu directionality emoticons template paste imagetools textcolor',
            'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc help uploadimage'
        ],
        //工具框，也可自己随意配置
        toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | preview | forecolor backcolor emoticons',
        image_advtab: true,
        templates: [{
            title: 'Test template 1',
            content: 'Test 1'
        },
            {
                title: 'Test template 2',
                content: 'Test 2'
            }
        ],
        menubar: false,
        images_upload_handler: function(blobInfo, success, failure) {
            var xhr, formData;
            var stuId = ${user.userId};
            var maxLogId = ${maxLogId};
            xhr = new XMLHttpRequest();
            xhr.withCredentials = false;
            xhr.open("POST", "${pageContext.request.contextPath}/utilController/uploadImage?stuId="+stuId+"&maxLogId="+maxLogId);//第一个参数是请求方式，第二个参数是请求地址
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
            formData = new FormData();
            formData.append('file', blobInfo.blob(), blobInfo.filename());

            xhr.send(formData);
        }
    });
</script>
</head>
<body>
<div>
    <br>
    <form method="post" action="${pageContext.request.contextPath}/TextareaAction">
        <textarea id="textarea" name="test"></textarea>
        <input type="submit" value="提交">
    </form>
</div>


</body>
</html>
