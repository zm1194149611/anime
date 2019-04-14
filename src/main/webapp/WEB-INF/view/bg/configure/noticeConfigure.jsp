<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
		<title>公告配置</title>
	</head>
	
	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页
			<span class="c-gray en">&gt;</span> 配置管理
			<span class="c-gray en">&gt;</span> 公告配置
		</nav>
		<div class="cl pd-5 bg-1 bk-gray mt-20 pd-20"> 
			<span class="l">
				<a class="btn btn-primary radius" onclick="picture_add('新增公告','incubationpark-addUI')" href="noticeDetails?start=${page.pageIndex}"><i class="Hui-iconfont">&#xe600;</i> 新增公告</a>
			</span> 
		</div>
		
		<div class="pd-20">	
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover">
					<thead>			
						<tr class="text-c">
							<th width="30">公告ID</th>
							<!-- <th width="75">公告位置</th> -->
							<th width="100">公告内容</th>
							<th width="100">公告时间</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>	
					<c:forEach items="${page.list}" var="notice">
						<tr class="text-c">
							<td>${notice.syeNoticeId}</td>
							<%-- <td>${notice.sysNoticeLocal}</td> --%>
							<td>${notice.syeNoticeContent}</td>
							<td><fmt:formatDate value="${notice.syeNoticeTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date" /></td>
							<td>
								<a style="text-decoration:none" class="ml-5" 
									href="noticeDetails?syeNoticeId=${notice.syeNoticeId}&start=${page.pageIndex}" title="修改">
									<span class="label label-success radius" id="b">修改</span>
								</a>
								<a style="text-decoration:none" class="ml-5" 
									href="javascript:del(${notice.syeNoticeId});" title="删除">
									<span class="label label-primary radius" id="b">删除</span>
								</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			<!-- 分页start -->
			<div style="margin-top: 20px;"><span class="foo">共${page.pageCount}页 ${page.pageIndex+1}/${page.pageCount}页</span>
				<c:if test="${page.pageIndex>0 }">
					<a class="foo" href="notice?start=0&keySearch=${keySearch}">首页</a>
					<a class="foo" href="notice?start=${page.pageIndex-1}&keySearch=${keySearch}">上一页</a>
				</c:if>
				<c:if test="${page.pageIndex+1<page.pageCount}">				
					<a class="foo" href="notice?start=${page.pageIndex+1}&keySearch=${keySearch}">下一页</a>
					<a class="foo" href="notice?start=${page.pageCount-1}&keySearch=${keySearch}">尾页</a>
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
		//根据选择的页码 跳转页面
		function goToPage(pageNo){
			document.location.href="notice?start="+pageNo;
		}
		
		//删除
		function del(syeNoticeId){
			layer.confirm('确认要删除吗？该操作不可恢复',function(){
				location.href="delNotice?syeNoticeId="+syeNoticeId+"&start=${page.pageIndex}";
			});
		}
	</script> 
	
</html>