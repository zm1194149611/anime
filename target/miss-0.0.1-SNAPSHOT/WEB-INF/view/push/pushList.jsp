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
	
	
	$("#detailmodal").on("hidden.bs.modal", function() { 
		$(this).removeData("bs.modal"); 
		}); 
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
						<div class="label label-default">话术列表</div>
					</h2>
				</ol>
			</div>

		</div>

		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" action="./pushListPage"
					method="post">
					<div class="form-group">
						<label class="col-md-2 control-label">推送时间区间</label>
						<div class="col-sm-3">
							<select class="form-control" name="pushPeriod">
								<option value="">全部</option>
								<option value="1">上午</option>
								<option value="2">中午</option>
								<option value="3">下午</option>
								<option value="4">晚上</option>
								<option value="5">午夜</option>
							</select>
						</div>
						<div class="col-md-3">
							<button class="btn btn-default" type="submit">查询</button>
							<a href="detail" data-toggle="modal" data-target="#detailmodal" class="btn btn-danger" type="button">增加</a>
						</div>
					</div>


				</form>

			</div>

		</div>
		<div class="row">

			<div class="col-md-12">

				<table class="table table-striped">

					<thead>
						<tr>
							<th>话术名称</th>
							<th>推送时间区间</th>
							<th>是否公用话术</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" varStatus="status" items="${pushes}">
							<tr>
								<td>${item.name }</td>
								<td>${item.pushPeriod==1?"上午":item.pushPeriod==2?"中午":
								item.pushPeriod==3?"下午":item.pushPeriod==4?"晚上":"午夜" }</td>
								<td>${item.pub == 1?"是":"否"}</td>
								<td><a data-toggle="modal"
									href="detail?id=${item.id}" data-target="#detailmodal">编辑</a>
									
									<a data-toggle="modal"
									href="../machinepushmsg/message?id=${item.id}" data-target="#detailmodal">消息配置</a>
									<a 
									href="delete?id=${item.id}" >删除</a></td>
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