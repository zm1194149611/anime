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
						<div class="label label-default">配置信息</div>
					</h2>
				</ol>
			</div>

		</div>

		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" action="./configPage"
					method="post">
					<div class="form-group">
						<label class="col-md-2 control-label">配置类型</label>
						<div class="col-sm-3">
							<select class="form-control" name="configType">
								<option value="0">其他配置</option>
								<option value="1" ${config.configType == 1?'selected':'' }>礼物价格配置列表</option>
								<option value="2" ${config.configType == 2?'selected':'' }>VIP充值配置列表</option>
								<option value="3" ${config.configType == 3?'selected':'' }>聊币充值配置列表</option>
								<option value="4" ${config.configType == 4?'selected':'' }>广场导航栏url链接获取</option>
								<option value="5" ${config.configType == 5?'selected':'' }>主播自定义聊天价格表</option>
								<option value="6" ${config.configType == 6?'selected':'' }>男性标签列表</option>
								<option value="7" ${config.configType == 7?'selected':'' }>女性标签列表</option>
							</select>
						</div>
						<div class="col-md-3">
							<button class="btn btn-default" type="submit">查询</button>
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
							<th>配置key</th>
							<th>配置值</th>
							<th>配置描述</th>
							<th>配置金额</th> 
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" varStatus="status" items="${configs}">
							<tr>
								<td>${item.configKey }</td>
								<td>${item.configValue }</td>
								<td>${item.configDesc }</td>
								<td>${item.configCharge }</td>
								<td><a data-toggle="modal"
									href="detail?configKey=${item.configKey}" data-target="#detailmodal">编辑</a>
									</td>
								<td></td>
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