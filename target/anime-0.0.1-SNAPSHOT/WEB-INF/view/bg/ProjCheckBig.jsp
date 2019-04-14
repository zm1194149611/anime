<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
     <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/Upload.css" rel="stylesheet" type="text/css">
   
    <link href="${contextPath}/css/public.css" type="text/css" rel="stylesheet">
    <link href="${contextPath}/css/commonBigNav.css" type="text/css" rel="stylesheet">
    <link href="${contextPath}/css/ProjCheckBig.css" type="text/css" rel="stylesheet">
    <!--分页器样式-->
    <link href="${contextPath}/css/page.css" type="text/css" rel="stylesheet">
    <!--end！分页器样式-->
	<!--与页面直接相关的样式-->
	<style type="text/css">
	  .ProjCheckBigShow{
	  display: none;
	  }
	</style>
    <!--分页器Js-->
    <script src="${contextPath}/js/page.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery.js" ></script>
    <!--end！分页器Js-->
    <title>项目审核</title>
</head>
<body>
<header>
    <nav>
        <img src="${contextPath}/image/SYElogo.jpg">
        <ul>
            <li><a href="#">项目审核<span class="selected"></span></a></li>
            <li><a href="${contextPath}/bg/manage/home">留言审核<span class="selected" style="display: none"></span></a></li>
        </ul>
    </nav>
</header>
<article>
    <div class="seek">
        <span>项目审核</span>
        <span><input id="seek" type="text" placeholder="输入项目名称、负责人姓名进行搜索"><a href="#" onclick="seek()" ><img src="${contextPath}/image/seek.png" ></span></a>
    </div>
    <div style="clear: both"> </div>
    <div class="classify ProjCheckBigShow">
        <ul>
            <li>
                <label>状态分类：</label>
                <p>
                    <span class="selectedSpan">全部</span><span>意向创业</span><span>初始创业</span><span>运营中</span>
                </p>
            </li>
            <li>
                <label>行业分类：</label>
                <p>
                    <span class="selectedSpan">全部</span><span>农林牧渔</span><span>批发零售</span><span>服务业</span>
                    <span>计算机软件</span><span>住宿餐饮</span><span>文化娱乐</span>
                    <span>教育培训</span><span>水利能源</span><span>其他</span>
                </p>
            </li>
            <li>
                <label>区域分类：</label>
                <p>
                    <span class="selectedSpan">全部</span><span>成都</span><span>自贡</span><span>攀枝花</span><span>泸州</span><span>德阳</span>
                    <span>绵阳</span><span>广元</span><span>遂宁</span><span>内江</span><span>乐山</span>
                    <span>南充</span><span>宜宾</span><span>广安</span><span>达州</span><span>巴中</span>
                    <span>雅安</span><span>眉山</span><span>资阳</span><span>阿坝</span><span>甘孜</span><span>凉山</span>
                </p>
            </li>
        </ul>
    </div>
    <section class="BigContent">
        <div class="checkStatus" onclick="audit_choose()">
            <span id="auditing" class="selectedCheck">待审核</span><span id="audited">已审核</span>
        </div>
        <ul class="checkBox" id="projlist">
            <li>
                <a>
                    <span>项目名称</span>
                    <span>负责人</span>
                    <span>上传时间</span>
                    <span>区域</span>
                    <span>状态</span>
                    <span>行业</span>
                    <span>审核按钮</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span >搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
            <li>
                <a href="ProDetail.html">
                    <span>搜狐视频</span>
                    <span>张朝阳</span>
                    <span>2015-11-12</span>
                    <span>攀枝花</span>
                    <span>意向创业</span>
                    <span>计算机软件</span>
                    <span>审核通过</span>
                </a>
            </li>
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
		addchildren(0,0);
	}
	else
	{
		$("#audited").removeClass("selectedCheck");
		$("#auditing").attr("class","selectedCheck")
		addchildren(0,1);
	}
	addchildren(0,getAuditSta());
	
}
function js_jumpProj(id)
{
	if(getAuditSta()==0)
	location.href="${contextPath}/bg/project/bgProDetail?projectId="+id+"&&currPage="+Pagination.page;
}
function addchildren(curpage,auditing){

	
	var data={search:$("#seek").attr("value"),currPage:curpage,auditstatus:auditing}
	
    $.ajax({
	url:'${contextPath}/bg/project/auditPeriodProjects',
	type:'post',
	dataType:'json',
	data:data,
	success:function(data){ 
		 var str ;
	         createheader(); 
		 for(i=0;i<data.length;i++)
		 {
			 str="<li> <a href=\"javascript:js_jumpProj('"+data[i].ProjectId+"');\">";
			
			 str+="<span>"+data[i].Name+"</span>";
			 str+="<span>"+data[i].ResPerson+"</span>";
			 str+="<span>"+data[i].CommitTime+"</span>";
			 str+="<span>"+data[i].Zone+"</span>";
			 str+="<span>"+data[i].Status+"</span>";
			 str+="<span>"+data[i].Business+"</span>";
			 if(auditing==0)
			 str+="<span>审核按钮</span>";
			 else
			 str+="<span>已审核</span>"
			 $("#projlist").append(str);
		 } 
		 if(data.length>0)
		 initPagination(parseInt(data[0].TotalPage),parseInt(data[0].CurrPage));
	},
	error:function(data){
		isSubmitting = false;
		alert('提交失败，请检查网络');
	}
});
}
function createheader()
{
 $("#projlist").empty();
 $("#projlist").append("<li> <a href=\"#\">"+"<span>项目名称</span>" +"<span>负责人</span>" +"<span>上传时间</span>"+"<span>区域</span>" +"<span>状态</span>"+"<span>行业</span>"+"<span>审核通过</span> "+ "</a>" +"</li>");
}
function newClick()
{
  addchildren(this.innerHTML,getAuditSta())
  arguments.callee.base.apply(this);
}
function newPrevClick()
{
   var prev=Pagination.page-1;
    if (prev < 1) {
        prev = 1;
    }
  addchildren(prev,getAuditSta())
  arguments.callee.base.apply(this);
}
function newNextClick()
{
	 var next=parseInt(Pagination.page)+1;
     if (next > Pagination.size) {
    	 next = Pagination.size;
     }
  addchildren(next,getAuditSta())
  arguments.callee.base.apply(this);
}
for (var n in Pagination)
{
  if(n=="Click"){
	 var old=Pagination[n]
     newClick.base=old
     Pagination[n]=newClick
   }
   if(n=="Prev")
   {
      var old=Pagination[n]
	  newPrevClick.base=old
	  Pagination[n]=newPrevClick
   }
 
    if(n=="Next")
   {
      var old=Pagination[n]
	  newNextClick.base=old
	  Pagination[n]=newNextClick
   }
}
function GetQueryString(name) {
	   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
	   var r = window.location.search.substr(1).match(reg);
	   if (r!=null) return (r[2]); return null;
	}
function getAuditSta()
{
	if($("#auditing").hasClass("selectedCheck"))
		return 0 ;
	else
		return 1;
}
function setAuditSta(audit)
{
	if(audit==1)
	{
		$("#auditing").removeClass("selectedCheck");
		$("#audited").attr("class","selectedCheck");
		
	}
	else
	{
		$("#audited").removeClass("selectedCheck");
		$("#auditing").attr("class","selectedCheck")
		audit=0;
	}
	return audit;
}
function seek()
{	
    createheader();
    addchildren(0,getAuditSta())		
}
function init()
{
	createheader();
	var currPage=GetQueryString("currPage");
	var auditing=GetQueryString("auditstatus");
	auditing=setAuditSta(auditing)

	if(currPage==null)
	addchildren(0,auditing);
	else
	addchildren(currPage,auditing)		
}
init()

</script>
</html>