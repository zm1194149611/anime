
<!--我的项目页面-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>我的项目</title>
    <link href="${contextPath}/style/public.css" rel="stylesheet" type="text/css">
    <!--弹出层JS-->
    <script src="${contextPath}/JavaScript/box.js"></script>
    <!--!end 弹出层JS-->
    <style>
        .logoImg{
            width: 34%;
            position: relative;
            display: block;
            margin: 20% 33% 8% 33%;
        }
        .font{
            width: 86%;
            position: relative;
            margin: 0 auto;
            text-align: center;
            color: #959596;
        }
        .font span{
            width: 15%;
            float: left;
            display: inline-block;
            height: 20px;
            border-bottom: 1px solid #bbbbbb;
        }
        .font p{
            float: left;
            width: 70%;
        }
        .font p label{
            display: block;
        }
        .font p label:first-of-type{
            font-size: 22px;
            line-height: 40px;
            height: 40px;
        }
        .font p label:last-of-type{
            font-size: 14px;
            line-height: 40px;
            height: 40px;
        }
        .moreImg{
            width: 24%;
            position: relative;
            display: block;
            padding-top: 30px;
            margin-left:40%;
        }
    </style>
</head>
<body>
<article>
    <img class="logoImg" src="${contextPath}/image/login1.png">
    <div class="font">
        <span></span>
        <p>
            <label>您还没有上传项目</label>
            <label>点击如下图标马上添加项目</label>
        </p>
        <span></span>
    </div>
    <a href="${contextPath}/project/create">
        <img class="moreImg" src="${contextPath}/image/morePro.png">
    </a>
</article>
</body>
</html>