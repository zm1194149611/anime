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
			<div class="col-xs-12 col-md-12">
				<div class="page-header">
					<h1>MISS YOU 后台管理</h1>
				</div>
			</div>
		</div>
		
		<div class="row">
		    <c:forEach var="item" varStatus="status" items="${funcList}">
		      <c:if test="${item.configValue==1}">
			             <div class="col-xs-4 col-md-4" style="margin-top:10px">
					      <button type="button" class="btn btn-primary btn-lg"
						  onclick="goPage('page/verify/anchorListPage')">主播管理</button>
				         </div>
		      </c:if>
		      <c:if test="${item.configValue==2}" >
			             <div class="col-xs-4 col-md-4">
					         <button type="button" class="btn btn-primary btn-lg"
						       onclick="goPage('page/machinemessage/messageListPage')">消息维护</button>
				        </div>
		      </c:if>
		      <c:if test="${item.configValue==3}">
			        
			             <div class="col-xs-4 col-md-4" style="margin-top:10px">
					      <button type="button" class="btn btn-primary btn-lg"
						     onclick="goPage('page/machinepush/pushListPage')">话术维护</button>
				         </div>
			        
		      </c:if>
		      <c:if test="${item.configValue==4}">
			             <div class="col-xs-4 col-md-4" style="margin-top:10px">
							<button type="button" class="btn btn-primary btn-lg"
								onclick="goPage('page/broadcast/broadcast')">消息推送</button>
						</div>
		      </c:if>
		      <c:if test="${item.configValue==5}">
			             <div class="col-xs-4 col-md-4" style="margin-top:10px">
							<button type="button" class="btn btn-primary btn-lg"
								onclick="goPage('page/config/configPage')">配置信息</button>
						</div>
		      </c:if>
		      <c:if test="${item.configValue==6}">
			             <div class="col-xs-4 col-md-4" style="margin-top:10px">
					         <button type="button" class="btn btn-primary btn-lg"
						        onclick="goPage('page/withdraw/listPage')">主播提现</button>
				         </div>
		      </c:if>
		      <c:if test="${item.configValue==7}">
			             <div class="col-xs-4 col-md-4" style="margin-top:10px">
							<button type="button" class="btn btn-primary btn-lg"
								onclick="goPage('page/recharge/listPage')">充值记录</button>
						</div>
		      </c:if>
		      <c:if test="${item.configValue==8}">
			             <div class="col-xs-4 col-md-4" style="margin-top:10px">
							<button type="button" class="btn btn-primary btn-lg"
								onclick="goPage('page/user/listPage')">用户维护</button>
						</div>
		       </c:if>
		       <c:if test="${item.configValue==9}">
			             <div class="col-xs-4 col-md-4" style="margin-top:10px">
					         <button type="button" class="btn btn-primary btn-lg"
						        onclick="goPage('page/verify/anchorSelfVerListPage')">自拍认证</button>
				         </div>
		       </c:if>
		    </c:forEach>
		</div>
		<!-- <div class="row" style="margin-top:10px">
			<div class="col-xs-4 col-md-4">
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPage('page/verify/anchorListPage')">主播管理</button>
			</div>

			<div class="col-xs-4 col-md-4">
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPage('page/machinemessage/messageListPage')">消息维护</button>
			</div>

			<div class="col-xs-4 col-md-4">
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPage('page/machinepush/pushListPage')">话术维护</button>
			</div>
		</div> -->

		<!-- <div class="row" style="margin-top:10px">

			<div class="col-xs-4 col-md-4">
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPage('page/broadcast/broadcast')">消息推送</button>
			</div>
			<div class="col-xs-4 col-md-4">
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPage('page/config/configPage')">配置信息</button>
			</div>

			<div class="col-xs-4 col-md-4">
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPage('page/withdraw/listPage')">主播提现</button>
			</div>
		</div> -->

		<%-- <div class="row" style="margin-top:10px">
 
			<div class="col-xs-4 col-md-4">
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPage('page/recharge/listPage')">充值记录</button>
			</div>
			
			<div class="col-xs-4 col-md-4">
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPage('page/user/listPage')">用户维护</button>
			</div>
			<c:if test="${userName != null && userName != ''}">
								<div class="col-xs-4 col-md-4">
									${userName}
								</div>
			</c:if>
		</div> --%>
	</div>
</body>
</html>