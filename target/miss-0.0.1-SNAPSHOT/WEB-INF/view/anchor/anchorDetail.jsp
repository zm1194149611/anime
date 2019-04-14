<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>自拍详情</title>

<script>
	
	function confirm(id,status,reason)
	{
		  $.ajax({
              url: "../../anchor/identified",
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
            	  "identified":status,
            	  "reason":reason
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
		<h3>主播详情</h3>
	</div>
	<div class="modal-body">
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-4">
					<label for="">昵称</label>
				</div>
				<div class="col-md-8">${anchor.user.alias }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">用户名</label>
				</div>
				<div class="col-md-8">${anchor.user.userName }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">头像</label>
				</div>
				<div class="col-md-8">
					<img src="${anchor.user.headImageUrl }" class="img-responsive" style="width:100px;height:100px;" alt="Responsive image">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">性别</label>
				</div>
				<div class="col-md-8">${anchor.user.sex==1?"男":"女" }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">年龄</label>
				</div>
				<div class="col-md-8">${anchor.user.age }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">职业</label>
				</div>
				<div class="col-md-8">${anchor.user.profession }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">爱好</label>
				</div>
				<div class="col-md-8">${anchor.user.hobby }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">手机号</label>
				</div>
				<div class="col-md-8">${anchor.user.phone }</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">生日</label>
				</div>
				<div class="col-md-8">
				<f:formatDate value="${anchor.user.birthday }"
										pattern="yyyy-MM-dd" />
										</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">身高</label>
				</div>
				<div class="col-md-8">${anchor.user.stature } cm</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">体重</label>
				</div>
				<div class="col-md-8">${anchor.user.weight } kg</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">相册</label>
				</div>
				<div class="col-md-8">
					  <c:forEach var="img"   items="${xc }"   varStatus="status">
					  	<img src="${img.file.url }" onclick="showimg('${img.file.url }')" class="img-responsive" style="float:left;margin-right:3px;margin-bottom:3px;width:100px;height:100px;" alt="Responsive image">
					  </c:forEach>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="">视频</label>
				</div>
				<div class="col-md-8">
					  <c:forEach var="vdo"   items="${sp }"   varStatus="status">
						<img src="${vdo.file.url }" onclick="showimg('${vdo.vediourl }')"  class="img-responsive" style="float:left;margin-right:3px;margin-bottom:3px;width:100px;height:100px;" alt="Responsive image">
					  </c:forEach>
			    </div>
			</div>
		</div>
	</div>
	<c:if test="${anchor.identified!=1}">
		<div class="modal-footer">
		     审核意见：<input id="reason" type="text" class="form-control" value="${anchor.reason}" name="alias">
			<button class="btn" data-dismiss="modal">取消</button>
			<button class="btn" onclick = "confirm(${anchor.id},2,$('#reason').val())" data-dismiss="modal">不合格</button>
			<button class="btn btn-primary" onclick = "confirm(${anchor.id},1,$('#reason').val())" data-dismiss="modal">通过</button>
		</div>
	</c:if>
</body>
</html>