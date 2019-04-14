<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
	    <meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="${contextPath}/css/H-ui.login.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
	    <title>SYE后台系统登录</title>
	    <script type="text/javascript">
	    	function doLogin(){
	    		document.getElementById("loginForm").submit();
	    	}
	    	/*
	         *敲回车进行登录
	         */
	    	function doEnterLogin(){
	    		var event=arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异
	    		if (event.keyCode==13) {
	    			doLogin();
 	    		} 
	    	} 
	    </script>
	</head>
	<body onkeydown="doEnterLogin();">
	
		<input type="hidden" id="TenantId" name="TenantId" value="" />
		    
		    <div class="loginWraper">
		      <div class="header"><p><span>SYE享创业大数据管理系统</span></p></div>
		      <div id="loginform" class="loginBox">
		      <form class="form form-horizontal" id="loginForm" action="${contextPath}/pub/doBGLogin" method="post">
		        <div class="loginform_user">
		          <p>请输入您的用户名：</p>
		          <input type="text" name="name" />
		          <p>请输入您的密码：</p>
		          <input type="password" name="pwd" />
		          <div class="login_prompt">${exception}</div>
		        </div>
		        <div class="loginform_login" id="login" onclick="doLogin();">登录</div>
		      </form>
		    </div>
		  </div>
	</body>
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
</html>