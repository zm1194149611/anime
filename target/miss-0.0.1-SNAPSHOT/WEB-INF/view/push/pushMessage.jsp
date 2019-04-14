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
	function submit() {
		document.getElementById("message-form").submit();

	}
	$("#detailmodal").removeData('bs.modal');

	function addmsg(messageId) {
		$("#detailmodal").modal("hide");
		$(".modal-backdrop").remove();
		$.ajax({
			url : "../machinepushmsg/addmsg?messageId=" + messageId
					+ "&pushId=${push.id}",
			headers : {
				"device" : "window"
			},

			dataType : "json",
			async : false,
			contentType : "application/text",
			timeout : 8000,
			type : "get",
			success : function(data) {

			},
			error : function(data) {

			}

		});
		$("#detailmodal").removeData('bs.modal');
		$("#detailmodal").modal({
			remote : "../machinepushmsg/message?id=${push.id}"
		});
	}

	function deletemsg(id) {
		$("#detailmodal").modal("hide");
		$(".modal-backdrop").remove();
		
		$.ajax({
			url : "../machinepushmsg/removemsg?id=" + id,
			headers : {
				"device" : "window"
			},

			dataType : "json",
			async : false,
			contentType : "application/text",
			timeout : 8000,
			type : "get",

			success : function(data) {
			},
			error : function(data) {

			}

		});
		$("#detailmodal").removeData('bs.modal');
		$("#detailmodal").modal({
			remote : "../machinepushmsg/message?id=${push.id}"
		});
	}
</script>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">x</button>
		<h3>话术详情</h3>
	</div>
	<div class="modal-body">
		<div class="container-fluid">

			<div class="row" style="min-height: 400px;">
				<div class="col-md-8" style="height: 100%">

					<table class="table table-striped" style="height: 100%;width:500px">

						<thead>
							<tr>
								<th>已选话术</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" varStatus="status" items="${pushMsgs}">
								<tr>
									<td>${item.message.messageText }<i style="float: right"
										onclick="deletemsg('${item.id}')">删除</i>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>
				<div class="col-md-8">

					<table class="table table-striped" style="height: 100%;width:500px">

						<thead>
							<tr>
								<th>待选话术</th><th>话术类型</th><th>延迟秒数</th><th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" varStatus="status" items="${messages}">
								<tr>
									<td>${item.messageText }
									</td>
									<td>${item.msgType==0?"文本":item.msgType==1?"图片":item.msgType==2?"语音":"自定义"}</td>
									<td>${item.delaySecond}</td>
									<td><i style="float: right"
										onclick="addmsg('${item.id}')">选择</i></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>

			</div>
		</div>

	</div>
	<div class="modal-footer"></div>
</body>
</html>