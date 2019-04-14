<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
						<div class="label label-default">用户列表</div>
					</h2>
				</ol>
			</div>

		</div>
		<div class="row">

			<div class="col-md-12">

				<table class="table table-striped">

					<thead>
						<tr>
							<th>昵称</th>
							<th>性别</th>
							<th>生日</th>
							<th>是否主播</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" varStatus="status" items="${users}">
							<tr>
								<td>${item.alias }</td>
								<td>${item.sex==1?"男":"女" }</td>
								<td>${item.birthday }</td>
								<td>${item.isAnchor==1?"主播":"用户" }</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>

		<ul class="pager">
			<li><a href="listPage?page=${pager.current>1?(pager.current-1):1 }">上一页</a></li>
			<li><a href="listPage?page=${usercount!=pager.size?(pager.current):(pager.current+1) }">下一页</a></li>
		</ul>
		</nav>
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