<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function confirm(id, status) {

	}

	function submit() {
		document.getElementById("message-form").submit();

	}
	$("#detailmodal").removeData('bs.modal');
</script>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">x</button>
		<h3>消息详情</h3>
	</div>
	<div class="modal-body">

		<form id="message-form" class="form-horizontal" action="./save"
			method="post">
			<div class="form-group">
				<label class="col-md-4  control-label">配置key</label>
				<div class="col-md-6">
					<input type="text" class="form-control" readonly =true name="configKey"
						value="${config.configKey }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4  control-label">配置值</label>
				<div class="col-md-6">
					<input type="text" class="form-control" name="configValue"
						value="${config.configValue }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4  control-label">配置描述</label>
				<div class="col-md-6">
					<input type="text" class="form-control" name="configDesc"
						value="${config.configDesc }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4  control-label">配置金额</label>
				<div class="col-md-6">
					<input type="text" class="form-control" name="configCharge"
						value="${config.configCharge }">
				</div>
			</div>
			<div style="display: none" class="form-group">
				<label class="col-md-4  control-label">配置类型</label>
				<div class="col-md-6">
					<input type="text" class="form-control" name="configType"
						value="${config.configType }">
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal">取消</button>
		<button class="btn btn-primary" type="button" onclick="submit()"
			data-dismiss="modal">保存</button>
	</div>
</body>
</html>