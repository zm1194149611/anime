<%@ page language="java"   import="java.util.*"  pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head lang="en">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>获取漫画资源</title>
    <link href="${contextPath}/css/registeredType.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/register.js" type="text/javascript"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
    var isSubmitting = false;
   
    
    function userConfirm(){
    	//检查字段
    	var sourcePath = document.getElementById("sourcePath").value;
    	//var sourceNo = document.getElementById("sourceNo").value;
    	var sourcePage = document.getElementById("sourcePage").value;
    	var targetName = document.getElementById("targetName").value;
    	var cartoonId = document.getElementById("cartoonId").value;
    	var targetTitle = document.getElementById("targetTitle").value;
    	var targetNo = document.getElementById("targetNo").value;
    	var needLogin = document.getElementById("needLogin").value;
    	var startNo = document.getElementById("startNo").value;
    	var zeroNum = document.getElementById("zeroNum").value;
    	if(!sourcePath){
    		Box.autoClose('请输入目标资源名称');
    		return;
    	}
    	
    	if(!sourcePage){
    		Box.autoClose('请输入漫画页数');
    		return;
    	}
    	if(!targetName){
    		Box.autoClose('请输入存放资源名称');
    		return;
    	}
    	if(!cartoonId){
    		Box.autoClose('请输入存放漫画ID');
    		return;
    	}
    	if(!targetTitle){
    		Box.autoClose('请输入存放标题');
    		return;
    	}
    	if(!targetNo){
    		Box.autoClose('请输入存放编号');
    		return;
    	}
    	if(!needLogin){
    		Box.autoClose('请输入是否需要登录');
    		return;
    	}
    	
    	
    	var data={sourcePath:sourcePath,sourcePage:sourcePage,startNo:startNo,zeroNum:zeroNum,targetName:targetName,cartoonId:cartoonId,targetTitle:targetTitle,targetNo:targetNo,needLogin:needLogin};
    	if(isSubmitting){
    		Box.autoClose("获取资源中，请稍候...");
    		return;
    	}
    	isSubmitting = true;
    	$.ajax({
    		url:'${contextPath}/resource/getCartoonResource',
    		type:'post',
    		dataType:'json',
    		data:data,
    		success:function(data){
    			isSubmitting = false;
    			if(data.code!="000000"){
					Box.autoClose(data.desc);
				}else{
					Box.autoClose(data.desc);
				}
    		},
    		error:function(data){
    			isSubmitting = false;
    			Box.autoClose('提交失败，请检查网络');
    		}
    	});
    }
   
    </script>
</head>
<body>
<article>
    <div class="tit">
        <h5>请认真填写以下信息以获取漫画资源</h5>
    </div>
    <form action="${contextPath}/login/regist" method="post" class="register">
        <div class="input1">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="资源目录" name="sourcePath" id="sourcePath">
        </div>
        <div class="input1">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="资源页数" name="sourcePage" id="sourcePage">
        </div>
        <div class="input2">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="资源开始数字" name="startNo" id="startNo">
        </div>
        <div class="input2">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="10页开始有几个0" name="zeroNum" id="zeroNum">
        </div>
        <div class="input1">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="存放名称" name="targetName" id="targetName">
        </div>
        <div class="input1">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="存放编号" name="targetNo" id="targetNo">
        </div>
        <div class="input1">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="存放标题" name="targetTitle" id="targetTitle">
        </div>
        <div class="input1">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="存放漫画id" name="cartoonId" id="cartoonId">
        </div>
        <div class="input1">
            <img class="logo1" src="${contextPath}/image/register2.jpg">
            <input class="text1" type="text" placeholder="是否需要登录" name="needLogin" id="needLogin">
        </div>
        <div class="input4"  onclick="userConfirm()">
            <span id="span2">确认</span>
        </div>
    </form>
</article>

</body>
</html>