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
	$("#detailmodal").removeData('bs.modal');
</script>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">x</button>
		<h3>收入详情</h3>
	</div>
	<div class="modal-body">

		<div class="container-fluid">


			<div class="row">
				<div class="col-md-12">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>提现额</th>
								<th>时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" varStatus="status" items="${historys}">
								<tr>
									<td>${item.withdrawalsCount }</td>
									<td><f:formatDate value="${item.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
			</div>
		</div>

	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal">取消</button>
	</div>

</body>
</html>