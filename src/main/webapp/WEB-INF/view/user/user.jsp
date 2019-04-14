<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head lang="en">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>个人资料</title>
     <link href="${contextPath}/css/person_data.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <style type="text/css">
    .link{
	   position: relative;
	   width: 100%;
	   padding-top:20px;
	   bottom: 15px;
	   overflow: hidden;
	   text-align: center;
    }
    .link-a{
	    position:relative;
	    display:inline-block;
	    text-align:center;
	    font-size: 12px;
	    color: black;
	    width: 85%;
	    text-decoration: none;	
     }

    @media (max-height: 600px) {
     .radio,.radio3{
        line-height: 30px;
        padding: 10px 5%;
        margin-bottom: 6px;
        font-size: 12px;
        background-color: #fbf8e4;
        width: 90%;
        height: auto;
        overflow: auto;
        margin-top:5px;
    }
    .special_ul {
      padding-top: 30px;
      font-size: 14px;
      border-bottom: 1px solid #eee;
     }
    }
      @media (min-height: 600px) {
     .radio,.radio3{
        line-height: 30px;
        padding: 10px 5%;
        margin-bottom: 6px;
        font-size: 14px;
        background-color: #fbf8e4;
        width: 90%;
        height: auto;
        overflow: auto;
        margin-top:5px;
    }
       .special_ul {
      padding-top: 30px;
      font-size: 14px;
      border-bottom: 1px solid #eee;
     }
    }
    </style>
    <!--弹出层JS-->
   
    <!--!end 弹出层JS-->
    
    <script src="${contextPath}/js/jquery.js"></script>
    <script src="${contextPath}/js/box.js"></script>
   
    <script type="text/javascript">
    var msg="提交成功，是否进行身份认证";
    function returnHomeCenter()
    {
    	var data={fieldName:"zone",value:$("#zone_s").val()};
		 $.ajax( {
	        type : "post",  
	        url : "updateUserInfo",  
	        data:data,
	        dataType:"json",  
	        success : function(data) {  
	            if(data.exceptionCode){
	            	Box.autoClose(data.exceptionMsg);
	            	return ;
	            }
	            location.href="${contextPath}/user/homecenter";
	        },
	        error:function(data){
	        	Box.autoClose("保存失败，请检查网络");
	        }
		}); 
    	
    }
    function fieldModify(fieldName){
    	
    	 var $field=$("input[name="+fieldName+"]");
    	 if(!$field){
    		 return;
    	 }
    	 doModify(fieldName,$field.val());
	}
    //对身份证进行验证
    var result=true;
    function fieldModifyCertification(fieldName){
    	
   	 var $field=$("input[name="+fieldName+"]");
   	 if(!$field){
   		 return;
   	 }
   	 var certification=$field.val().trim();
   	 if(certification==null || certification==""){
   		Box.autoClose('身份证号码不能为空');
   		result=false;
   	 }else{
   		result=IdentityCodeValid(certification);
   	 }  	 
   	 if(result){
   		doModify(fieldName,$field.val());
   	 } 	 
	}
    //对手机号进行验证
    var resultTelphone=true;
    function fieldModifyTelphoneNumber(fieldName){
    	
   	 var $field=$("input[name="+fieldName+"]");
   	 if(!$field){
   		 return;
   	 }
   	 var telphoneNumber=$field.val().trim();
   	 if(telphoneNumber==null || telphoneNumber==""){
   		 return true;
   	 }else{
   		resultTelphone=checkPhoneNumber(telphoneNumber);
   	 }
   	 if(resultTelphone){
   		doModify(fieldName,$field.val());
   	 } 	 
	}
  //对邮箱进行验证
    var resultEmailAddress=true;
    function fieldModifyEmailAddress(fieldName){
    	
   	 var $field=$("input[name="+fieldName+"]");
   	 if(!$field){
   		 return;
   	 }
   	 var emailAddress=$field.val().trim();
   	 if(emailAddress==null || emailAddress==""){
   		 return true;
   	 }else{
   		resultEmailAddress=checkEmailAddress(emailAddress);
   	 }	
   	 if(resultEmailAddress){
   		doModify(fieldName,$field.val());
   	 } 	 
	}
    function doModify(fieldName,value){
    	var data={fieldName:fieldName,value:value};
		 $.ajax( {
	        type : "post",  
	        url : "updateUserInfo",  
	        data:data,
	        dataType:"json",  
	        success : function(data) {  
	            if(data.exceptionCode){
	            	Box.autoClose(data.exceptionMsg);
	            }
	        },
	        error:function(data){
	        	Box.autoClose("保存失败，请检查网络");
	        }
		}); 
    }
 function IdentityCodeValid(code) { 
        var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
        var tip = "";
        var pass= true;
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if(!code || reg.test(code)==false){
            tip = "身份证号格式错误";
            pass = false;
        }
        
       else if(!city[code.substr(0,2)]){
            tip = "身份证号地址编码错误";
            pass = false;
        }
        else{
            //18位身份证需要验证最后一位校验位
            if(code.length == 18){
                code = code.split('');
                //∑(ai×Wi)(mod 11)
                //加权因子
                var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                //校验位
                var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                var sum = 0;
                var ai = 0;
                var wi = 0;
                for (var i = 0; i < 17; i++)
                {
                    ai = code[i];
                    wi = factor[i];
                    sum += ai * wi;
                }
                var last = parity[sum % 11];
                if(parity[sum % 11] != code[17]){
                    tip = "身份证号校验位错误";
                    pass =false;
                }
            }
        }
        if(!pass) Box.alert(tip);
        return pass;
    }
 function checkPhoneNumber(telphoneNumber){
	 if(!(/^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\d{8}$/g.test(telphoneNumber))){
 		Box.autoClose('请输入正确的手机号');
 		return false;
 	  }else{
 		  return true;
 	  }
 };
 function checkEmailAddress(emailAddress){
	 var trueEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	 if(!trueEmail.test(emailAddress)){
		 Box.autoClose('请输入正确的邮箱');
	 		return false;
	 }else{
		  return true;
	  }
 };
    function genderSave(value){
    	doModify("gender",value);
   };

    window.onload = function(){
        var sexBox = document.getElementById("sexBox");
        var layerForm = document.getElementsByClassName("layerForm")[0];
        var sexForm = document.getElementById("sexForm");
        var sex = document.getElementById("sex");
        sexBox.onclick = function(){
            layerForm.style.display = "block";
            var ps = sexForm.getElementsByTagName("p");
            for(var i=0;i<ps.length;i++){
                ps[i].onclick = function(){
                    var value = this.innerHTML;
                    sex.innerHTML = value;
                    layerForm.style.display = "none";
                    genderSave(this.title);
                }
            }
        };
        
        var box=document.getElementById('divselect'),
            title=box.getElementsByTagName('cite')[0],
            menu=box.getElementsByTagName('ul')[0],
            as=box.getElementsByTagName('a'),
            index=-1;

        // 点击三角时
        title.onclick=function(event){
            event=event || window.event;
            if(event.stopPropagation){
                event.stopPropagation();
            }else{
                event.cancelBubble=true;
            }
            menu.style.display='block';
            document.onkeyup=function(e){
                e=e || window.event;
                for(var i=0;i<as.length;i++){
                    as[i].style.background='none';
                }
                // 如果按下了向下方向键
                if(e.keyCode==40){
                    index++;
                    if(index>=as.length){
                        index=0;
                    }
                    as[index].style.background="#ccc";
                }
                // 如果按下了向上方向键
                if(e.keyCode==38){
                    if(index<=0){
                        index=as.length;
                    }
                    index--;
                    as[index].style.background="#ccc";
                }
                // 如果按下了回车键
                if(e.keyCode==13 && index!=-1){
                    title.innerHTML=as[index].innerHTML;
                    for(var i=0;i<as.length;i++){
                        as[i].style.background='none';
                    }
                    menu.style.display='none';
                    index=-1;
                }
            }
        };
        // 滑过滑过、离开、点击每个选项时
        for(var i=0;i<as.length;i++){
            as[i].onmouseover=function(){
                this.style.background='#ccc';
            };
            as[i].onmouseout=function(){
                this.style.background='none';
            };
            as[i].onclick=function(){
                title.innerHTML=this.innerHTML;
                areaSave(this);
            };
        }

        // 点击页面空白处时
        document.onclick=function(){
            menu.style.display='none';
        }
        var setIn=document.getElementById('setIn');
        var cancel=document.getElementById('cancel');
        var name=true;
        setIn.onclick=function(){
        	if($("input[name=userName]").val().trim()=="" || $("input[name=userName]").val().trim()==null){
        		Box.alert("请输入您的姓名");
        		name=false;
        	}else{
        		name=true;
        	};    	        	   
        	if(result && name){
        		fieldModify('userName');
        		fieldModifyCertification('certification');
        		Box.confirm(msg,function(){
					location.href="${contextPath}/user/homecenter";
				},function(){
					location.href="${contextPath}/user/approving";
				});
        	}
        }
        cancel.onclick=function(){
        	location.href="${contextPath}/user/homecenter";
        }
    };
    function areaSave(area)
    {
    	doModify("zone",area.getAttribute('selectid'));
    	//alert(txt.getAttribute('selectid'))
    }
    </script>
</head>
<body>

<div class="layer1 layerForm">
    <div class="divForm" id="sexForm">
        <p title="1">男</p>
        <p title="2">女</p>
    </div>
</div>
 
<article class="information">
    <ul>
        <li><img src="${contextPath}/image/data_01.png"><span>真实姓名<span class="must">*</span></span><input name="userName" type="text" value="${user.userName}" onblur="fieldModify('userName');"/></li>
        <li><img src="${contextPath}/image/data_02.png"><span>身份证<span class="must">*</span></span><input name="certification" type="text" value="${user.certification}" onblur="fieldModifyCertification('certification');"/></li>
        <li id="sexBox">
            <img src="${contextPath}/image/data_04.png"><span>性别</span><label id="sex"><spring:message code="gender.gender${user.gender}"/></label>
            <img class="right" src="${contextPath}/image/head-arrows.png">
        </li>
        <li><img src="${contextPath}/image/data_03.png"><span>昵称</span><input name="nickName" type="text" value="${user.nickName}" onblur="fieldModify('nickName');"/></li>
    </ul>
    <ul>
        <li><img src="${contextPath}/image/data_09.png"><span>区域</span>
            <div id="divselect">
            <c:choose>
            <c:when test='${user.zone!=null&&fn:length(user.zone)>0}'>
                <cite><spring:message code="project.zone.zone${user.zone}"/></cite>
            </c:when>
            <c:otherwise>
               <cite>请选择区域</cite>
            </c:otherwise>
            </c:choose>
                <ul>
                    <li id="li"><a href="javascript:;" selectid="1">成都</a></li>
                    <li><a href="javascript:;" selectid="2">自贡</a></li>
                    <li><a href="javascript:;" selectid="3">攀枝花</a></li>
                    <li><a href="javascript:;" selectid="4">泸州</a></li>
                    <li><a href="javascript:;" selectid="5">德阳</a></li>
                    <li><a href="javascript:;" selectid="6">绵阳</a></li>
                    <li><a href="javascript:;" selectid="7">广元</a></li>
                    <li><a href="javascript:;" selectid="8">遂宁</a></li>
                    <li><a href="javascript:;" selectid="9">内江</a></li>
                    <li><a href="javascript:;" selectid="10">乐山</a></li>
                    <li><a href="javascript:;" selectid="11">南充</a></li>
                    <li><a href="javascript:;" selectid="12">宜宾</a></li>
                    <li><a href="javascript:;" selectid="13">广安</a></li>
                    <li><a href="javascript:;" selectid="14">达州</a></li>
                    <li><a href="javascript:;" selectid="15">巴中</a></li>
                    <li><a href="javascript:;" selectid="16">雅安</a></li>
                    <li><a href="javascript:;" selectid="17">眉山</a></li>
                    <li><a href="javascript:;" selectid="18">资阳</a></li>
                    <li><a href="javascript:;" selectid="19">阿坝</a></li>
                    <li><a href="javascript:;" selectid="20">甘孜</a></li>
                    <li><a href="javascript:;" selectid="21">凉山</a></li>
                </ul>
            </div>
        </li>
        <li><img src="${contextPath}/image/data_05.png"><span>公司</span><input name="companyName" type="text" value="${user.companyName}" onblur="fieldModify('companyName');"/></li>
        <li><img src="${contextPath}/image/data_06.png"><span>职位</span><input name="position" type="text" value="${user.position}" onblur="fieldModify('position');"/></li>
    </ul>
    <ul>
        <li><img src="${contextPath}/image/data_08.png"><span>手机</span><input name="telphoneNumber" type="text" value="${user.telphoneNumber}" onblur="fieldModifyTelphoneNumber('telphoneNumber');"/></li>
        <li><img src="${contextPath}/image/data_07.png"><span>邮箱</span><input name="emailAddress" type="text" value="${user.emailAddress}" onblur="fieldModifyEmailAddress('emailAddress');"/></li>
    </ul>
</article>
<aside>
    <div class="bottom_btn">
        <a href="#" id="setIn">保存</a>
        <a href="#" id="cancel">取消</a>
    </div>
</aside>
<div class="link">
    <a class="link-a" href="http://www.95omno.com/user/userAgreement_F03.html">《SYE创业四川软件许可及服务协议》</a>
</div>
</body>
</html>