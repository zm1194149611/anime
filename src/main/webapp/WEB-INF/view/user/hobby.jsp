<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>兴趣爱好</title>
    <link href="${contextPath}/css/choose.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/choose.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
    var hobby=new Array();
        window.onload= function () {
        	<c:choose>
        	<c:when test='${user.hobby!=null||fn:length(user.hobby)>0}'>
            choose('hobby',17,4,"${user.hobby}".split(","),hobby);
            </c:when>
            <c:otherwise>
            choose('hobby',17,4,"",hobby);
            </c:otherwise>
            </c:choose>
        };
        function returnApproving()
        {
        	var str="";
        	for(var i=0;i<hobby.length;i++)
        	{
        		if(hobby[i]==1)
        			str+=(i+1)+",";
        	}
       	    if(str=="")
       		 return;
       		doModify("hobby",str);
       	 
        }
        function doModify(fieldName,value){
        	var data={fieldName:fieldName,value:value};
    		 $.ajax( {
    	        type : "post",  
    	        url : "updateUserInfo",  
    	        data:data,
    	        dataType:"json",  
    	        success : function(data) {  
    	            if(data.exceptionCode){
    	            	Box.autoClose(data.exceptionMsg);
    	            }
    	            location.href="${contextPath}/user/approving";
    	        },
    	        error:function(data){
    	        	Box.autoClose("保存失败，请检查网络");
    	        }
    		}); 
        }
    </script>
</head>
<body>
<header>
    <a href="${contextPath}/user/approving"><img src="${contextPath}/image/arrows-left.png"></a>
    <p>兴趣爱好</p>
    <a href="javascript:returnApproving()"><span>确定</span></a>
</header>
<ul id="hobby" class="hobby">
    <li><span class="choose">羽毛球</span><span class="right" >&#10003</span></li>
    <li><span class="choose">高尔夫球</span><span class="right" >&#10003</span></li>
    <li><span class="choose">网球</span><span class="right">&#10003</span></li>
    <li><span class="choose">滑雪</span><span class="right">&#10003</span></li>
    <li><span class="choose">艺术展示</span><span class="right">&#10003</span></li>
    <li><span class="choose">音乐欣赏</span><span class="right" >&#10003</span></li>
    <li><span class="choose">国学</span><span class="right" >&#10003</span></li>
    <li><span class="choose">心理学</span><span class="right" >&#10003</span></li>
    <li><span class="choose">摄影摄像</span><span class="right">&#10003</span></li>
    <li><span class="choose">竞买竞拍</span><span class="right">&#10003</span></li>
    <li><span class="choose">慈善走访</span><span class="right">&#10003</span></li>
    <li><span class="choose">捐赠活动</span><span class="right" >&#10003</span></li>
    <li><span class="choose">实践类</span><span class="right" >&#10003</span></li>
    <li><span class="choose">登山</span><span class="right">&#10003</span></li>
    <li><span class="choose">游园</span><span class="right">&#10003</span></li>
    <li><span class="choose">海边游</span><span class="right">&#10003</span></li>
    <li><span class="choose">农家乐</span><span class="right" >&#10003</span></li>
</ul>
</body>
</html>