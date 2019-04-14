<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>设置</title>
    <link href="${contextPath}/css/setting.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
    var contextPath = '${contextPath}';
    var userId='${userId}';
    var isUpdateUser = '${isUpdateUser}';
    var domain = '${domainName}';
    var type = "footerAddSubMenu";
    //var url = "${contextPath}/user/logout"; 
    function logout(url)
    {
    	/* $.get(url,function(data,status){
			$loading.hide();
			//alert(data);
    		$("#tutor-section").append(data);
			loading = false;
		}); */
    	
    	$.get(url,function(data,status){
    		location.href="${contextPath}/pub/login"
    	});
    }
    </script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script>
        window.onload= function () {
            footer.footerAddMy();
        }
    </script>
</head>
<body>
<div class="mycenter-menu">
    <ul>
        <li class="first">
            <a href="#">
                <span>版本信息</span>
                <span class="version">v3.0</span>
            </a>
        </li>
        <li class="first">
            <a href="https://www.wenjuan.com/s/VJJVvu/">
                <span>意见反馈</span>
                <img src="${contextPath}/image/mycenter-arrows.png">
            </a>
        </li>
        <li class="first">
            <a href="${contextPath}/user/wechat">
                <span>微信绑定</span>
                <img src="${contextPath}/image/mycenter-arrows.png">
            </a>
        </li>
        <li class="first">
            <a href="#">
                <span>帮助</span>
                <img src="${contextPath}/image/mycenter-arrows.png">
            </a>
        </li>
    </ul>
</div>
<div class="last">
    <ul>
        <li>
            <a href="JavaScript:logout('${contextPath}/user/logout')">
                <span class="back">退出登录</span>
            </a>
        </li>
    </ul>
</div>
<div class="footer-fill"></div>
</body>
</html>