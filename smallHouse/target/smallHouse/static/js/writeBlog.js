//writeBlog JS
$(function () {
    $("#submit").click(function () {
        //判断所选文章类型
        if($("#title").val() == ""){
            alert("请输入文章标题");
            return false;
        }else if($("select").val() == 0){
            alert("请选择文章类型");
            return false;
        }else if($("#summary").val() == ""){
            alert("请输入文章简介");
            return false;
        }else if($("#myTextarea").val() == ""){
            alert("请输入文章内容");
            return false;
        }else {
            return true;
        }
    })
})