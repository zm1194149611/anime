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
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
</head>
<body>
<header>
</header>
<article>
    <div class="classify">
        <ul>
        	<li>
                <label>项目名称：</label>
                <p>
                    <span>${project.name}</span>
                </p>
            </li>
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
                <label>所&nbsp;&nbsp;在&nbsp;地：</label>
                <p>
                   <span><spring:message code="project.zone.${project.zone}" /></span>
                </p>
            </li>
      
            <li>
                <label>负&nbsp;&nbsp;责&nbsp;人：</label>
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
            <!-- <li>
                <label>是否SYE：</label>
                <p>
                    <span> 
                    	<input type="radio" name="issye" value="1" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type="radio" name="issye" value="0" />否
                    </span>
                </p>
            </li> -->
        </ul>
        <!-- 按钮 -->
	<div class="identity_add_footer" style="background-color:#fff;width:95%;margin:0 auto;margin-bottom:10px;">
		<a href="bgSetPassed?projectId=${project.id}&start=${start}&issye=1&auditstatus=${auditstatus}" class="identity_add_btn" title="SYE通过">SYE通过</a>
		<a href="bgSetPassed?projectId=${project.id}&start=${start}&issye=0&auditstatus=${auditstatus}" class="identity_add_btn" title="非SYE通过">非SYE通过</a>
	</div>
    </div>
</article>
</body>
 <script type="text/javascript">
 //增加项目审核提示信息    2016.4.27
 /* function delcfm(states) {
	 var temp='${project.id}';
	 var currPage='${page.currPage}';
	 var issyes=$('input[name="issye"]:checked ').val();
	 var data={projectId:temp,state:states,issye:issyes};
	 $.ajax({
 		url:'${contextPath}/bg/project/bgSetPassed',
 		type:'post',
 		dataType:'json',
 		data:data,
 		success:function(data){
			if(data.exceptionCode){
				Box.autoClose(data.exceptionMsg);
			}else{
				location.href="${contextPath}/bg/project/bgpro?currPage="+currPage;
			}
 		},
 		error:function(data){
 			alert(data+'提交失败，请检查网络');
 		}
 	});
 }  */
 </script>
</html>