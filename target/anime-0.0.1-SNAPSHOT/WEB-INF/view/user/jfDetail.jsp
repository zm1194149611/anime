<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>积分详情</title>
    <link href="${contextPath}/css/jfDetail.css" rel="stylesheet" type="text/css">
	<link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${contextPath}/js/footer.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
	<script type="text/javascript">
	var contextPath = '${contextPath}';
	var userId='${user.id}';
	var domain = '${domainName}';
	var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
	function consulting(){
		Box.alert("还在开发中……");
	}
	$(function(){
		footer.footerAddSubMenu();
	});
	</script>
</head>
<body>
<header>
    <ul>
        <li id="tutor">
        <a href="${contextPath}/user/details">
            <div class="one-total">
                <div class="one">
                <img src="${contextPath}/image/jfdetail.png" >
                    <div>积分明细</div>
                </div>
<!--                 <p>积分明细</p> -->
            </div>
        </a>
        </li>
        <li>
            <div class="jfnow">
                <span>${user.totalGrade}</span>
            </div>
        </li>
        <li id="project">
        <a href="${contextPath}/user/jfrule">
            <div class="three-total">
                <div class="three">
                <img src="${contextPath}/image/jfrule.png" >
                    <div>积分规则</div>
                </div>
<!--                 <p>积分规则</p> -->
            </div>
        </a>
        </li>
    </ul>
</header>
<!-- <header> -->
<!--     积分明细 -->
<%--     <a class="Laundry_list" href="${contextPath}/user/details"> --%>
<%--         <img src="${contextPath}/image/jfmark.png"> --%>
<!--         <span>积分明细</span> -->
<!--     </a> -->
<!--     积分 -->
<!--     <div class="jfnow"> -->
<%--         <span>${user.totalGrade}</span> --%>
<!--     </div> -->
<!--     积分规则 -->
<%--     <a class="jfrule" href="${contextPath}/user/jfrule"> --%>
<%--         <img src="${contextPath}/image/jfmark.png"> --%>
<!--         <span>积分规则</span> -->
<!--     </a> -->
<!-- </header> -->
<!-- 当日积分 -->
<section class="jftitle">
    <span>当日积分</span>
</section>
<section class="history">
    <ul>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>今日登录<span>${user.dayEnroll}/2</span></p>
                </div>
            </div>
        </li>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>今日互动评论<span>${user.dayComm}/10</span></p>
                </div>
            </div>
        </li>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>今日点赞<span>${user.dayVoteUp}/10</span></p>
                </div>
            </div>
        </li>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>今日分享<span>${user.dayShare}/10</span></p>
                </div>
            </div>
        </li>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>今日发布话题<span>${user.dayTopic}/10</span></p>
                </div>
            </div>
        </li>
    </ul>
</section>
<br/>
<!-- 往日积分 -->
<section class="jftitle">
    <span>往日积分</span>
</section>
<section class="history">
    <ul>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>往日登录<span>${user.totalEnroll}</span></p>
                </div>
            </div>
        </li>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>往日互动评论<span>${user.totalComm}</span></p>
                </div>
            </div>
        </li>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>往日点赞<span>${user.totalVoteUp}</span></p>
                </div>
            </div>
        </li>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>往日分享<span>${user.totalShare}</span></p>
                </div>
            </div>
        </li>
        <li>
            <div class="history_border">
                <div class="history_left">
                    <p>往日发布话题<span>${user.totalTopic}</span></p>
                </div>
            </div>
        </li>
    </ul>
</section>
<div class="mar"></div>
</body>
</html>