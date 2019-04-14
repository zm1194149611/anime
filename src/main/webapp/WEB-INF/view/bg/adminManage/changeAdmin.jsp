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
		<style type="text/css">
			.row{
				margin:15px;
			}		
		</style>
		<title>管理员添加</title>
	</head>
	
	<body>
		 <nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页
			 <span class="c-gray en">&gt;</span> 管理员管理 
			 <span class="c-gray en">&gt;</span> 管理员添加
		</nav> 
		
		<div class="row cl">
			<span class="form-label col-2" style="text-align:right;">姓名：</span>
			<input type="text" class="input-text" name="name" value="${admin.name}" style="width:260px;" maxlength="10" />
		</div>
		<div class="row cl">
			<span class="form-label col-2" style="text-align:right;">电话号码：</span>
			<input type="text" class="input-text" name="telephone" value="${admin.telephone}" style="width:260px;" maxlength="11" />
		</div>
		<div class="row cl">
			<span class="form-label col-2" style="text-align:right;">账号：</span>
			<input type="text" class="input-text" name="loginName" value="${admin.loginName}" style="width:260px;" maxlength="20" />
			<span style="margin-left:5px;color:red;" id="name"></span>
		</div>
		<div class="row cl">
			<span class="form-label col-2" style="text-align:right;">密码：</span>
			<input type="text" class="input-text" name="loginPsw" value="" style="width:260px;" maxlength="26" />
			<input type="hidden" name="id" value="${admin.id}" />
			<!-- <span>111111<input type="hidden" name="loginPsw" value="${admin.loginPsw}" /></span> -->
		</div>
		
		<div class="row cl" onclick="updateAdmin();">
			<span class="form-label col-4"></span>
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</body>
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/js/jquery.validate.js"></script>
	<script type="text/javascript">
		function updateAdmin(){
			var name = $("input[name='name']").val();
			var telephone = $("input[name='telephone']").val();
			var loginName = $("input[name='loginName']").val();
			var loginPsw = $("input[name='loginPsw']").val();
			var id = $("input[name='id']").val();
			if(name==""){
				alert("请填写姓名");
				return;
			}else if(telephone==""){
				alert("请填写电话");
				return;
			}else if(loginName==""){
				alert("请填写登录账号");
				return;
			}
			$.ajax({
				url:"updateAdmin",
				type:'post',
				data:{
					"name":name,
					"telephone":telephone,
					"loginName":loginName,
					"loginPsw":loginPsw,
					"id":id
				},
				dataType:'json',
				success:function(data, status){
					if(data.exceptionMsg){
						alert(data.exceptionMsg);
					}else{
						if(data.result){
							alert("修改管理员成功"); 
							location.href="${contextPath}/bg/adminManage/adminList";
						}else{
							$("#name").text("登录账号已存在，请重新设置");
							$("input[name='loginName']").val("");
						}
				 	}
				},
				error:function(result){
					alert('提交失败，请检查网络');
				}
			});
		}
		$(function(){
			$("input[name='loginName']").focus(function(){
				$("#name").text("");
			});
		});
	</script> 
</html>