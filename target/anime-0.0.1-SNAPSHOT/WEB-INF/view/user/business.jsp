<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>所属行业</title>
    <link href="${contextPath}/css/choose.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/choose.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
    var business =new Array() ;
        window.onload= function () {
        	<c:choose>
        	<c:when test='${user.business!=null||fn:length(user.business)>0}'>
            choose('business',8,4,"${user.business}".split(","),business);
            </c:when>
            <c:otherwise>
            choose('business',8,4,"",business);
            </c:otherwise>
            </c:choose>
        };
        function returnApproving()
        {
        	var str="";
        	for(var i=0;i<business.length;i++)
        	{
        		if(business[i]==1)
        			str+=(i+1)+",";
        	}
       	    if(str=="")
       		 return;
       		doModify("business",str);
       	 
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
    <p>所属行业</p>
     <a href="javascript:returnApproving()"><span>确定</span></a>
</header>
<ul id="business" class="business">
    <li><span class="choose">农林牧渔</span><span class="right" >&#10003</span></li>
    <li><span class="choose">批发零售</span><span class="right" >&#10003</span></li>
    <li><span class="choose">服务业</span><span class="right">&#10003</span></li>
    <li><span class="choose">计算机软件</span><span class="right">&#10003</span></li>
    <li><span class="choose">住宿餐饮</span><span class="right">&#10003</span></li>
    <li><span class="choose">文化娱乐</span><span class="right">&#10003</span></li>
    <li><span class="choose">教育培训</span><span class="right">&#10003</span></li>
    <li><span class="choose">水利能源</span><span class="right">&#10003</span></li>
</ul>
</body>
</html>