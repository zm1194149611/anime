<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		
		<title>留言审核</title>
	</head>
	
	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 
			<span class="c-gray en">&gt;</span> 审核
			<span class="c-gray en">&gt;</span> 留言审核
			<span class="pd-20"></span>
			<select class="foo" name="flag" onchange="goToChooce(this.value)">
				<option <c:if test="${flag==''}">selected="selected"</c:if> value="">全部</option>
				<option <c:if test="${flag==0}">selected="selected"</c:if>  value="0">未审核</option>
				<option <c:if test="${flag==1}">selected="selected"</c:if>  value="1">审核通过</option>
				<option <c:if test="${flag==-1}">selected="selected"</c:if>  value="-1">审核未通过</option>
			</select>
		</nav>
		
		<div class="pd-20">	
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover">
					<thead>			
						<tr class="text-c">
							<th width="80">姓名</th>
							<th width="80">昵称</th>
							<th width="80">手机号</th>
							<th width="120">留言内容</th>
							<th width="100">留言时间</th>
							<th width="80">状态</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>		
					<c:forEach items="${msgs}" var="msg" varStatus="status">
						<tr class="text-c">
							<td>${msg.user.userName}</td>				
							<td>${msg.user.nickName}</td>
							<td>${msg.user.telphoneNumber}</td>
							<td>${fn:escapeXml(msg.msg.msg)}</td>
							<td>${msg.time}</td>
							<td class="td-status">
								<span class="label label-success radius">${msg.msg.flag=="1"?"已通过":(msg.msg.flag=="-1"?"已删除":(msg.msg.flag=="0"?"未审核":"未知的状态"))}</span>
							</td>
							<td class="f-14 td-manage">
							<c:if test="${msg.msg.flag!=1&&msg.msg.flag!=-1}">
								<a href="javascript:doCheck('${msg.msg.id}',true);" style="text-decoration:none" class="ml-5" href="messagedetails" title="审核">
									<span class="label label-primary radius" id="b">审核</span>
								</a> 
								<a href="javascript:doCheck('${msg.msg.id}',false);" style="text-decoration:none" class="ml-5" href="messagedetails" title="审核">
									<span class="label label-primary radius" id="b">删除</span>
								</a> 
							</c:if>
							</td>							
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
			<!-- 分页start -->
			<div style="margin-top: 20px;"><span class="foo">共${page.pageCount}页 ${page.pageIndex+1}/${page.pageCount}页</span>
				<c:if test="${page.pageIndex>0 }">
					<a class="foo" href="queryMsgBlockPage?start=0&keySearch=${keySearch}&flag=${flag}">首页</a>
					<a class="foo" href="queryMsgBlockPage?start=${page.pageIndex-1}&keySearch=${keySearch}&flag=${flag}">上一页</a>
				</c:if>
				<c:if test="${page.pageIndex+1<page.pageCount }">				
					<a class="foo" href="queryMsgBlockPage?start=${page.pageIndex+1}&keySearch=${keySearch}&flag=${flag}">下一页</a>
					<a class="foo" href="queryMsgBlockPage?start=${page.pageCount-1}&keySearch=${keySearch}&flag=${flag}">尾页</a>
				</c:if>
				<span class="foo">第
				<select onchange="goToPage(this.value)">
					<c:forEach begin="1" end="${page.pageCount}" varStatus="i">
						<option <c:if test="${page.pageIndex+1==i.count}">selected="selected"</c:if> value="${i.count-1}">${i.count}</option>
					</c:forEach>
				</select>页</span>
			</div>
			<!-- 分页end-->
			
		</div>
	</body>
	
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script>
	<script type="text/javascript">
	function goToChooce(flag){
		window.location.href="queryMsgBlockPage?flag="+flag;
	}
	//审核留言
	function doCheck(id,pass){
		var mflag = pass?'1':'-1';
		var start='${start}';
		$.ajax({
			url:'${contextPath}/bg/manage/doChangeLeftMessageFlag',
			type:'post',
			dataType:'json',
			data:{id:id,flag:mflag},
			async:false,
			success:function(data){
				if(data.exceptionCode){
					layer.msg(data.exceptionMsg,{icon:1,time:2000});
				}else{
					layer.msg('审核成功!',{icon:1,time:2000});
					location.href="${contextPath}/bg/manage/queryMsgBlockPage?start="+start+"&flag=${flag}";
				}
			},
			error:function(data){
				layer.msg('提交失败，请检查网络!',{icon:1,time:2000});
			}
		});
	}
	
	//根据选择的页码 跳转页面
	function goToPage(pageNo){
		location.href="queryMsgBlockPage?start="+pageNo+"&keySearch=${keySearch}&flag=${flag}";
	}
	
	</script> 
</html>