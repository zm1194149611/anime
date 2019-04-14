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
	var msg = "${msg}";
	if (msg) {
		alert(msg);
	}
	function goPage(src) {
		location.href = src;
	}

	function exportdata(status) {
		location.href = "export?status="+status;
	}
	function importPage() {
		$("#detailmodal").modal({
			remote : "./importpage"
		});
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
						<div class="label label-default">提现列表</div>
					</h2>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" action="./listPage" method="post">
					<div class="form-group">
						<label class="col-md-2 control-label">提现状态</label>
						<div class="col-sm-3">
							<select class="form-control" name="status">
								<option value="0">申请中</option>
								<option value="1" ${withdraw.status == 1?'selected':'' }>提现成功</option>
								<option value="2" ${withdraw.status == 2?'selected':'' }>提现失败</option>
							</select>
						</div>
						<div class="col-md-3">
							<button class="btn btn-default" type="submit">查询</button>
							<button class="btn btn-default" type="button"
								onclick="exportdata(${withdraw.status})">导出</button>
							<button class="btn btn-default" type="button"
								onclick="importPage()">导入</button>
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
							<th>用户昵称</th>
							<th>账户余额(聊币)</th>
							<th>可提现余额</th>
							<th>提现聊币</th>
							<th>提现金额(￥)</th>
							<th>提现账户类型</th>
							<th>提现账户</th>
							<th>提现状态</th>
							<th>申请时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" varStatus="status" items="${withdraws}">
							<tr>
								<td>${item.user.alias}</td>
								<td>${item.account.chatCoin}</td>
								<td>${item.account.reflectcashCount}</td>
								<td>${item.withdrawalsCount }</td>
								<td>${item.withdrawalsMoney }</td>
								<td>${item.accType == 1?"支付宝":item.accType==2?"银行卡":"账号类型错误"}</td>
								<td>${item.accountId }</td>
								<td>${item.status == 1?"已提现":item.status == 2?"提现失败":"申请中"}</td>
								<td><f:formatDate value="${item.createDate }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><a data-toggle="modal"
									href="income?userId=${item.userId}" data-target="#detailmodal">收入详情</a>

									<a data-toggle="modal" href="history?userId=${item.userId}"
									data-target="#detailmodal">提现历史</a></td>
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