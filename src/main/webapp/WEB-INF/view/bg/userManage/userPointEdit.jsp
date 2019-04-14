<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="../css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/H-ui.admin.css" rel="stylesheet" type="text/css" />
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<link href="../lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
	<title>身份列表</title>
</head>

<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页
	 <span class="c-gray en">&gt;</span> 用户管理 
	 <span class="c-gray en">&gt;</span> 积分修改 
</nav>
<form action="savePoint" id="pointForm" class="form" method="post">
<input type="text" class="input-text" value="${user.id}"  id="id" name="id" datatype="*2-16" style="display:none;"/>
<div class="pd-20">	
	<div class="mt-20">	
		<table class="table table-border table-bordered table-bg table-hover ">
			<thead>			
				<tr class="text-c">
					<th width="15" style="display:none;"><input type="checkbox" name="" value=""></th>									
					<th width="100">当日登陆积分</th>
					<th width="100">当日评论积分</th>
					<th width="100">当日点赞积分</th>
					<th width="100">当日话题发布积分</th>
					<th width="100">当日分享积分</th>					
					<th width="100">总登陆积分</th>
					<th width="100">总评论积分</th>
					<th width="100">总点赞积分</th>					
					<th width="100">总话题发布积分</th>
					<th width="100">总分享积分</th>
				</tr>
			</thead>
			<tbody>		
				<tr class="text-c">
					<td style="display:none;"><input type="checkbox" value="" name=""></td>
					<td> <input type="text" class="input-text" value="${user.dayEnroll}"  id="dayEnroll" name="dayEnroll" /></td>
					<td> <input type="text" class="input-text" value="${user.dayComm}"  id="dayComm" name="dayComm" /></td>
					<td> <input type="text" class="input-text" value="${user.dayVoteUp}"  id="dayVoteUp" name="dayVoteUp" /></td>
					<td> <input type="text" class="input-text" value="${user.dayTopic}"  id="dayTopic" name="dayTopic" /></td>
					<td> <input type="text" class="input-text" value="${user.dayShare}"  id="dayShare" name="dayShare" /></td>
					<td> <input type="text" class="input-text" value="${user.totalEnroll}"  id="totalEnroll" name="totalEnroll" /></td>
					<td> <input type="text" class="input-text" value="${user.totalComm}"  id="totalComm" name="totalComm" /></td>
					<td> <input type="text" class="input-text" value="${user.totalVoteUp}"  id="totalVoteUp" name="totalVoteUp" /></td>
					<td> <input type="text" class="input-text" value="${user.totalTopic}"  id="totalTopic" name="totalTopic" /></td>
					<td> <input type="text" class="input-text" value="${user.totalShare}"  id="totalShare" name="totalShare" /></td>								    									
				</tr>
			</tbody>
		</table>
	</div>	
</div>
<div class="text-r" style="padding:0px 20px 0px 0px">
  <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
</div>
</form>
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="../lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../js/H-ui.js"></script> 
<script type="text/javascript" src="../js/H-ui.admin.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript">
	$(function(){
		$("#pointForm").validate({
			rules:{
				dayEnroll:{
					required:true,
					number:true
				},
				dayComm:{
					required:true,
					number:true
				},
				dayVoteUp:{
					required:true,
					number:true
				},
				dayTopic:{
					required:true,
					number:true
				},
				dayShare:{
					required:true,
					number:true
				},
				totalEnroll:{
					required:true,
					number:true
				},
				totalComm:{
					required:true,
					number:true
				},
				totalVoteUp:{
					required:true,
					number:true
				},
				totalTopic:{
					required:true,
					number:true
				},
				totalShare:{
					required:true,
					number:true
				}
			},
			messages:{
				dayEnroll:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				dayComm:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				dayVoteUp:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				dayTopic:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				dayShare:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				totalEnroll:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				totalComm:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				totalVoteUp:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				totalTopic:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				},
				totalShare:{
					required:"&nbsp;&nbsp;",
					number:"&nbsp;&nbsp;请输入数字"
				}
			}
		})
	})
</script> 
</body>
</html>