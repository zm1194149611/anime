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
        <h5>日月明动漫小屋</h5>
    </div>
    <div class="logo" style="position: relative;text-align: center;height: 200px;margin-top: 0;padding: 0;">
        <img class="small" style="position: relative; margin: 0;padding-top: 80px;height: 125px;" src="${contextPath}/image/login1.png">
    </div>
    <div class="input4"  onclick="userRegister()">
        <span id="span2">微信一键登录</span>
    </div>
    
</article>
<div class="link">
    <a href="javascript:;">轻触上面的“微信一键登录”按钮，即可登录到网站！</a>
</div>
</body>
</html>