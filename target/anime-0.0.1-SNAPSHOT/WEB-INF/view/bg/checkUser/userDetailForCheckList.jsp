<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="../css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>身份列表</title>
</head>
<body style="overflow:scroll">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 身份管理 <span class="c-gray en">&gt;</span> 身份列表 
<select class="foo" onchange="goToChooce(this.value)">
		<option <c:if test="${uRole==7 }">selected="selected"</c:if> value="7">全部待认证</option>
		<option <c:if test="${uRole==5 }">selected="selected"</c:if> value="5">待认证导师</option>
		<option <c:if test="${uRole==6 }">selected="selected"</c:if> value="6">待认证创业者</option>
	</select>
<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">	
	<div class="mt-20">
		<h3>基本资料</h3>
		<table class="table table-border table-bordered table-bg table-hover ">
			<thead>			
				<tr class="text-c">
					<th width="15" style="display:none;"><input type="checkbox" name="" value=""></th>
					<th width="30" style="display:none;">ID</th>
					<th width="75" style="display:none;">区域</th>
					<th width="100" style="display:none;">公司</th>
					<th width="100" style="display:none;">职位</th>
					<th width="120" style="display:none;">手机</th>
					<th width="120" style="display:none;">邮箱</th>					
					<th width="70">姓名</th>
					<th width="40">性别</th>
					<th width="80">身份证号</th>					
					<th width="120">昵称</th>
					<th width="60">角色</th>
					<th width="120">状态</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" varStatus="s"  var="user">			
				<tr class="text-c">
					<td style="display:none;"><input type="checkbox" value="" name=""></td>
					<td style="display:none;">${user.zone}</td>
					<td style="display:none;">${user.companyName}</td>
					<td style="display:none;">${user.position}</td>
					<td style="display:none;">${user.telphoneNumber}</td>
					<td style="display:none;">${user.emailAddress}</td>
					<td style="display:none;">${user.id}</td>
					
					<c:if test="${user.userName==null||user.userName==''}">
							  <td></td>
						   </c:if>
				   	<c:if test="${user.userName!=null&&user.userName!=''}">
							  <td>${user.userName}</td>
						   </c:if>													
					<c:if test="${user.gender==1}">
					 <td>男</td>
				    </c:if>
					<c:if test="${user.gender==2}">
					 <td>女</td>
				    </c:if>
				    <c:if test="${user.gender==null||user.gender==''}">
				    	<td></td>
				    </c:if>
				    <c:if test="${user.certification==null||user.certification==''}">
							  <td></td>
						   </c:if>
					<c:if test="${user.certification!=null&&user.certification!=''}">
							  <td>${user.certification}</td>	
						   </c:if>
					 <c:if test="${user.nickName==null||user.nickName==''}">
							  <td></td>
						   </c:if>
					<c:if test="${user.nickName!=null&&user.nickName!=''}">
						<td>${user.nickName}</td>
						   </c:if>				   			    					
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
					<c:if test="${user.role==5 || user.role==6}">
					 <td class="td-status">
						<span class="label radius">未审核</span>
					</td>
					<td class="f-14 td-manage">
						<a style="text-decoration:none" class="ml-5" onClick="identity_role('${user.id}')" href="javascript:;" title="编辑">
							<span class="label label-primary radius editor">审核</span>
						</a> 
					</td>
				    </c:if>
				    <c:if test="${user.role==0 || user.role==1}">
					 <td class="td-status">
						<span class="label label-success radius editor">已审核</span>
					</td>
					<td class="f-14 td-manage">
						<a style="text-decoration:none" class="ml-5 ma" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
					</td>
				    </c:if>										
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 分页实现 -->
		<div style="margin-top: 20px;"><span class="foo">共${page.pageCount}页 ${page.pageIndex+1}/${page.pageCount}页</span>
			<c:if test="${page.pageIndex>0 }">
				<a class="foo" href="userDetailForCheckList?start=0&size=${page.pageSize }&role=${uRole}">首页</a>
				<a class="foo" href="userDetailForCheckList?start=${page.pageIndex-1 }&size=${page.pageSize }&role=${uRole}">上一页</a>
			</c:if>
			<c:if test="${page.pageIndex+1<page.pageCount }">				
				<a class="foo" href="userDetailForCheckList?start=${page.pageIndex+1 }&size=${page.pageSize }&role=${uRole}">下一页</a>
				<a class="foo" href="userDetailForCheckList?start=${page.pageCount-1 }&size=${page.pageSize }&role=${uRole}">尾页</a>
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
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="../lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../js/H-ui.js"></script> 
<script type="text/javascript" src="../js/H-ui.admin.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
	]
});

window.onload=function(){
	if($(".editor").text()=="已审核"){
		$(".ma").css({
			display:"none"
		});
	}
}
/*动态选择分页页面*/
function goToPage(pageNo)
{
	//bg/interaction/questionlist?start=${questionList.pageIndex+1 }&pageSize=${questionList.pageSize }
	document.location.href="userDetailForCheckList?start="+pageNo+"&size=${page.pageSize }&role=${uRole}";
}
/*筛选*/
function goToChooce(role){
	document.location.href="userDetailForCheckList?start=0&size=${page.pageSize }&role="+role;
}

function identity_role(userId){

		window.location.href="userDetailForCheck?userId="+userId;
}

/*身份-添加*/
// function article_add(title,url,w,h){
// 	var index = layer.open({
// 		type: 2,
// 		title: title,
// 		content: url
// 	});
// 	layer.full(index);
// }
/*身份-编辑*/
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

</script> 
</body>
</html>