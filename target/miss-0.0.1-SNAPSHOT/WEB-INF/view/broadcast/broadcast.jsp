<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/miss/node_modules/bootstrap/dist/css/bootstrap.min.css">

<title>Insert title here</title>

<script>
	
</script>

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
						<div class="label label-default">消息广播</div>

						<div class="label label-danger label-sm">
							消息一经发送无法撤回,请谨慎填写</div>
					</h2>
				</ol>
			</div>

		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
			<form id="message-form" class="form-horizontal" action="./broadcast"
				method="post">
				<div class="form-group">
					<label class="col-md-12  control-label">消息内容</label>
					<div class="col-md-12">
						<textarea type="" class="form-control" name="body" rows="4"></textarea>
					</div>
				</div>

				<button class="btn btn-primary" type="submit">发送</button>
			</form>
			</div>
		</div>
	</div>


</body>
</html>