<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<title>数据统计列表</title>
	</head>
	
	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i>首页
			<span class="c-gray en">&gt;</span>数据统计 
			<span class="c-gray en">&gt;</span> 数据列表 
			<span class="pd-20"></span>
		</nav>
		
		<div class="pd-20">
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover">
					<thead>
						<tr class="text-c">
							<th width="30">编号</th>
							<th width="100">区域</th>
							<th width="100">扶持青年数</th>
							<th width="100">导师志愿者数</th>
							<th width="100">导师服务时长</th>
							<th width="100">扶持基金总额</th>
							<th width="100">扶持项目数</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" varStatus="s" var="syeStatistics">
							<tr class="text-c">
								<td>${syeStatistics.statisticsId}</td>
								<td>${syeStatistics.area}</td>
								<td>${syeStatistics.youthCount}</td>
								<td>${syeStatistics.tutorCount}</td>
								<td>${syeStatistics.tutorTime}</td>
								<td>${syeStatistics.money}</td>
								<td>${syeStatistics.projectCount}</td>
								<td>
									<a style="text-decoration: none" class="ml-5" title="数据修改" onclick="updateSyeStatistics('数据修改',${syeStatistics.statisticsId})"> 
										<span class="label label-primary radius" id="b">修改</span>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	
				<!-- 分页start -->
				<div style="margin-top: 20px;"><span class="foo">共${page.pageCount}页 ${page.pageIndex+1}/${page.pageCount}页</span>
					<c:if test="${page.pageIndex>0 }">
						<a class="foo" href="syeStatisticsList?start=0&keySearch=${keySearch}">首页</a>
						<a class="foo" href="syeStatisticsList?start=${page.pageIndex-1}&keySearch=${keySearch}">上一页</a>
					</c:if>
					<c:if test="${page.pageIndex+1<page.pageCount }">				
						<a class="foo" href="syeStatisticsList?start=${page.pageIndex+1}&keySearch=${keySearch}">下一页</a>
						<a class="foo" href="syeStatisticsList?start=${page.pageCount-1}&keySearch=${keySearch}">尾页</a>
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
		</div>
	</body>
	
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script>
	<script type="text/javascript">
	
		/*动态选择分页页面*/
		function goToPage(pageNo) {
			document.location.href = "syeStatisticsList?start="+pageNo+"&size=${page.pageSize}&keySearch=${keySearch}";
		}	
		
		/* 进行修改操作   */
		function updateSyeStatistics(title,statisticsId) {
			var url = "updateSyeStatistics?statisticsId="+statisticsId;
			var index = layer.open({
				type: 2,
				title: title,
				content: url
			});
			layer.full(index);		
		}
	</script>
</html>