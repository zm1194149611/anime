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

	function addpush(pushId) {
		$("#detailmodal").modal("hide");
		$(".modal-backdrop").remove();
		$.ajax({
			url : "../machineanchorpush/addpush?userId=${config.userId}"
					+ "&pushId="+pushId,
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
			remote : "../machineanchorpush/anchorPush?userId=${config.userId}"
		});
	}

	function deletemsg(id) {
		$("#detailmodal").modal("hide");
		$(".modal-backdrop").remove();
		
		$.ajax({
			url : "../machineanchorpush/removepush?id=" + id,
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
			remote : "../machineanchorpush/anchorPush?userId=${config.userId}"
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
				<div class="col-md-6" style="height: 100%">

					<table class="table table-striped" style="height: 100%">

						<thead>
							<tr>
								<th>已选话术</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" varStatus="status" items="${anchorpushes}">
								<tr>
									<td>${item.push.name }  &nbsp; ${item.push.pushPeriod==1?"上午":item.push.pushPeriod==2?"中午":
								item.push.pushPeriod==3?"下午":item.push.pushPeriod==4?"晚上":"午夜" }
								
								<i style="float: right"
										onclick="deletemsg('${item.id}')">删除</i>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>
				<div class="col-md-6">

					<table class="table table-striped" style="height: 100%">

						<thead>
							<tr>
								<th>待选话术</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" varStatus="status" items="${pushes}">
								<tr>
									<td>${item.name } &nbsp; ${item.pushPeriod==1?"上午":item.pushPeriod==2?"中午":
								item.pushPeriod==3?"下午":item.pushPeriod==4?"晚上":"午夜" }<i style="float: right"
										onclick="addpush('${item.id}')">选择</i>
									</td>
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