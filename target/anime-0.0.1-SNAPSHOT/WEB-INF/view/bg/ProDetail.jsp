<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>项目审核</title>
    <link href="${contextPath}/css/public.css" type="text/css" rel="stylesheet">
    <link href="${contextPath}/css/commonBigNav.css" type="text/css" rel="stylesheet">
    <link href="${contextPath}/css/ProDetail.css" type="text/css" rel="stylesheet">
    <!--分页器样式-->
    <link href="${contextPath}/css/page.css" type="text/css" rel="stylesheet">
    <!--end！分页器样式-->
    <!--分页器Js-->
    <script type="text/javascript" src="${contextPath}/js/jquery.js" ></script>
    <script type="text/javascript" src="${contextPath}/js/box.js" ></script>
    <!--end！分页器Js-->
</head>
<body>
<header>
    <nav>
        <img src="${contextPath}/image/SYElogo.jpg">
        <ul>
            <li><a href="#">项目审核<span class="selected"></span></a></li>
            <li><a href="MessageBig.html">留言审核<span class="selected" style="display: none"></span></a></li>
        </ul>
    </nav>
</header>
<article>
    <div class="seek">
        <span>项目名称 --></span>
        <span><label>${project.name}</label></span>
    </div>
    <div style="clear: both"> </div>
    <div class="classify">
        <ul>
            <li>
                <label>项目状态：</label>
                <p>
                    <span><spring:message code="project.status.${project.status}" /></span>
                </p>
            </li>
            <li>
                <label>所属行业：</label>
                <p>
                    <span><spring:message code="project.business.${project.business}"/></span>
                </p>
            </li>
            <li>
                <label>项目所在地：</label>
                <p>
                   <span><spring:message code="project.zone.${project.zone}" /></span>
                </p>
            </li>
      
            <li>
                <label>项目负责人：</label>
                <p>
                    <span>${project.resPerson}</span>
                </p>
            </li>
            <li>
                <label>项目logo：</label>
                <p>
                    <img src="${contextPath}/pics/${project.logo}">
                </p>
            </li>
            <li>
                <label>项目简介：</label>
                <p>
                    <span>${project.projIntroduce}</span>
                </p>
            </li>
            <li>
                <label>项目封面：</label>
                <p>
                    <img src="${contextPath}/pics/${project.indexPic}">
                </p>
            </li>
            <li>
                <label>经营状况：</label>
                <p>
                    <span> ${project.operation}</span>
                </p>
            </li>
            <li>
                <label>项目照片：</label>
                <p>
             <c:forEach var="iprj" items="${projs}">
                    <img src="${contextPath}/pics/${iprj}">
              </c:forEach>             
                </p>
            </li>
            <li>
                <label>发展规划：</label>
                <p>
                    <span>${project.plan}</span>
                </p>
            </li>
            <li>
                <label>团队照片：</label>
                <p>
                    <c:forEach var="iteam" items="${teams}">
                    <img src="${contextPath}/pics/${iteam}">
                    </c:forEach>   
                </p>
            </li>
            <li>
                <label>团队介绍：</label>
                <p>
                    <span> ${project.teamIntroduce}</span>
                </p>
            </li>
        </ul>
    </div>
    <p class="detailBtn">
	    <a href="${contextPath}/bg/project/bgPeriodProjects?currPage=${currPage}"><span>返回列表</span></a>
	    <a href="javascript:delcfm();"><span>审核通过</span></a>
    </p>
</article>
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