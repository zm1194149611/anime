<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>修改密码</title>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/form.css" rel="stylesheet" type="text/css">
    <!--弹出层JS-->
    <script src="${contextPath}/js/box.js"></script>
    <!--!end 弹出层JS-->
    <script src="${contextPath}/js/form.js"></script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
    	afterUpdatePWDCheck=function(data){
    		$.ajax({
        		url:'${contextPath}/pub/doUpdatePwd',
        		type:'post',
        		dataType:'json',
        		data:data,
        		success:function(data){
    				if(data.exceptionCode){
    					Box.autoClose(data.exceptionMsg);
    				}else{
    					Box.alert('提交成功，点击确定返回个人中心',function(){
    						location.href="${contextPath}/user/homecenter";
    					});
    				}
        		},
        		error:function(data){
        			Box.autoClose('提交失败，请检查网络');
        		}
        	});
    	}
    	
    	//获取验证码
    	function obtainCode()
        {
        	var phone = document.getElementById("tel").value;
        	var data={phone:phone,action:"updatepwd"};
        	$.ajax({
        		url:'${contextPath}/pub/registerCode',
        		data:data,
        		async:false
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
        	var phone = document.getElementById("tel").value;
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
    	   var testCode = document.getElementById("testCode");
    	   testCode.style.backgroundColor  = "#bbbbbb";
    	   timespan-=seq;
    	   node.innerHTML=Math.ceil(timespan/1000)+"秒";
    	   setTimeout("spanTimeOut(200);",200);
    	}
        $(function(){//页面加载完成执行
    		node=document.getElementById("testCode");
        	newPasswordTest();
        	node.onclick = startObtainCode;
        });
    </script>
</head>
<body>
<article>
    <p class="tip">请认真填写下列信息修改密码</p>
    <form  action="${contextPath}/user/doUpdatePwd" method="post">
        <ul class="new">
            <li><img src="${contextPath}/image/new2.jpg"><input type="text" id="tel" placeholder="手机号"></li>
            <li><img src="${contextPath}/image/new3.jpg"><input type="text" id="test" placeholder="短信验证码"><span id="testCode">获取验证码</span></li>
            <li><img src="${contextPath}/image/new4.jpg"><input type="password" id="password" placeholder="新密码"></li>
            <li><img src="${contextPath}/image/new1.jpg"><input type="password" id="newPassword" placeholder="再次输入新密码"></li>
        </ul>
        <span id="update">确认修改并登录</span>
    </form>
</article>
</body>
</html>