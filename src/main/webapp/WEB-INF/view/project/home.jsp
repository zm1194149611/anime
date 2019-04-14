<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>SYE创业四川官方服务平台</title>
    <link href="${contextPath}/css/home.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
    var contextPath = '${contextPath}';
    var userId='${userId}';
    var domain = '${domainName}';
    var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddHome";
    </script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/home.js" type="text/javascript"></script>
    
</head>
<body>
<header>
    <ul>
        <li id="tutor">
            <div class="one-total">
                <div class="one">
                    <span>${list[0].tutorCount}</span>
                </div>
                <p>导师志愿者/人</p>
            </div>
        </li>
        <li>
            <div class="fund">
                <label>${list[0].money}</label>
            </div>
        </li>
        <li id="project">
            <div class="three-total">
                <div class="three">
                    <span>${list[0].projectCount}</span>
                </div>
                <p>扶持项目/个</p>
            </div>
        </li>
    </ul>
</header>
<img class="compass" src="${contextPath}/image/home-compass.png">
<section>
    <div class="map" id="map">
        <img class="sichuan" src="${contextPath}/image/map.png">
        <img class="chengdu" id="chengdu" src="${contextPath}/image/map-chengdu.png">
        <img class="chuandong" id="chuandong" src="${contextPath}/image/map-chuandongbei.png">
        <img class="chuanxi" id="chuanxi" src="${contextPath}/image/map-chuanxibei.png">
        <img class="chuannan" id="chuannan" src="${contextPath}/image/map-chuannan.png">
        <img class="chuanbei" id="chuanbei" src="${contextPath}/image/map-panxi.png">
        <img class="phone" id="phone" src="${contextPath}/image/tellphone.png">
    </div>
</section>
<div class="precinct">
    <ul>
        <li id="turnLeft"><img src="${contextPath}/image/home-left.png"><span id="left"></span></li>
        <li class="second" id="chooseArea"><img src="${contextPath}/image/home-landmark.png"><span id="choose"></span></li>
        <li id="turnRight"><span id="right"></span><img src="${contextPath}/image/home-right.png"></li>
    </ul>
</div>
<div class="fill"></div>
</body>
</html>