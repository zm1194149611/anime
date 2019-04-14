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
	
	function confirm(id,status,reason)
	{
		  $.ajax({
              url: "../verify/selfVeridentified",
              headers: {
                  "device": "window"
              },

              dataType: "json",
              async: false,
              contentType: "application/json",
              timeout: 8000,
              type: "post",
              data: JSON.stringify({
            	  "id":id,
            	  "verifyStatus":status,
            	  "verifyReason":reason
              }),
              
              success: function (data) {
            	  window.location.reload();
              },
              error: function (data) {

            	  window.location.reload();
              }

          });
	}
	
	function showimg(url){
		window.open(url)
	}
	
	$("#detailmodal").removeData('bs.modal');
	
</script>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">x</button>
		<h3>自拍认证</h3>
	</div>
	<div class="modal-body">
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-4">
					<label for="">昵称</label>
				</div>
				<div class="col-md-8">${userMedia.user.alias }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">秒见号</label>
				</div>
				<div class="col-md-8">${userMedia.user.userNo }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">头像</label>
				</div>
				<div class="col-md-8">
					<img src="${userMedia.user.headImageUrl }" class="img-responsive" style="width:100px;height:100px;" alt="Responsive image">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">性别</label>
				</div>
				<div class="col-md-8">${userMedia.user.sex==1?"男":"女" }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">年龄</label>
				</div>
				<div class="col-md-8">${userMedia.user.age }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">居住地</label>
				</div>
				<div class="col-md-8">${userMedia.user.address }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">手机号</label>
				</div>
				<div class="col-md-8">${userMedia.user.phone }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">生日</label>
				</div>
				<div class="col-md-8">
				<f:formatDate value="${userMedia.user.birthday }"
										pattern="yyyy-MM-dd" />
										</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">自拍认证照片</label>
				</div>
				<div class="col-md-8">
					  <c:forEach var="img"   items="${xc }"   varStatus="status">
					  	<img src="${img.file.url }" onclick="showimg('${img.file.url }')" class="img-responsive" style="float:left;margin-right:3px;margin-bottom:3px;width:100px;height:100px;" alt="Responsive image">
					  </c:forEach>
					
				</div>
			</div>
		</div>
	</div>
	<c:if test="${userMedia.verifyStatus!=1}">
		<div class="modal-footer">
		 审核意见：<input id="reason" type="text" class="form-control" value="${userMedia.verifyReason}" name="alias">
			<button class="btn" data-dismiss="modal">取消</button>
			<button class="btn" onclick = "confirm(${userMedia.id},2,$('#reason').val())" data-dismiss="modal">不合格</button>
			<button class="btn btn-primary" onclick = "confirm(${userMedia.id},1,$('#reason').val())" data-dismiss="modal">通过</button>
		</div>
	</c:if>
</body>
</html>