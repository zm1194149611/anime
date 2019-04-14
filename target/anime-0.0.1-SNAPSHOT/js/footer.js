var footer={	
    footerAddHome:function(){
    	var footerString = '<ul><li><a id="page_1" href="'+contextPath+'/cartoon/index" style="color: red"><img src="'+contextPath+'/image/footer-homered.png">漫画</a></li>'+
        '<li><a id="page_2" href="'+contextPath+'/comic/index"><img src="'+contextPath+'/image/footer-talkblack.png">动漫</a></li>'+
        '<li><a id="page_3" href="JavaScript:void(0)"><img src="'+contextPath+'/image/footer-findblack.png">其他</a></li>'+
        '<li><a id="page_5" href="JavaScript:void(0)"><img src="'+contextPath+'/image/footer-myblack.png">我</a></li></ul>';
    	var body = document.getElementsByTagName("body")[0];
        var footer = document.createElement("footer");
        footer.innerHTML = footerString;
        body.appendChild(footer);
    },
    footerAddTalk:function(){
    	var footerString= '<ul><li><a id="page_1"href="'+contextPath+'/cartoon/index"><img src="'+contextPath+'/image/footer-homeblack.png">漫画</a></li>'+
            '<li><a id="page_2" href="'+contextPath+'/comic/index" style="color: red"><img src="'+contextPath+'/image/footer-talkred.png">动漫</a></li>'+
            '<li><a id="page_3" href="JavaScript:void(0)"><img src="'+contextPath+'/image/footer-findblack.png">其他</a></li>'+
            '<li><a id="page_5" href="JavaScript:void(0)"><img src="'+contextPath+'/image/footer-myblack.png">我</a></li></ul>';
    	
        var body = document.getElementsByTagName("body")[0];
        var footer = document.createElement("footer");
        footer.innerHTML = footerString;
        body.appendChild(footer);
    },
    footerAddFind:function(){
    	var footerString='<ul><li><a id="page_1" href="'+contextPath+'/ground/home"><img src="'+contextPath+'/image/footer-homeblack.png">漫画</a></li>'+
    		'<li><img class="redMessage" src="'+contextPath+'/image/footer-message.png"><a id="page_2" href="'+contextPath+'/communication/interaction?userId='+userId+'"><img src="'+contextPath+'/image/footer-talkblack.png">动漫</a></li>'+
            '<li><a id="page_3" href="'+contextPath+'/ground/homeDetails" ><img src="'+contextPath+'/image/footer-findred.png">其他</a></li>'+
            '<li><a id="page_5" href="'+contextPath+'/user/homecenter"><img src="'+contextPath+'/image/footer-myblack.png">我</a></li></ul>';
    	
        var body = document.getElementsByTagName("body")[0];
        var footer = document.createElement("footer");
        footer.innerHTML = footerString;
        body.appendChild(footer);
    },
    footerAddMy:function(){
    	var footerString= '<ul><li><a id="page_1" href="'+contextPath+'/ground/home"><img src="'+contextPath+'/image/footer-homeblack.png">漫画</a></li>'+
    		'<li><img class="redMessage" src="'+contextPath+'/image/footer-message.png"><a id="page_2" href="'+contextPath+'/communication/interaction?userId='+userId+'"><img src="'+contextPath+'/image/footer-talkblack.png">动漫</a></li>'+
            '<li><a id="page_3" href="'+contextPath+'/ground/homeDetails"><img src="'+contextPath+'/image/footer-findblack.png">其他</a></li>'+
            '<li><a id="page_5" href="'+contextPath+'/user/homecenter"><img src="'+contextPath+'/image/footer-myred.png">我</a></li></ul>';
    	
        var body = document.getElementsByTagName("body")[0];
        var footer = document.createElement("footer");
        footer.innerHTML = footerString;
        body.appendChild(footer);
    },
    footerAddSubMenu:function(){
    	var footerString='<ul><li><a id="page_1" href="'+contextPath+'/ground/home"><img src="'+contextPath+'/image/footer-homeblack.png">漫画</a></li>'+
            '<li><img class="redMessage" src="'+contextPath+'/image/footer-message.png"><a id="page_2" href="'+contextPath+'/communication/interaction?userId='+userId+'"><img src="'+contextPath+'/image/footer-talkblack.png">动漫</a></li>'+
            '<li><a id="page_3" href="'+contextPath+'/ground/homeDetails"><img src="'+contextPath+'/image/footer-findblack.png">其他</a></li>'+
            '<li><a id="page_5" href="'+contextPath+'/user/homecenter"><img src="'+contextPath+'/image/footer-myblack.png">我</a></li></ul>';
    	
        var body = document.getElementsByTagName("body")[0];
        var footer = document.createElement("footer");
        footer.innerHTML = footerString;
        body.appendChild(footer);
    },
//    footerCheck:function(){
//    	var redPoint=document.getElementById('redPonit');
//    	if(isUpdateUser=="1"){
//    		redPoint.style.display="block";
//    	}else{
//    		redPoint.style.display="none";
//    	}
//    }
};
