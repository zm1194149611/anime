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
    <link href="${contextPath}/css/wechat.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
    var contextPath = '${contextPath}';
    var userId='${user.id}';
    var domain = '${domainName}';
    var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
    </script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/js/box.js"></script>
     <script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
        window.onload= function () {
            footer.footerAddMy();
        }
      function binding()
      {
    	 var url = "${contextPath}/user/binding?binding=1"; 
  		  $.get(url,function(data,status){
  		  if(data.indexOf("Success")!=-1){
   		   Box.alert("绑定成功")
  		  }
  		  else
  		  {
  			if(data.indexOf("un")!=-1)
	  		{	
	  		   Box.alert("您尚未关注SYE公众号，点击确定进入关注页面");
			   location.href="http://mp.weixin.qq.com/s?__biz=MzA3MTU2MjI3MA==&mid=401284503&idx=1&sn=e629ad7caa8fdd5237f8926c116c7120&scene=0&previewkey=J0inPRqrDDJSIRu43UxJ4sNS9bJajjJKzz%2F0By7ITJA%3D#wechat_redirect";
	  	    }
	  		else
  			Box.alert("绑定失败") 
  		  }
  		})
      }
      function release()
      {
    	  var url = "${contextPath}/user/binding?binding=0"; 
  		  $.get(url,function(data,status){
  			 if(data.indexOf("Success")!=-1){
  				Box.alert("解除绑定成功")
  	  		  }
  	  		  else
  	  		  {
  	  		 	Box.alert("解除绑定失败")
  	  		  }
   		  
  		})
      }
    </script>
</head>
<body>
<div class="wechattop">
    <img src="${contextPath}/image/WeChat.png">
</div>
<div class="bdbtn">
    <p onclick="binding()">绑定微信号</p>
    <p onclick="release()">解绑微信号</p>
</div>
</body>
</html>