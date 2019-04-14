<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>留言审核</title>
    <link href="${contextPath}/css/public.css" type="text/css" rel="stylesheet">
    <link href="${contextPath}/css/commonBigNav.css" type="text/css" rel="stylesheet">
    <link href="${contextPath}/css/MessageBig.css" type="text/css" rel="stylesheet">
    <!--分页器样式-->
    <link href="${contextPath}/css/page.css" type="text/css" rel="stylesheet">
    <link href="${contextPath}/css/ProjCheckBig.css" type="text/css" rel="stylesheet">
    <!--end！分页器样式-->
    <!--分页器Js-->
    <script src="${contextPath}/js/page.js"></script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script src="${contextPath}/js/jquery-form.js" type="text/javascript"></script>
    <script src="${contextPath}/js/app.js"></script>
    <script type="text/javascript">
        var flag="0"
    	var urlPre = "${contextPath}/bg/manage/queryMsgBlockPage";
    	function loadPage(page,msgflag){
    		/* $.get(urlPre+"?pageIndex="+page,function(data,status){
    			
    			//loading = false;
    		}); */
    		
    		$("#pageIndex").val(page);
    		$("#msgflag").val(msgflag);
    		$('#queryPageForm').ajaxSubmit({
			   type:'post',
			   dataType:'html',
			   success: function(data, status){
				 $("#msgContainer").html(data);
               },
               error: function (data, status, e){  
                   alert('提交失败，请检查网络');
               }
          });
    	}
    	function loadNewPage(){
    		Pagination.page = 1;
    		Pagination.initAll();
    		$('#keywords').val($("#seek").val());
    		loadPage(1,flag);
    	}
    	$(function(){
    		Pagination.config.size = ${totalPage};
        	Pagination.queryPage = function(page){
        		loadPage(page,flag);
        	};
    		Pagination.initAll();
    		loadPage(1,flag);
    	});
    	function doCheck(id,pass){
    		var mflag = pass?'1':'-1';
    		$.ajax({
	    		url:'${contextPath}/bg/manage/doChangeLeftMessageFlag',
	    		type:'post',
	    		dataType:'json',
	    		data:{id:id,flag:mflag},
	    		async:false,
	    		success:function(data){
					if(data.exceptionCode){
						alert(data.exceptionMsg);
					}else{
						alert('审核提交成功');
						loadPage(Pagination.page,flag);
					}
	    		},
	    		error:function(data){
	    			alert('提交失败，请检查网络');
	    		}
	    	});
    	}
    </script>
    <!--end！分页器Js-->
</head>
<body>
<header>
    <nav>
        <img src="${contextPath}/image/SYElogo.jpg">
        <ul>
            <li><a href="${contextPath}/bg/project/bgPeriodProjects">项目审核<span class="selected" style="display: none"></span></a></li>
            <li><a href="#">留言审核<span class="selected"></span></a></li>
        </ul>
    </nav>
</header>
<article>
    <div class="seek">
        <span>留言审核</span>
        <span>
       		<input id="seek" type="text" placeholder="输入手机号、姓名、昵称搜索"><img src="${contextPath}/image/seek.png" onclick="loadNewPage();"/>
   	    </span>
    	<div style="display:none">
	       	<form id="queryPageForm" action="${contextPath}/bg/manage/queryMsgBlockPage" method="post">
	       		<input id="keywords" type="hidden" name="keywords"/>
	       		<input id="pageIndex" type="hidden" name="pageIndex"/>
	       		<input id="msgflag" type="hidden" name="msgflag">
	       	</form>
    	</div>
    </div>
    <div style="clear: both"> </div>
    <div class="checkStatus" onclick="audit_choose()">
            <span id="auditing" class="selectedCheck">待审核</span><span id="audited">已审核</span>
    </div>
    <section class="BigContent">
        <ul id="msgContainer">
        </ul>
    </section>
    <div class="pageBox">
        <div id="pagination"></div>
    </div>
</article>
</body>
<script type="text/javascript">

function audit_choose()
{
	if($("#auditing").hasClass("selectedCheck"))
	{
		$("#auditing").removeClass("selectedCheck");
		$("#audited").attr("class","selectedCheck")
		//addchildren(0,0);
		flag="1"
	}
	else
	{
		$("#audited").removeClass("selectedCheck");
		$("#auditing").attr("class","selectedCheck")
		//addchildren(0,1);
		flag="0"
	}

	getTotalPage();
	loadPage(1,flag);
}

function getTotalPage(){
		 $.ajax({
    		url:'${contextPath}/bg/manage/home/audit/totalPage',
    		type:'post',
    		dataType:'json',
    		data:{msgflag:flag},
    		async:false,
    		success:function(data){
				if(data.exceptionCode){
					alert(data.exceptionMsg);
				}else{
					Pagination.config.size = data.result;  	
					Pagination.initAll();
				}
    		},
    		error:function(data){
    			alert('提交失败，请检查网络');
    		
    		}
    	});
	}
function init_Pagination()
{
	/*var result=getTotalPage();
	alert(result)
	if(result>0)
	{
		Pagination.config.size = result;
    	Pagination.queryPage = function(page){
    		loadPage(page,flag);
    	};
		Pagination.initAll();
	}*/
	//getTotalPage();
}
</script>
</html>