<%@ page language="java"   import="java.util.*"  pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>登录</title>
    <link href="${contextPath}/css/loginType.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/login.js" type="text/javascript"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    
    <!--<script>-->
        <!--function checkForm()-->
        <!--{-->
            <!--var input1=document.getElementById("phone").value;-->
            <!--if(input1=="" || input1==null){-->
                <!--alert("手机号不能为空！！");-->
            <!--}-->
            <!--var input2=document.getElementById("pwd").value;-->
            <!--if(input2=="" || input2==null){-->
                <!--alert("密码不能为空！！");-->
            <!--}-->
        <!--}-->
    <!--</script>-->
    <script type="text/javascript">
    	var previousURL = '${previousURL}';
	    function userLogin(){
	    	var phone = document.getElementById("phone").value;
	    	if(!phone||!(/^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\d{8}$/g.test(phone))){
	    		Box.autoClose('请输入正确的手机号');
	    		return;
	    	}
	    	var pwd = document.getElementById("pwd").value;
	    	if(!pwd||pwd.length < 6){
	    		Box.autoClose('密码不正确');
	    		return;
	    	}
	    	var data={phone:phone,pwd:pwd};
			$.ajax({
	    		url:'${contextPath}/pub/doLogin',
	    		type:'post',
	    		dataType:'json',
	    		data:data,
	    		success:function(data){
					if(data.exceptionCode){
						Box.autoClose(data.exceptionMsg);
					}else{
						var previousURL="${previousURL}";
						if(previousURL.length>1 && previousURL != "login"){
							location.href="${previousURL}";
						}else if(previousURL == "login")
						{
							location.href="${previousURL}".replace("login","user/homecenter");
						}else{
							location.href="${contextPath}/user/homecenter";
						}
					}
	    		},
	    		error:function(data){
	    			Box.autoClose('提交失败，请检查网络');
	    		}
	    	});
		}
    </script>
<head>
	<base href="<%=basePath%>">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户登陆</title>
</head>
<body>
<article>
    <div class="logo">
        <img class="small" src="${contextPath}/image/login1.png">
    </div>
    <form class="form" name="form1" id="form1" onsubmit="return checkForm()" action="${contextPath}/pub/doLogin">
        <div class="login_input_panel">
            <div class="login_input1">
                <img class="logo1" src="${contextPath}/image/login2.jpg">
                <input class="input1" type="text" placeholder="手机号" id="phone" name="phone">
            </div>
            <div class="login_input2">
                <img class="logo2" src="${contextPath}/image/login3.jpg">
                <input class="input2" type="password" placeholder="密码" id="pwd" name="pwd">
            </div>
            <div class="login_input3" onclick="userLogin()">
            <span class="input3" id="span1">登录</span>
            </div>
        </div>
    </form>
    <div class="connect">
        <div class="connect1">
         <a href="${contextPath}/pub/register?openId=${openId}">注册</a>
         <a href="${contextPath}/pub/updatePwd">忘记密码？</a>
        </div>
    </div>
</article>
</body>
</html>