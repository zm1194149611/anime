<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>专业技术</title>
    <link href="${contextPath}/css/choose.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/choose.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
    var major =new Array() ;
        window.onload= function () {
        	<c:choose>
        	<c:when test='${user.skills!=null||fn:length(user.skills)>0}'>
            choose('major',24,4,"${user.skills}".split(","),major);
            </c:when>
            <c:otherwise>
            choose('major',24,4,"",major);
            </c:otherwise>
            </c:choose>
        };
        function returnApproving()
        {
        	var str="";
        	for(var i=0;i<major.length;i++)
        	{
        		if(major[i]==1)
        			str+=(i+1)+",";
        	}
       	    if(str=="")
       		 return;
       		doModify("skills",str);
       	 
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
    <p>专业技术</p>
    <a href="javascript:returnApproving()"><span>确定</span></a>
</header>
<ul id="major" class="major">
    <li><span class="choose">种植和养殖</span><span class="right" >&#10003</span></li>
    <li><span class="choose">建筑</span><span class="right" >&#10003</span></li>
    <li><span class="choose">财务管理</span><span class="right">&#10003</span></li>
    <li><span class="choose">金融管理</span><span class="right">&#10003</span></li>
    <li><span class="choose">行政管理</span><span class="right">&#10003</span></li>
    <li><span class="choose">家政服务</span><span class="right">&#10003</span></li>
    <li><span class="choose">物业管理</span><span class="right">&#10003</span></li>
    <li><span class="choose">影音设计</span><span class="right">&#10003</span></li>
    <li><span class="choose">图文设计</span><span class="right">&#10003</span></li>
    <li><span class="choose">信息技术</span><span class="right">&#10003</span></li>
    <li><span class="choose">市场研究</span><span class="right">&#10003</span></li>
    <li><span class="choose">市场营销</span><span class="right">&#10003</span></li>
    <li><span class="choose">法律咨询</span><span class="right">&#10003</span></li>
    <li><span class="choose">税务与审计</span><span class="right" >&#10003</span></li>
    <li><span class="choose">教育与培训</span><span class="right" >&#10003</span></li>
    <li><span class="choose">环境策划</span><span class="right">&#10003</span></li>
    <li><span class="choose">公众演讲</span><span class="right">&#10003</span></li>
    <li><span class="choose">社会工作</span><span class="right">&#10003</span></li>
    <li><span class="choose">商业计划</span><span class="right">&#10003</span></li>
    <li><span class="choose">调查与评估</span><span class="right">&#10003</span></li>
    <li><span class="choose">撰写编辑</span><span class="right">&#10003</span></li>
    <li><span class="choose">宣传推广</span><span class="right">&#10003</span></li>
    <li><span class="choose">筹募资源</span><span class="right" >&#10003</span></li>
    <li><span class="choose">战略规划</span><span class="right" >&#10003</span></li>
</ul>
</body>
</html>