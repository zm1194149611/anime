<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>点赞人列表</title>
    <link href="${contextPath }/css/peopleListDetails.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/box.js"></script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script src="${contextPath}/js/app.js" type="text/javascript"></script>
    <script type="text/javascript">
    	var type = '${type}';
    	var id = '${id}';
	    var contextPath = '${contextPath}';
	    var userId='${user.id}';
	    var domain = '${domainName}';
	   	var start = 0;
	   	var size = 11;
	   	var loading=false;
	   	var showMore = false;
	   	function loadList(isAppend){
	   		if(loading){
	   			Box.autoClose("项目载入中，请稍候...");
	   			return;
	   		}
	   		loading=true;
	   		if(type=="mentor"){
	   			var url = "${contextPath}/pubUser/getVoteUserListByMentorId?mentorId="+id+"&start="+start+"&size="+size; 
	   		}else if(type=="userTrack"){
	   			var url = "${contextPath}/pubUser/getMentorTrackVoteUserByTrackId?trackId="+id+"&start="+start+"&size="+size;
	   		}else if(type=="prjTrack"){
	   			var url = "${contextPath}/pubUser/getPrjTrackVoteUserListByTrackId?trackId="+id+"&start="+start+"&size="+size;
	   		}else if(type=="prj"){
	   			var url = "${contextPath}/vote/getPrjVoteUserList?projectId="+id+"&start="+start+"&size="+size;
	   		}else if(type=="park"){
	   			var url = "${contextPath}/ground/getIncubationparkVoteUserList?parkId="+id+"&start="+start+"&size="+size;
	   		}
	   		$.get(url,function(data,status){
	   			if(isAppend){
	    			$("section").append(data);
	   			}else{
	   				$("section").html(data);
	   			}
	   			loading = false;
	   		});
	  	}
	   	
	   	function queryMoreList(){
	   		start += size;
	   		loadList(true);
	   	}
	   	
    	$(function(){
    		loadList(true);
    		
    	});
    	
    	
    	$(window).scroll(function(){
        	if(App.windowReachBottom()){
        		queryMoreList();
    		}
    	});
    	/*跳转到点赞人的页面*/
		function goToVoterPage(userId){
			$.ajax({
				//判断用户角色
				url:"${contextPath}/pubUser/getVoterRoleByUserId",
				type:"post",
				dataType:'json',
				data:{"userId":userId},
				success:function(data){
					if(data.exceptionCode){
						Box.autoClose(data.exceptionMsg);
					}else{
						//如果是普通用户
						if(data.result=="you"){
							Box.autoClose("该用户还未成为导师或创业者");
							return;
							
						}else if(data.result=="chuang"){//如果是创业者
							$.ajax({
								//判断创业者是否有项目，如果有项目取最新一个项目
								url:"${contextPath}/pubUser/getVoterProjectByUserId",
								type:"post",
								dataType:'json',
								data:{"userId":userId},
								success:function(data){
									//为0表示没有项目
									if(data.result=="0"){
										Box.autoClose("该创业者暂时没有创业项目");
										return;
									}else{
										location.href="${contextPath}/ground/projectDetail?projectId="+data.result;
									}
								}
							});
						}else{//如果是导师
							location.href="${contextPath}/pubUser/tutorDetails?userId="+data.result;
						}
					}
				}
			})
			
		}
    </script>
</head>
<body>
<section>

</section>
<%-- <c:forEach items="${votes.list }" var="vote">
	<div class="peopleList">
	    <div class="peopleList-left">
	        <c:set var="headImgUrl" value="${vote.headImgUrl}"/>
        	<c:if test='${vote.headImgUrl==null||""==vote.headImgUrl}'>
	  		<c:set var="headImgUrl" value="${contextPath}/image/sye-headImg.jpg"/>
        	</c:if>
          	<img class="peopleList-peopleImg" src='${headImgUrl}'/>
        	<c:if test="${fn:indexOf(vote.role,'1')==0}">
        	<img class="peopleList-peopleDao" src="${contextPath}/image/mycenter-dao.png">
	    	</c:if>
	    	<c:if test="${fn:indexOf(vote.role,'0')==0}">
        	<img class="peopleList-peopleDao" src="${contextPath}/image/mycenter-chuang.png">
	    	</c:if>
	     	<c:if test="${fn:indexOf(vote.role,'3')==0}">
        	<img class="peopleList-peopleDao" src="${contextPath}/image/mycenter-chuangH.png">
	    	</c:if>
	     	<c:if test="${fn:indexOf(vote.role,'4')==0}">
        	<img class="peopleList-peopleDao" src="${contextPath}/image/mycenter-daoH.png">
	    	</c:if>
	    </div>
	    <div class="peopleList-right">
	        <span>${vote.nickName }</span>
	        <c:choose>
             <c:when test="${fn:indexOf(vote.level,'1')==0}">
                 <img src="${contextPath}/image/v1.png">
             </c:when>
             <c:when test="${fn:indexOf(vote.level,'2')==0}">
                 <img src="${contextPath}/image/v2.png">
             </c:when>
             <c:when test="${fn:indexOf(vote.level,'3')==0}">
                 <img src="${contextPath}/image/v3.png">
             </c:when>
             <c:when test="${fn:indexOf(vote.level,'4')==0}">
                 <img src="${contextPath}/image/v4.png">
             </c:when>
             <c:when test="${fn:indexOf(vote.level,'5')==0}">
                 <img src="${contextPath}/image/v5.png">
             </c:when>
             <c:otherwise>
                 <img src="${contextPath}/image/v6.png">
             </c:otherwise>
        	</c:choose>
	        	<c:choose>
            	<c:when test='${vote.certification!=null&&""!=vote.certification}'>
                	<img src="${contextPath}/image/realname.png">
            	</c:when>
	        </c:choose>
	        <c:choose>
	            <c:when test="${fn:indexOf(vote.role,'1')==0||fn:indexOf(vote.role,'0')==0}">
	                <img src="${contextPath}/image/SYE.png">
	             </c:when>
	        </c:choose>
	    </div>
	    <img class="peopleList-arrow" src="${contextPath }/image/mycenter-arrows.png">
	</div>
</c:forEach> --%>
<%-- <div class="peopleList">
    <div class="peopleList-left">
        <img class="peopleList-peopleImg" src="${contextPath }/image/test1.png">
        <img class="peopleList-peopleDao" src="${contextPath }/image/mycenter-dao.png">
    </div>
    <div class="peopleList-right">
        <span>胡爸爸</span>
        <img src="${contextPath }/image/level.png">
        <img src="${contextPath }/image/realname.png">
        <img src="${contextPath }/image/SYE.png">
    </div>
    <img class="peopleList-arrow" src="${contextPath }/image/mycenter-arrows.png">
</div>
<div class="peopleList">
    <div class="peopleList-left">
        <img class="peopleList-peopleImg" src="${contextPath }/image/test1.png">
        <img class="peopleList-peopleDao" src="${contextPath }/image/mycenter-dao.png">
    </div>
    <div class="peopleList-right">
        <span>胡爸爸</span>
        <img src="${contextPath }/image/level.png">
        <img src="${contextPath }/image/realname.png">
        <img src="${contextPath }/image/SYE.png">
    </div>
    <img class="peopleList-arrow" src="${contextPath }/image/mycenter-arrows.png">
</div>
<div class="peopleList">
    <div class="peopleList-left">
        <img class="peopleList-peopleImg" src="${contextPath }/image/test1.png">
        <img class="peopleList-peopleDao" src="${contextPath }/image/mycenter-dao.png">
    </div>
    <div class="peopleList-right">
        <span class="peopleList-name">胡爸爸</span>
        <img src="${contextPath }/image/level.png">
        <img src="${contextPath }/image/realname.png">
        <img src="${contextPath }/image/SYE.png">
    </div>
    <img class="peopleList-arrow" src="${contextPath }/image/mycenter-arrows.png">
</div> --%>
</body>
</html>