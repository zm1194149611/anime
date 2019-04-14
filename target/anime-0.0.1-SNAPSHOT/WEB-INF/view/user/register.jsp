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
    <title>注册</title>
    <link href="${contextPath}/css/registeredType.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/register.js" type="text/javascript"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
    var isSubmitting = false;
    var msg="注册成功，是否进行身份认证";
    function obtainCode()
    {
    	var phone = document.getElementById("phone").value;
    	var data={phone:phone,action:"register"};
    	$.ajax({
    		url:'${contextPath}/pub/registerCode',
    		data:data,
    		async:false
    		});
    }
    
    function userRegister(){
    	//检查字段
    	var phone = document.getElementById("phone").value;
    	if(!phone||!(/^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\d{8}$/g.test(phone))){
    		Box.autoClose('请输入正确的手机号');
    		return;
    	}
    	var pwd = document.getElementById("pwd").value;
    	if(!pwd || pwd.length < 6){
    		Box.autoClose('密码长度不足');
    		return;
    	}
    	var code = document.getElementById("code").value;
    	if(!code || code.length != 6){
    		Box.autoClose('验证码长度不足');
    		return;
    	}
    	var data={openId:'${openId}',telphone:phone,password:pwd,code:code};
    	if(isSubmitting){
    		Box.autoClose("注册中，请稍候...");
    		return;
    	}
    	isSubmitting = true;
    	$.ajax({
    		url:'${contextPath}/pub/doRegister',
    		type:'post',
    		dataType:'json',
    		data:data,
    		success:function(data){
    			isSubmitting = false;
				if(data.exceptionCode){
					Box.autoClose(data.exceptionMsg);
				}else{
					Box.confirm(msg,function(){
						location.href="${contextPath}/ground/home";
					},function(){
						location.href="${contextPath}/user/homecenter";
					});
				}
    		},
    		error:function(data){
    			isSubmitting = false;
    			Box.autoClose('提交失败，请检查网络');
    		}
    	});
    }
    var final_timeMax = 60000;
    var timespan=0;
    var node = "";
    var secObtainCodeMsg = "重新获取";
    function startObtainCode(){  
    	if(timespan>0){
			return;
		}
    	var phone = document.getElementById("phone").value;
    	if(!phone||!(/^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\d{8}$/g.test(phone))){
    		Box.autoClose('请输入正确的手机号');
    		return;
    	}
       obtainCode();
       timespan = final_timeMax;
       setTimeout('spanTimeOut(200);',0);
	}
	function spanTimeOut(seq)
	{
	   if(timespan<=0){
		   node.innerHTML = secObtainCodeMsg;
		   return;
	   }
	   var smsCode = document.getElementById("smsCode");
	   smsCode.style.backgroundColor  = "#bbbbbb";
	   timespan-=seq;
	   node.innerHTML=Math.ceil(timespan/1000)+"秒";
	   setTimeout("spanTimeOut(200);",200);
	}
    $(function(){//页面加载完成执行
		node=document.getElementById("smsCode");
    });
    </script>
</head>
<body>
<article>
    <div class="tit">
        <h5>请认真填写以下信息成为SYE用户</h5>
    </div>
    <form action="${contextPath}/pub/doRegister" method="post" class="register">
        <div class="input1">
            <img class="logo1" src="${contextPath}/image/register1.jpg">
            <input class="text1" type="text" placeholder="手机号" name="telphone" id="phone">
        </div>
        <div class="input2">
            <img class="logo2" src="${contextPath}/image/register2.jpg">
            <input class="text2" type="text" placeholder="短信验证码" name="code" id="code">
			<div class="submit1" id="smsCode" onclick="startObtainCode();">获取验证码</div>      
        </div>
        <div class="input3">
            <img class="logo3" src="${contextPath}/image/register3.jpg">
            <input class="text3" type="password" placeholder="密码,至少6位" name="password" id="pwd">
        </div>
        <div class="input4"  onclick="userRegister()">
            <span id="span2">注册</span>
        </div>
    </form>
</article>
<div class="link">
    <a href="http://www.95omno.com/user/userAgreement_F03.html">轻触上面的“注册”按钮，即表示你同意<br>《SYE创业四川软件许可及服务协议》</a>
</div>
</body>
</html>