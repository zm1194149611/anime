<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes' />
<title>SYE身份认证</title>
<link href="${contextPath}/css/public.css" rel="stylesheet"
	type="text/css">
<link href="${contextPath}/css/form.css" rel="stylesheet"
	type="text/css">
<!--弹出层JS-->
<script src="${contextPath}/js/box.js"></script>
<!--!end 弹出层JS-->
<script src="${contextPath}/js/form.js"></script>
<script src="${contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		SYEcheck();
	});
	afterCheck = function(data) {
		$.ajax({
			url : '${contextPath}/user/doCertification',
			type : 'post',
			dataType : 'json',
			data : data,
			success : function(data) {
				if (data.exceptionCode) {
					Box.autoClose(data.exceptionMsg);
				} else {
					Box.alert('提交成功，点击确定返回个人中心', function() {
						location.href = "${contextPath}/user/homecenter";
					});
				}
			},
			error : function(data) {
				Box.autoClose('提交失败，请检查网络');
			}
		});
	}
</script>
</head>
<body>
	<article>
		<form action="<%=request.getContextPath()%>/user/doCertification"
			method="post">
			<ul>
				<li><img src="${contextPath}/image/SYE6.jpg"><input
					type="text" id="name" value="${user.userName }" placeholder="真实姓名"></li>
				<li><img class=“img2” src="${contextPath}/image/rank%20(5).png"><input
					type="text" id="firm" value="${user.companyName }"
					placeholder="所属公司"></li>
				<li><img src="${contextPath}/image/SYE1.jpg"><input
					type="text" id="job" value="${user.position }" placeholder="职位"></li>
				<li style="display:none"><img src="${contextPath}/image/SYE2.jpg"><input
					type="text" id="email" value="${user.emailAddress}"
					placeholder="邮箱"></li>
			</ul>
			<div id="role">
				<p class="h">请选择您的角色</p>
				<div class="roleSon">
					<div>
						<img src="${contextPath}/image/SYE3.jpg">
						<p title="0">
							<spring:message code="role.role0" />
						</p>
						<span></span>
					</div>
					<div>
						<img src="${contextPath}/image/SYE4.jpg">
						<p title="1">
							<spring:message code="role.role1" />
						</p>
						<span></span>
					</div>
					<div>
						<img src="${contextPath}/image/SYE5.jpg">
						<p title="2">
							<spring:message code="role.role2" />
						</p>
						<span></span>
					</div>
				</div>
			</div>
			<!--         <input id="submit" type="button" value="认证" /> -->
			<span id=submit>认证</span>
		</form>
	</article>
</body>
</html>