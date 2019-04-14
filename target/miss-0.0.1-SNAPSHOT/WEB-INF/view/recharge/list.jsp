<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="/miss/node_modules/bootstrap/dist/css/bootstrap.min.css">


<script src="/miss/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/miss/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script>
 
	function goPage(src) {
		location.href = src;
	}
 
</script>
</head>
<body>
	<div class="container-fluid">

		<div class="row">
			<div class="col-md-12">
				<ol class="page-header">
					<h2>
						<div class="label label-default" onclick="goPage('/miss/')">
							<主页
						</div>
						<div class="label label-default">充值列表</div>
					</h2>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>日期</th>
							<th>vip充值流水汇总</th>
							<th>vip充值实充汇总</th>
							<th>聊币充值流水汇总</th>
							<th>聊币充值实充汇总</th>
							<th>实际充值汇总</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" varStatus="status" items="${summary}">
							<tr>
								<td>${item.date}</td>
								<td>${item.vippaysum == null ? 0 : item.vippaysum}</td>
								<td>${item.vipsum == null ? 0 : item.vipsum}</td>
								<td>${item.chatpaysum == null ? 0 : item.chatpaysum}</td>
								<td>${item.chatsum == null ? 0 : item.chatsum}</td>
								<td>${item.paysum == null ? 0 : item.paysum}</td>
								<td>
									<a data-toggle="modal"
									href="detail?date=${item.date}" data-target="#detailmodal">充值详情</a>
							    </td> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<div id="detailmodal" class="modal fade" role="dialog" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<h3></h3>

</body>
</html>