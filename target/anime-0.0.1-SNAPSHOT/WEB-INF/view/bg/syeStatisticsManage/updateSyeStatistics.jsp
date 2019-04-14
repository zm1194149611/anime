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
		<title>数据修改</title>
	</head>
	
	<body>	
		<form action="doUpdateSyeStatistics" id="pointForm" class="form" name="form" method="post">
			<div>
				<table class="table table-border table-bordered table-bg table-hover">
					<thead>
						<tr class="text-c">
							<th width="15" style="display: none;">
								<input type="checkbox" name="" value="">
							</th>
							<th width="100">区域</th>
							<th width="100">扶持青年数</th>
							<th width="100">导师志愿者数</th>
							<th width="100">导师服务时长</th>
							<th width="100">扶持基金总额</th>
							<th width="100">扶持项目数</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-c">
							<td width="150">
								<span id="area">${syeStatistics.area}</span>
							</td>
							<td>
								<input type="text" class="input-text" value="${syeStatistics.youthCount}" name="youthCount" />
							</td>
							<td>
								<input type="text" class="input-text" value="${syeStatistics.tutorCount}" name="tutorCount" />
							</td>
							<td>
								<input type="text" class="input-text" value="${syeStatistics.tutorTime}" name="tutorTime" />
							</td>
							<td>
								<input type="text" class="input-text" value="${syeStatistics.money}" name="money" />
							</td>
							<td>
								<input type="text" class="input-text" value="${syeStatistics.projectCount}" name="projectCount" />
							</td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" value="${syeStatistics.statisticsId}" name="statisticsId" />
			</div>
			<br>
			<div class="text-r" style="padding: 0px 20px 0px 0px">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</form>
	</body>
		
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/js/jquery.validate.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#pointForm").validate({
			rules:{
				youthCount:{
					required:true,
					number:true
				},
				tutorCount:{
					required:true,
					number:true
				},
				tutorTime:{
					required:true,
					number:true
				},
				money:{
					required:true,
					number:true
				},
				projectCount:{
					required:true,
					number:true
				}
			},
			messages:{
				youthCount:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				tutorCount:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				tutorTime:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				money:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				projectCount:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				}
			}
		})
	})
	</script> 
</html>