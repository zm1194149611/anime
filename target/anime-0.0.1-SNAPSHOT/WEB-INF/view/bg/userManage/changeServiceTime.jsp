<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
		<title>服务时长修改</title>
	</head>
	
	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页
			 <span class="c-gray en">&gt;</span> 用户管理 
			 <span class="c-gray en">&gt;</span> 服务时长修改 
		</nav>
		
		<form action="saveServiceTime" id="pointForm" class="form" method="post">
			<div class="row cl">
				<span class="form-label col-3" style="text-align:right;">服务时长：&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<div class="formControls col-9">
					<input type="text" class="input-text" style="width:250px;" value="${user.lengthOfService }" id="serviceTime" name="serviceTime">
				</div>
				<input type="hidden" name="userId" value="${user.id}" />
			</div>
			
			<div class="row cl">
				<span class="form-label col-5"></span>
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</form>
		<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
		<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
		<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
		<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
		<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
		<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script>
		<script type="text/javascript" src="${contextPath}/bg/js/jquery.validate.js"></script>
		<script type="text/javascript">
			$(function(){
				var role="${user.role}";
				$("#role").find("option[value='${user.role}']").attr("selected",true);
			});
		</script> 
	</body>
</html>