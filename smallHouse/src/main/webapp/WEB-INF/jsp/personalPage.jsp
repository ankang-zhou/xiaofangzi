<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/20
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/css/personagePage.css" />
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/amend.css">
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.12.4.js" ></script>
    <script src="${ctx}/static/layui/layui.js"></script>
    <style>
        .ul_li_a{
            background-color: #c9302c;
            color: white;
        }
    </style>
</head>
<body>
<header>
</header>
<div id="divmain">
    <div id="divleft">
        <ul id="ul">
            <li><a href="#" id="userInfo">个人资料</a></li>
            <li><a href="#" id="userAttention">我的关注</a></li>
            <li><a href="#" id="userFans">我的粉丝</a></li>
        </ul>
    </div>
    <div id="divright">
        <div id="top">
            <p>个人资料</p>
            <hr />
        </div>
        <div id="left">
            <div id="divimg">
                <c:if test="${users.userHead!=null}">
                    <img src="${pageContext.request.contextPath}/${users.userHead}" width="80px" height="80px"/>
                </c:if>
                <c:if test="${users.userHead==null}">
                    <img src="${pageContext.request.contextPath}/static/images/img1.png" width="80px" height="80px"/>
                </c:if>
            </div>
            <div id="diva" style="margin-top: 10px"><a href="#" id="amendA">修改头像</a></div>
        </div>
        <div id="right">
            <div id="right_top">
                <p id="pid">ID：${users.userEamil}</p>
                <p>关注：0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;粉丝：0</p>
                <hr />
            </div>
            <div id="right_bottom">
                <button id="amendBtn">修改信息</button>
                <input type="hidden" value="${users.userId}">
                <p>昵称：${users.userNickname}</p>
                <p>邮箱：${users.userEamil}</p>
                <p>姓名：${users.userName}</p>
                <p>年纪：${users.userAge}</p>
                <p>性别：
                    <c:if test="${users.userSex==0}">
                        女
                    </c:if>
                    <c:if test="${users.userSex==1}">
                        男
                    </c:if>
                </p>
<%--                <p>头像：${users.userHead}</p>--%>
                <p>地址：${address}</p>
                <p>职业：${users.userProfession}</p>
            </div>
        </div>
    </div>
    <div id="divFans">
        <p id="fansP">我的粉丝</p>
        <hr />
        <ul>
            <c:forEach var="fans" items="${userFans}">
                <li>
                    <div id="divFans_divimg">
                        <a href="${pageContext.request.contextPath}/user/SkipUserPage?id=${fans.userId}">
                            <span><img src="${ctx}/${fans.userHead}" />&nbsp;&nbsp;${fans.userNickname}</span>
                        </a>

                        <a href="" id="guanId"><span id="guan">关注</span></a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div id="divAttention">
        <p id="AttentionP">我的关注</p>
        <hr />
        <ul>
            <c:forEach var="attention" items="${userAttention}">
                <li>
                    <div id="divAttention_divimg">
                        <a href="${pageContext.request.contextPath}/user/SkipUserPage?id=${attention.userId}">
                            <span><img src="${ctx}/${attention.userHead}" />&nbsp;&nbsp;${attention.userNickname}</span>
                        </a>
                        <a href="" id="cancelGuanId"><span id="cancelGuan">取消关注</span></a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

</div>
</body>
<script type="text/javascript">
    $(function(){
        $("#divright").show()
        $("#divFans").hide()
        $("#divAttention").hide()
        $("#userInfo").click(function(){
            $("#divleft #ul li").removeClass('ul_li_a')
            $(this).parent().addClass('ul_li_a')
            $("#divright").show()
            $("#divFans").hide()
            $("#divAttention").hide()
        })
        $("#userAttention").click(function(){
            $("#divleft #ul li").removeClass('ul_li_a')
            $(this).parent().addClass('ul_li_a')
            $("#divright").hide()
            $("#divFans").hide()
            $("#divAttention").show()
        })
        $("#userFans").click(function(){
            $("#divleft #ul li").removeClass('ul_li_a')
            $(this).parent().addClass('ul_li_a')
            $("#divright").hide()
            $("#divFans").show()
            $("#divAttention").hide()
        })
    })
    $("#amendBtn").click(function () {
        var userid = $("input[type=hidden]").val();
        layui.use('layer', function(){
            //头像：<input type='text' name='userHead' class='userHead' value='"$"{users.userHead}' /><br />
            var page = "<div id='amend'>" +
                "<form action='${pageContext.request.contextPath}/user/UpdateUserInfo' method='post' class='layui-form'>" +
                "<input type='hidden' name='userId' value='${users.userId}'>" +
                "昵称：<input type='text' name='userNickname' class='userNickname' value='${users.userNickname}' /><br />" +
                "邮箱：<input type='text' name='userEamil' class='userEamil' value='${users.userEamil}' readonly/><br />" +
                "姓名：<input type='text' name='userName' class='userName' value='${users.userName}' /><br />" +
                "年纪：<input type='text' name='userAge' class='userAge' value='${users.userAge}' /><br />" +
                "性别："+
                "<input type='radio' name='userSex' value='1' checked style='display: inline-block;'>男"+
                "<input type='radio' name='userSex' value='0' style='display: inline-block;'>女"+
                "<br />" +
                "地址：<select id='zuigaoji' lay-verify='' name='id' style='display:block;margin-left:53px;' onchange='diyiji()'><option value='-1'>请选择一个国家</option><option value='0'>中国</option></select>" +
                "<select id='dierji' lay-verify='' name='id' style='display:block;margin-left:53px;margin-top:15px' onchange='two()'><option value='-1'>请选择省份/直辖市/自治区</option></select>"+
                "<select id='disanji' lay-verify='' name='userAddress' style='display:block;margin-left: 53px;margin-top:15px;margin-bottom:20px' ><option value='-1'>请选择城市</option></select>"+
                "职业：<input type='text' name='userProfession' class='userProfession' value='${users.userProfession}' /><br />" +
                "<button class='layui-btn' lay-submit id='amendbtn' lay-filter='login'>修改</button></form></div>"
            var layer = layui.layer;
            layer.open({
                title: '修改信息',
                type:1,
                area: ['300px', '500px'],
                offset: ['100px', '650px'],
                content: page
            });
            // $("#di")<select id='dierji'></select><select id='disanji'></select>
        })
    })
    $("#amendA").click(function () {
        layui.use('layer', function(){
            var layer = layui.layer;
            var file = "<form action='${pageContext.request.contextPath}/user/FileUpLoad' method='post' enctype='multipart/form-data' style='margin-left: 20px;margin-top: 20px'><input type='file' name='photo'/><br /><input type='submit' style='margin-top: 20px;'/></form>"
            layer.open({
                title: '上传头像',
                type:1,
                area: ['300px', '150px'],
                offset: ['100px', '650px'],
                content:file
            });
        })
    })
    function two(){
        var dateVal =$("#dierji").val()
        if (dateVal==-1){
            alert("请选择省份、直辖市或自治区")
        }else{
            $.ajax({
                url:"${pageContext.request.contextPath}/address/queryInfoById",
                type:"POST",
                data:$("#dierji").serialize(),
                dataType:"JSON",
                success:function (data) {
                    var arr = eval(data);
                    $.each(arr,function (index,val) {
                        $("#disanji option:not(:first)").empty("");
                        if (val.length>0){
                            for (var i = 0;i<val.length;i++){
                                var addressId = val[i].addressId
                                var addressName = val[i].addressName
                                var item = "<option value="+addressId+">"+addressName+"</option>"
                                $("#disanji").append(item)
                            }
                        }
                    })
                },
                error:function () { alert("错误") }
            })
        }

    }
    function diyiji(){
        var dateVal =$("#zuigaoji").val()
        if (dateVal==-1){
            alert("请选择一个国家")
            $("#dierji option:not(:first)").remove();
        }else{
            $.ajax({
                url:"${pageContext.request.contextPath}/address/queryInfoById",
                type:"POST",
                data:$("#zuigaoji").serialize(),
                dataType:"JSON",
                success:function (data) {
                    var arr = eval(data);
                    $.each(arr,function (index,val) {
                        $("#dierji option:not(:first)").remove();
                        if (val.length>0){
                            for (var i = 0;i<val.length;i++){
                                var addressId = val[i].addressId
                                var addressName = val[i].addressName
                                var item = "<option value="+addressId+">"+addressName+"</option>"
                                $("#dierji").append(item)
                            }
                        }
                    })
                },
                error:function () { alert("错误") }
            })
        }

    }
    $(function  () {
        layui.use('form', function(){
            var layer = layui.layer;
            var form = layui.form;
            //监听提交
            form.on('submit(login)', function(data){
                if ($(".layui-form .userNickname").val()==null||$(".userNickname").val()==""){
                    alert("昵称不能为空")
                    return false;
                }else {
                    alert("修改成功")
                }
            });
        });
    })
</script>
</html>