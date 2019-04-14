<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>摇项目</title>
    <link href="<%=request.getAttribute("contextPath")%>/css/public.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getAttribute("contextPath")%>/css/rock.css" rel="stylesheet" type="text/css">
     <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/app.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/shake.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/box.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script type="text/javascript" src="${contextPath}/js/footer.js"></script>
    <script type="text/javascript">
    	var contextPath = '<%=request.getAttribute("contextPath")%>';
    	var userId='${userId}';
    	var isUpdateUser = '${isUpdateUser}';
    	var domain = '${domainName}';
        var type = "footerAddSubMenu";
    	Shake.shakeAct = function(){
    		$.ajax({url:contextPath+"/ground/queryRandomProject",
     		   data:{},
     		   dataType:'json',
     		   success:function(data, textStatus, jqXHR){
     			   var showExeMsg = function(){
 	    			   var result = data.result;
 	    			   console.log(result);
 	    			   if(result){
 	    				  Box.alert("您摇到了项目《"+result.projectName+"》，点击确定进入该项目详情页面",function(){
	 	    		    	  location.href = result.projectURL;
 	    				  });
 	    			   }else{
 	    				  Box.alert("出错啦，请重试");
 	    			   }
     			   };
     			   setTimeout(showExeMsg,0);
     		   },
     		   error:function(){
     			 	Box.autoClose('网络异常，请检查您的网络');
     		   }
     	   });
    	}; 
    	Shake.afterAct=function(){};
    	Shake.init();
    </script>
    
    <!-- ----------------以下是添加内容---------------- -->
    <script type="text/javascript">
    <%
    java.util.Map<String,String> shareInfo = (java.util.Map<String,String>)request.getAttribute("info");
    shareInfo = shareInfo==null?new java.util.HashMap<String,String>():shareInfo;
    %>
		App.data.wechat.apis = ['onMenuShareAppMessage'];
		App.data.wechat.API_NAMEs = {'onMenuShareAppMessage':'分享给朋友'};
		$(function(){
			footer.footerAddSubMenu();
			wx.ready(function(){
			wx.onMenuShareAppMessage({
			    title: '<%=shareInfo.get("title")%>', // 分享标题
			    desc: '<%=shareInfo.get("desc")%>', // 分享描述
			    link: '<%=shareInfo.get("link")%>', // 分享链接
			    imgUrl: '<%=shareInfo.get("imgUrl")%>', // 分享图标
			    type: 'link', // 分享类型,music、video或link，不填默认为link
			    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
			    success: function () { 
			        // 用户确认分享后执行的回调函数
			        //alert("success");
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    	//alert("success");
			    }
			});
			});
	
		});
		
	</script>
	<%@include file="jspf/wechatInit.jspf"%>
    <!-- ------------------以上是添加内容------------------------ -->
    
</head>
<body>
<article>
    <div class="rock center">
        <img class="center" src="<%=request.getAttribute("contextPath")%>/image/yao%20(2).png">
    </div>
    <div class="font">
    	<p><img src="${contextPath}/image/yao.png"><span>摇一摇轻松开启创业之旅</span><img src="${contextPath}/image/yao.png"></p>
    </div>
</article>
<div class="foot"> 四川精工伟达智能技术股份有限公司<br>提供运营及技术支持</div>
</body>
</html>
