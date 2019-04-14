<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
function goPage(src)
{
	location.href=src;
}

function toppush(userId,status)
{
	  var gourl;
	  if(status == 1 )
	  {
		  gourl = "../verify/topPush?userId=" + userId + "&toppush=" + status;
	  }
	  else
	  {
		  gourl = "../verify/unTopPush?userId=" + userId + "&toppush=" + status;
	  }
	  $.ajax({
          url: gourl,
          headers: {
              "device": "window"
          },

          dataType: "json",
          async: false,
          contentType: "application/json",
          timeout: 8000,
          type: "post",
          success: function (data) {
        	  if(data.body.errmsg != null)
        	  {
                alert(data.body.errmsg);
        	  }
        	  window.location.reload();
          },
          error: function (data) {
        	  window.location.reload();
          }

      });
}

function queryAnchor()
{
	var alias = $("#alias").val();
	alert(alias);

}
	
</script>
</head>
<body>
	<div class="container-fluid">

		<div class="row">
			<div class="col-md-12">
				<ol class="page-header">
					<h2>
						<div class="label label-default" onclick="goPage('/miss/')"><主页</div> 
						<div class="label label-default">主播申请列表</div>
					</h2>
				</ol>
			</div>

		</div>
		
		<div class="row">
		     <form class="form-horizontal" action="./anchorListPage" method="post">
					<div class="form-group" align="left">
					    <label class="col-md-1 control-label">认证状态</label>
					    <div class="col-sm-2">
						    <select class="form-control"  name="identified">
									<option value="">全部</option>
									<option value="0" ${anchor.identified == 0?'selected':'' }>待认证</option>
									<option value="1" ${anchor.identified == 1?'selected':'' }>已认证</option>
									<option value="2" ${anchor.identified == 2?'selected':'' }>认证失败</option>
							</select>
						</div>
						<label class="col-md-1 control-label">主播昵称</label>
						<div class="col-sm-2">
						    <input id="alias" type="text" class="form-control" value="${user.alias}" name="alias">
						</div>
						<label class="col-md-1 control-label">主播手机号</label>
						<div class="col-sm-2">
						    <input id="phone" type="text" class="form-control" value="${user.phone}" name="phone">
						</div>
						<div class="col-md-1">
							<button class="btn btn-default" type="submit">查询</button>
						</div>
					</div>
			</form>
		</div>
		
		<div class="row">

			<div class="col-md-12">

				<table class="table table-striped">

					<thead>
						<tr>
							<th>昵称</th>
							<th>性别</th>
							<th>生日</th>
							<th>申请时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" varStatus="status" items="${anchors}">
							<tr>
								<td>${item.user.alias }</td>
								<td>${item.user.sex==1?"男":"女" }</td>
								<td>${item.birthday }</td>
								<td>${item.applyDate}</td>
								<td>
									<c:if test="${item.identified==0 }">
										<a data-toggle="modal"
										href="detail?anchorId=${item.id}" data-target="#detailmodal">验证</a>
									</c:if>
									
									<c:if test="${item.identified==1}">
										已通过
										<a data-toggle="modal"
										href="detail?anchorId=${item.id}" data-target="#detailmodal">详情</a>
									</c:if>
									<c:if test="${item.identified==2}">
										未通过
										<a data-toggle="modal"
										href="detail?anchorId=${item.id}" data-target="#detailmodal">详情</a>
									</c:if>
									<a data-toggle="modal"
									href="../machineanchorpush/anchorPush?userId=${item.user.id}" data-target="#detailmodal">消息配置</a>
								    <c:if test="${item.topPush==0 || item.topPush==null}">
									    <button class="btn btn-primary" type="button" onclick="toppush(${item.userId},1)" data-dismiss="modal">置顶</button>
									</c:if>
									<c:if test="${item.topPush==1}">
									    <button class="btn btn-primary" type="button" onclick="toppush(${item.userId},0)" data-dismiss="modal">取消置顶</button>
									</c:if>
								</td>
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



</body>
</html>