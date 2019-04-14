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
		<title>修改密码</title>
	</head>
	
	<body>
		 <nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页
			 <span class="c-gray en">&gt;</span> 修改密码
		</nav> 
		
		<!-- <div class="row cl">
			<span class="form-label col-2" style="text-align:right;">原密码：</span>
			<input type="text" class="input-text" name="oldPsw" style="width:260px;" maxlength="30" />
			<span style="margin-left:5px;color:red;" id="oldPsw"></span>
		</div> -->
		<div class="row cl">
			<span class="form-label col-2" style="text-align:right;">新密码：</span>
			<input type="text" class="input-text" name="newPsw" style="width:260px;" maxlength="30" />
			<span style="margin-left:5px;color:red;" id="newPsw"></span>
		</div>
		<div class="row cl">
			<span class="form-label col-2" style="text-align:right;">确认新密码：</span>
			<input type="text" class="input-text" name="confirmPsw" style="width:260px;" maxlength="30" />
			<span style="margin-left:5px;color:red;" id="confirmPsw"></span>
		</div>
		<div class="row cl" onclick="changeAdminPsw();">
			<span class="form-label col-4"></span>
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;确定&nbsp;&nbsp;">
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
		function changeAdminPsw(){
			/* var oldPsw = $("input[name='oldPsw']").val(); */
			var newPsw = $("input[name='newPsw']").val();
			var confirmPsw = $("input[name='confirmPsw']").val();
			var id = "${id}";
			if(newPsw==""||confirmPsw==""){
				alert("请填写所有信息");
				return;
			}else if(confirmPsw != newPsw){
				$("#confirmPsw").text("两次输入密码不一致");
				return;
			}
			/* else{	
				$.ajax({
					url:"selectIsAdminPsw",
					type:'post',
					data:{
						"id":id,
						"oldPsw":oldPsw
					},
					dataType:'json',
					success:function(data, status){
						if(data.exceptionMsg){
							alert(data.exceptionMsg);
						}else{
							if(data.result){
								$("#oldPsw").text("原密码输入不正确");
								return;
							}
					 	}
					},
					error:function(result){
						alert('提交失败，请检查网络');
					}
				});
			} */
			$.ajax({
				url:"updateAdminPsw",
				type:'post',
				data:{
					"id":id,
					"newPsw":newPsw
				},
				dataType:'json',
				success:function(data, status){
					if(data.exceptionMsg){
						alert(data.exceptionMsg);
					}else{
						if(data.result){
							alert("修改密码成功，请重新登录"); 
							location.href="${contextPath}/pub/bgLogin";
						}
				 	}
				},
				error:function(result){
					alert('提交失败，请检查网络');
				}
			});
		}
		$(function(){
			$("input[name='confirmPsw']").focus(function(){
				$("#confirmPsw").text("");
			});
			/* $("input[name='confirmPsw']").blur(function(){
				var newPsw = $("input[name='newPsw']").val();
				var confirmPsw = $("input[name='confirmPsw']").val();
			}); */
		});
	</script> 
</html>