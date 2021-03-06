<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
	function confirm(id, status) {
		
	}

	function submit(){
		document.getElementById("message-form").submit();
		
	}
	$("#detailmodal").removeData('bs.modal');
</script>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">x</button>
		<h3>话术详情</h3>
	</div>
	<div class="modal-body">

		<form id="message-form" class="form-horizontal" action="./save" method="post">
			<div class="form-group">
				<label class="col-md-4  control-label">话术名称</label>
				<div class="col-md-6">
					<input type="text" class="form-control" name="name"
						value="${config.name }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4  control-label">推送时间区间</label>
				<div class="col-md-6">
					<select class="form-control" name="pushPeriod">
						<option value="1" ${config.pushPeriod==1?"selected":"" }>上午</option>
						<option value="2" ${config.pushPeriod==2?"selected":"" }>中午</option>
						<option value="3" ${config.pushPeriod==3?"selected":"" }>下午</option>
						<option value="4" ${config.pushPeriod==4?"selected":"" }>晚上</option>
						<option value="5" ${config.pushPeriod==5?"selected":"" }>午夜</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4  control-label">是否公用</label>
				<div class="col-md-6">
					<select class="form-control" name="pub">
						<option value="1" ${config.pub==1?"selected":"" }>是</option>
						<option value="2" ${config.pub==0?"selected":"" }>否</option>
					</select>
				</div>
			</div>
			
			<input type="hidden" name="id" value="${config.id}">
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal">取消</button>
		<button class="btn btn-primary" type="button" onclick="submit()"
			data-dismiss="modal">保存</button>
	</div>
</body>
</html>