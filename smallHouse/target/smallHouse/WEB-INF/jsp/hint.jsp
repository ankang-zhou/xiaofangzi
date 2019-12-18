<%--
  Created by IntelliJ IDEA.
  User: 鸣人
  Date: 2019/12/18
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
                                <%--登录验证页面--%>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
    <style>
        #info{
            width: 600px;
            margin: 0 auto;
            font-family: "YouYuan";
        }
        h2,h4{
            text-align: center;
        }
        #skipA{
            text-decoration: none;
            font-family: "YouYuan";
            color: #2b669a;
        }
        #skipA:hover{
            color: #057726;
        }
        BODY {
            MARGIN: 0px;
            BACKGROUND-COLOR: #000000
        }
        BODY {
            COLOR: #ffffff;
            FONT-FAMILY: Comic Sans MS;
            background-image: url(/static/quanmaomao/images/bg.jpg);
            background-repeat: repeat;
            background-color: #D9D9D9;
        }
        TD {
            COLOR: #ffffff;
            FONT-FAMILY: Comic Sans MS
        }
        TH {
            COLOR: #ffffff;
            FONT-FAMILY: Comic Sans MS
        }
        .style6 {
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px
        }
        .style7 {
            FONT-SIZE: 18px
        }
        .style8 {
            FONT-SIZE: 12px
        }
        .style9 {
            FONT-SIZE: 24px;
            FONT-FAMILY: "楷体_GB2312"
        }
        .style10 {
            COLOR: #ff0000
        }
        body,
        td,
        th {
            color: #666;
        }
        a {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 18px;
            color: #666;
        }

        a:link {
            text-decoration: none;
            color: #06F;
        }

        a:visited {
            text-decoration: none;
            color: #09F;
        }

        a:hover {
            text-decoration: none;
            color: #09F;
        }

        a:active {
            text-decoration: none;
            color: #09F;
        }
    </style>
</head>
<body>
    <p>&nbsp;</p>
    <div id="info">
        <h2>账号或密码<span style="color: red">有误</span>!请重试。</h2>
        <h4 ><a id="skipA" href="skipLogin">放松一下吧，想要返回登录，点击这里哦</a></h4>
    </div>
    <div align="center">
        <p align="left"></p>
        <div id="catch-the-cat"></div>
    </div>
    <div class="style6" align="center" style="width: 100%;height: 64%;">
        <p id="time" class="style7">0</p>
        <div id="loadad"></div>
    </div>

    <script src="${pageContext.request.contextPath}/static/quanmaomao/js/phaser.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/quanmaomao/js/catch-the-cat.js"></script>
    <script>
        var myVar = setInterval(myTimer, 1000);
        var time = 0;
        function myTimer() {
            time += 1;
            document.getElementById("time").innerHTML = time;
        }
        window.game = new CatchTheCatGame({
            w: 11,
            h: 11,
            r: 20,
            backgroundColor: 16777215,
            parent: "catch-the-cat",
            statusBarAlign: "center",
            credit: "圈小猫"
        })
    </script>
</body>

</html>
