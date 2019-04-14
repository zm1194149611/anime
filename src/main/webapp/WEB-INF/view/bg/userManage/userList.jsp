<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
	<title>用户列表</title>
</head>

<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页
	 <span class="c-gray en">&gt;</span> 用户管理 
	 <span class="c-gray en">&gt;</span> 用户列表 
	<span class="pd-20"></span>
	身份:
	<select class="foo" name="role" id="role"  onchange="goToRole(this.value)">
		<option value="">全部</option>
		<c:forEach var="i" begin="0" end="6" step="1">
			<option value="${i}"><spring:message code="role.role${i}" /></option>
        </c:forEach>
			<option value="100">项目官员</option>
	</select>
	<span class="pd-20"></span>
	区域:
	<select class="foo" name="zone" id="zone" onchange="goToZone(this.value)">
		<option value="">全部</option>
		<c:forEach var="i" begin="1" end="21" step="1"> 
			<option value="${i}"><spring:message code="project.zone.zone${i}" /></option>
    	</c:forEach>
	</select>
	<span class="pd-20"></span>
	认证状态:
	<select class="foo" name="status" id="status" onchange="goToStatus(this.value)">
		<option>全部</option>
		<option value="1">已认证</option>
		<option value="0">未认证</option>
	</select>
	<span class="pd-20"></span>
	<span class="r">
		<input type="text" name="keySearch" id="keySearch" value="${keySearch}" placeholder=" 输入姓名、手机号、昵称等" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" onclick="goToChooce();"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</span>
</nav>
<div class="pd-20">
   <!-- <div class="text-l"> 
		<form action="userList" method="post">
			<input type="text" name="keySearch" id="keySearch" placeholder=" 输入姓名、手机号、昵称等" style="width:250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div> -->
	<div>
		<div class="l"> 
			<!-- <span class="btn-upload form-group">
		        <input class="input-text upload-url" type="hidden" style="width:250px" name="uploadFileUrl" id="uploadFileUrl" readonly nullmsg="请添加附件！">
		        <a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i>选择文件</a>
		        <input type="file" multiple name="file-2" class="input-file" style="z-index: 0;">
		        <a class="btn btn-primary " onclick="uploadUser()" href="javascript:;">导入用户</a>			    									
	        </span> -->
			<form id="FileForm" method="post" enctype ="multipart/form-data">
				<span class="btn-upload form-group">
					<input type="file" name="uploadFileUrl" id="uploadFileUrl" />
			        <a class="btn btn-primary" href="javascript:uploadUser();">导入用户</a>			    									
		        </span>
		     </form>
	    </div>
	    <!-- <div style="float:right;" > 
	    	<span class="l">
	   	 		<a class="btn btn-primary radius" href="javascript:void(0);" onclick="projectOfficer()">
	    			<i class="Hui-iconfont"></i> 设置项目官员
	   	 		</a>
	    	</span>
	    </div>	 -->
	    <div class="text-r"> 
	   		<a class="btn btn-primary radius" href="exportUser?start=${page.pageIndex}&size=${page.pageSize }">
	   			<i class="Hui-iconfont"></i> 批量导出
	   		</a>
	    </div>	
    </div>
    
	<div class="mt-20">	
		<table class="table table-border table-bordered table-bg table-hover " onclick="javascript:GoSel(event);">
			<thead>			
				<tr class="text-c">
					<th width="30">编号</th>					
					<th width="100">身份</th>
					<th width="80">姓名</th>
					<th width="120">手机号</th>
					<th width="80">昵称</th>					
					<th width="60">区域</th>
					<th width="60">认证状态</th>
					<th width="120">注册时间</th>		
					<th width="120">服务时长</th>				
					<!-- <th width="120">近一次登录</th> -->
					<th width="220">操作</th>
					<th style="display:none"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" varStatus="s"  var="user">			
				<tr class="text-c">
					<td>${s.index+1}</td>	
					<c:if test="${user.role==0}">
					 <td class="identity_role">创业者</td>
				    </c:if>
				    <c:if test="${user.role==1}">
					 <td class="identity_role">导师</td>
				    </c:if>
				    <c:if test="${user.role==2}">
					 <td class="identity_role">游客</td>
				    </c:if>
				    <c:if test="${user.role==3}">
					 <td class="identity_role">非sye认证创业者</td>
				    </c:if>
				    <c:if test="${user.role==4}">
					 <td class="identity_role">非sye认证导师</td>
				    </c:if>
				    <c:if test="${user.role==5}">
					 <td class="identity_role">待认证导师</td>
				    </c:if>
				    <c:if test="${user.role==6}">
					 <td class="identity_role">待认证创业者</td>
				    </c:if>	
				     <c:if test="${user.role==100}">
					 <td class="identity_role">项目官员</td>
				    </c:if>				
					<td>${user.userName}</td>	
					<td>${user.telphoneNumber}</td>		    
					<td>${user.nickName}</td>
				    <td><spring:message code="project.zone.zone${user.zone}" /></td>
				    <td>
				    	<c:if test="${user.role==2}"></c:if>
				    	<c:if test="${user.role==5 || user.role==6}">
				    		未认证
				    	</c:if>
				    	<c:if test="${user.role!=5 && user.role!=6}">
				    		已认证
				    	</c:if>
				    </td>	
				    <td>
				    	<fmt:formatDate value="${user.addTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date" />
				    </td>
				    <td>${user.lengthOfService}</td>
				    <%-- <td>${user.zone}</td> --%>
				    <td style="text-align:left;">
				    	<a class="btn btn-primary radius" onclick="queryPoint('积分修改','queryPoint?userId=${user.id}')">
				    		<i class="Hui-iconfont"></i> 积分修改
				    	</a>
				    	&nbsp;&nbsp;
				    	<a class="btn btn-primary radius" onclick="changeStatus('身份修改','changeStatus?userId=${user.id}')">
				    		<i class="Hui-iconfont"></i> 身份修改
				    	</a>
				    	&nbsp;&nbsp;&nbsp;&nbsp;
				    	<a class="btn btn-primary radius" onclick="changeServiceTime('服务时长修改','changeServiceTime?userId=${user.id}')" style="margin-top:5px;">
				    		<i class="Hui-iconfont"></i> 服务时长修改
				    	</a>
				    	<c:if test="${user.role==1}">
				    	&nbsp;&nbsp;&nbsp;&nbsp;
				    	<a class="btn btn-primary radius" href="javascript:void(0);" onclick="projectOfficer('${user.id}',0)" style="margin-top:5px;">
			    			<i class="Hui-iconfont"></i> 设置项目官员
			   	 		</a>
			   	 		</c:if>
			   	 		<c:if test="${user.role==100}">
			   	 		&nbsp;&nbsp;&nbsp;&nbsp;
				    	<a class="btn btn-primary radius" href="javascript:void(0);" onclick="projectOfficer('${user.id}',1)" style="margin-top:5px;">
			    			<i class="Hui-iconfont"></i> 取消项目官员
			   	 		</a>
			   	 		</c:if>
				    </td>				    									
				    <td style="display:none">${user.id}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 分页实现 -->
		<div style="margin-top: 20px;"><span class="foo">共${page.pageCount}页 ${page.pageIndex+1}/${page.pageCount}页</span>
			<c:if test="${page.pageIndex>0 }">
				<a class="foo" href="userList?start=0&size=${page.pageSize }&role=${role}&zone=${zone}&status=${status}&keySearch=${keySearch}">首页</a>
				<a class="foo" href="userList?start=${page.pageIndex-1 }&size=${page.pageSize }&role=${role}&zone=${zone}&status=${status}&keySearch=${keySearch}">上一页</a>
			</c:if>
			<c:if test="${page.pageIndex+1<page.pageCount }">				
				<a class="foo" href="userList?start=${page.pageIndex+1 }&size=${page.pageSize }&role=${role}&zone=${zone}&status=${status}&keySearch=${keySearch}">下一页</a>
				<a class="foo" href="userList?start=${page.pageCount-1 }&size=${page.pageSize }&role=${role}&zone=${zone}&status=${status}&keySearch=${keySearch}">尾页</a>
			</c:if>
			<span class="foo">第
			<select onchange="goToPage(this.value)">
				<c:forEach begin="1" end="${page.pageCount}" varStatus="i">
					<option <c:if test="${page.pageIndex+1==i.count}">selected="selected"</c:if> value="${i.count-1}">${i.count}</option>
				</c:forEach>
			</select>页</span>
		</div>
	</div>
</div>
<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script>
<!-- 以下为图片上传的JS -->
<script src="${contextPath}/js/jquery-form.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#role").find("option[value='${role}']").attr("selected",true);
		$("#zone").find("option[value='${zone}']").attr("selected",true);
		$("#status").find("option[value='${status}']").attr("selected",true);
	});
	/*动态选择分页页面*/
	function goToPage(pageNo){
		document.location.href="userList?start="+pageNo+"&size=${page.pageSize}&role=${role}&zone=${zone}&keySearch=${keySearch}";
	}
	/*筛选--身份*/
	function goToRole(role){
		document.location.href="userList?role="+role+"&zone=${zone}&status=${status}&keySearch=${keySearch}";
	}
	/*筛选--区域*/
	function goToZone(zone){
		document.location.href="userList?role=${role}&zone="+zone+"&status=${status}&keySearch=${keySearch}";
	}
	/*筛选--认证状态*/
	function goToStatus(status){
		document.location.href="userList?role=${role}&zone=${zone}&status="+status+"&keySearch=${keySearch}";
	} 
	/*筛选--姓名、手机号、昵称*/
	function goToChooce(){
		var keySearch=$("#keySearch").val();
		if(keySearch.trim()!=""){
			document.location.href="userList?role=${role}&zone=${zone}&status=${status}&keySearch="+keySearch;
		}
	}
	
	function identity_role(userId){	
		window.location.href="userDetailForCheck?userId="+userId;
	}
	function article_edit(title,url,id,w,h){
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
	/*身份-删除*/
	function article_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			$(obj).parents("tr").remove();
			layer.msg('已删除!',1);
		});
	}
	/*身份-审核*/
	function article_shenhe(obj,id){
		var ok = $(obj).parents("tr").find(".td-status");
		layer.confirm('审核文章？', {
			btn: ['通过','不通过'], 
			shade: false
		},
		function(){
			// $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
			$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已审核</span>');
			$(obj).remove();
			layer.msg('已审核', {icon:6,time:1000});
		},
		function(){
			// $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
			$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
			$(obj).remove();
	    	layer.msg('未通过', {icon:5,time:1000});
		});	
	}
	/*身份-下架*/
	function article_stop(obj,id){
		layer.confirm('确认要下架吗？',function(index){
			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
			$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
			$(obj).remove();
			layer.msg('已下架!',{icon: 5,time:1000});
		});
	}
	
	/*身份-发布*/
	function article_start(obj,id){
		layer.confirm('确认要发布吗？',function(index){
			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
			$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已审核</span>');
			$(obj).remove();
			layer.msg('已审核!',{icon: 6,time:1000});
		});
	}
	/*身份-申请上线*/
	// function article_shenqing(obj,id){
	// 	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	// 	$(obj).parents("tr").find(".td-manage").html("");
	// 	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
	// }
	function queryPoint(title,url,id){
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
		//layer_show(title,url);
	}
	
	function changeStatus(title,url,id){
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
	
	//修改服务时长
	function changeServiceTime(title,url,id){
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
	
	function uploadUser(){
		var uploadFileUrl=document.getElementById("uploadFileUrl").value;
		if(uploadFileUrl==''){
			alert("请先上传文件");
			return;
		}
		$("#FileForm").ajaxSubmit({
			url:"uploadUser",
			type:'post',
			dataType:'json',
	        success:function(data){	        			        	
	        	if(data.name==""){
	        		alert("全部身份验证成功");
	        	}else{
	        		var message=data.name+"验证不通过";
	        		alert(message);
	        	}		        	
	        },
	        error:function(){
	            alert("请求失败了......");
	        }	
	    });	    
		/* $.ajax({
	    	url:"uploadUser",
	        data:{"uploadFileUrl":uploadFileUrl},
	        type:"post",
	        dataType:"json",
	        success:function(data){	        			        	
	        	if(data.name==""){
	        		alert("身份验证成功");
	        		location.reload();
	        	}else{
	        		var message=data.name+"验证不通过";
	        		alert(message);
	        	}		        	
	        },
	        error:function(){
	            alert("请求失败了......");
	        }	
	    }); */	    		
	}
	
	var id="";
	function GoSel(evt)
	{
	   var el = evt.srcElement?evt.srcElement:evt.target;
	   if(el.tagName.toUpperCase() !="TD") return;
	   var tr = el.parentNode;
// 	   alert(tr.cells[9].innerHTML);
	 	id=tr.cells[10].innerHTML;
	}
	/**
	 * 设置项目官员方法
	 */
	function projectOfficer(id,state){
		var sid=id;
		if(sid!=null&&sid!=""){
			$.ajax({
				type : "POST",
				url : 'updateRole',
				data : {
					id : sid,
					state:state
				},
				dataType : "json",
				success : function(data) {
					if (data) {
						if(state==0){
							alert("设置项目官员成功!");
						}else{
							alert("取消项目官员成功!");
						}
					} else {
						alert("该项目官员已经认证!");
					}
					location.reload() 
				},
				error : function(data) {
	
				}
			})
		}else{
			alert("请选中用户后再行设置官员！");
			return;
		}
	}
	
</script> 
</body>
</html>