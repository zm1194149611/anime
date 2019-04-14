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
		<h3>导入数据</h3>
	</div>
	<form id="message-form" class="form-horizontal" action="./import" method="post" enctype="multipart/form-data">
		
	<div class="modal-body">

			<div class="form-group">
				<label class="col-md-4  control-label">提现完成导入</label>
				<div class="col-md-6">
					<input type="file" class="form-control" name="file">
				</div>
			</div>
		    <div>	文件表头为导出文件表头, 状态值需为[申请中,提现成功,提现失败]
		    </div>
			 
		
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal">取消</button>
		<button class="btn btn-primary" type="button" onclick="submit()"
			data-dismiss="modal">上传</button>
	</div>
	</form>

</body>
</html>