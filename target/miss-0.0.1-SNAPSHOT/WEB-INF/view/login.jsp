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


</head>

<body>
	<div class="container-fluid">
		<div class="row" style="margin-top: 100px">
		
			<div class="col-xs-4 col-md-4 col-md-offset-4 col-xs-offset-4">
				<h1 style=>
								遇见管理系统
							</h1>
				<div class="panel panel-default" style="padding: 20px">
					<form action="./login" method="post">
						<div class="container-fluid">
						
							<c:if test="${error != null && error != ''}">
								<div class="row">
									<div class="alert alert-danger" role="alert">${error}</div>
								</div>
							</c:if>
							<div class="row" style="margin-top: 10px;">

								<div class="form-group">
									<label class="col-md-4  control-label">用户名</label>
									<div class="col-md-6">
										<input type="text" class="form-control" AUTOCOMPLETE="off"
											name="name">
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 10px;">

								<div class="form-group">
									<label class="col-md-4  control-label">密码</label>
									<div class="col-md-6">
										<input type="password" class="form-control" AUTOCOMPLETE="off"
											name="password">
									</div>
								</div>
							</div>

							<div class="row" style="margin-top: 10px;">
								<button type="submit" class="btn btn-default">登陆</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>