<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>项目审核</title>
    <link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <!--分页器Js-->
    <script type="text/javascript" src="${contextPath}/js/jquery.js" ></script>
    <script type="text/javascript" src="${contextPath}/js/box.js" ></script>
    <!--end！分页器Js-->
</head>
<body>
<header>
</header>
    <div class="classify">
        <ul>
        	<li>
                <label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
                <p>
                    <span><spring:message code="project.status.${project.status}" /></span>
                </p>
            </li>
            <li>
                <label>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label>
                <p>
                    <span><spring:message code="project.status.${project.status}" /></span>
                </p>
            </li>
            <li>
                <label>手&nbsp;&nbsp;机&nbsp;号：</label>
                <p>
                    <span><spring:message code="project.business.${project.business}"/></span>
                </p>
            </li>
            <li>
                <label>留言内容：</label>
                <p>
                   <span><spring:message code="project.zone.${project.zone}" /></span>
                </p>
            </li>
      		<li>
                <label>留言时间：</label>
                <p>
                    <span>${project.resPerson}</span>
                </p>
            </li>
            <li>
                <label>图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片：</label>
                <p>
                <img src="${contextPath}/pics/${project.logo}">
                    
                </p>
            </li>
        </ul>
        <!-- 按钮 -->
	<div class="identity_add_footer" style="background-color:#fff;width:95%;margin:0 auto;">
		<a class="identity_add_btn" onClick="approve(1,${userFullInfo.userid})" href="javascript:;" title="审核通过">审核通过</a>
        <a class="identity_add_btn" onClick="approve(0,${userFullInfo.userid})" href="javascript:;" title="审核不通过">审核不通过</a>
	</div>
    </div>
    

</body>
 <script type="text/javascript">
 function userLogin(){
	 var temp='${project.id}'
	 var currPage='${currPage}'
	 var data={projectId:temp}
	 $.ajax({
 		url:'${contextPath}/bg/project/bgSetPassed',
 		type:'post',
 		dataType:'json',
 		data:data,
 		success:function(data){
				if(data.exceptionCode){
					Box.autoClose(data.exceptionMsg);
				}else{
					location.href="${contextPath}/bg/project/bgPeriodProjects?currPage="+currPage;
				}
 		},
 		error:function(data){
 			Box.autoClose('提交失败，请检查网络');
 		}
 	});
 }
 
 //增加项目审核提示信息    修改人：张力    2016.1.6
 function delcfm() {
	 Box.confirm("确认审核通过？",function(){},
			 function(){
		 userLogin();
	 });
 } 
 </script>
</html>