<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE>
<html>
	<head>
		<title>权限修改</title>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/bg/css/permissions.css">
		<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
	</head>
	
	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页
			 <span class="c-gray en">&gt;</span> 管理员管理 
			 <span class="c-gray en">&gt;</span> 权限修改
		</nav> 
		
		<div class="per_con">			
			<c:set value="0" var="roleLevel" scope="request" />
			<c:forEach items="${roleList}" var="role">
				<c:if test="${role.parent == 0 }">
					<div class="per_mod">
						<div class="checkBox_fater">
							<input type="checkbox" class="father" name="id" id="role_${role.id}" value="${role.id}" >
							<span>&nbsp;${role.roleName}</span>
						</div>
						<c:set value="${role.roleLevel}" var="roleLevel" scope="request" />
						<div class="checkBox_son">
						<c:forEach items="${roleList}" var="r">
							<c:if test="${r.parent == roleLevel}">
								<input type="checkbox" class="son" name="id" id="role_${r.id}" value="${r.id}" >
								<span>&nbsp;${r.roleName}</span>
							</c:if>
						</c:forEach>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<div>
				<div class="row cl" onclick="updateAdminRole();">
					<span class="form-label col-4"></span>
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="${contextPath}/bg/js/jquery-1.10.2.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".father").click(function(){
				if($(this).is(":checked")){
					$(this).parents(".per_mod").find(".son").prop("checked", true);
				}else{
					$(this).parents(".per_mod").find(".son").prop("checked", false); 
				}
			});

			$(".son").click(function(){
				if($(this).is(":checked")){
					$(this).parents(".per_mod").find(".father").prop("checked", true);
				}else{
					var _sonAll = $(this).parent().find(".son");
					
					if(_sonAll.is(":checked") == false){
						$(this).parents(".per_mod").find(".father").prop("checked", false);
					} 
				}
			});

			var roles = "${roles}";
			var adminRole = roles.split(",");
			for(var i=0;i<adminRole.length;i++){
				$("#role_"+adminRole[i]).prop("checked", true);
			}
		});
		
		function updateAdminRole(){
			var adminId = "${adminId}";
			var rolesId = "";
			$("input[name='id']:checked").each(function(){ 
				rolesId += $(this).val() + ","; 
			}); 
			rolesId = rolesId.substring(0,rolesId.lastIndexOf(","));
			$.ajax({
				url:"updateAdminRole",
				type:'post',
				data:{
					"adminId":adminId,
					"rolesId":rolesId
				},
				dataType:'json',
				success:function(data, status){
					if(data.exceptionMsg){
						alert(data.exceptionMsg);
					}else{
						alert("权限修改成功"); 
						location.href="${contextPath}/bg/adminManage/adminList";
				 	}
				},
				error:function(result){
					alert('提交失败，请检查网络');
				}
			});
		}
	</script>
</html>