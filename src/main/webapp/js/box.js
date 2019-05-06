/**
 * Created by Tantake on 2016/3/22.
 */
var box1 = '<div class="layer"><div class="box1"><p></p></div></div>';
var box0 = '<div class="layer"><div class="box1"><p></p><p style="width:20px;text-align:left;"></p></div></div>';
var box2 = '<div class="layer"><div class="box1"><p></p><span id="close" class="span1">确定</span></div></div>';
var box3 = '<div class="layer"><div class="box1"><p></p><div><span id="sure" class="span2">确定</span><span id="close" class="span2">取消</span></div></div></div>';
var box4 = '<div class="layer"><div class="box1"><p></p><div><span id="sure" class="span2">继续留言</span><span id="close" class="span2">返回留言板</span></div></div></div>';
var box5 = '<div class="layer"><div class="criticism"><div class="criticism-left"><img src="image/mycenter-my.png"></div><div class="criticism-right"><div class="my-criticism"><textarea id="myMessage"></textarea></div></div><div class="bottom-box"><span id="sure" class="yes">确认</span><span id="close" class="no">取消</span></div></div></div>';
var body = '';
var article = '';
var text='';//用来保存用户的评论

var Box ={
    beforeBox:function(){
        if(!body){
            body = document.getElementsByTagName("body")[0];
        }
        if(!article){
            article = document.getElementsByTagName("article")[0];
        }
    },
    autoClose:function(str,closeAct){
        Box.beforeBox();
        var oldElem = document.getElementsByClassName("layer")[0];
        var newElem = oldElem?oldElem.parentNode:document.createElement("div");
        var newText = document.createTextNode(str);

        newElem.innerHTML = box1;
        var p = newElem.getElementsByTagName("p")[0];
        p.appendChild(newText);
        body.insertBefore(newElem,article);
        var closeFunc = function(){
            Box.close();
            if(typeof closeAct=='function'){
                closeAct.call(this);
            }
        };
        setTimeout(closeFunc,2000);
    },
    refreshEnable:false,
    refreshIndex:0,
    refreshSource:'',
    refreshNoAutoCloseInnerText:function(){
    	var oldElem = document.getElementsByClassName("layer")[0];
    	if(oldElem){
    		var ps = oldElem.getElementsByTagName("p");
    		if(ps&&ps.length>1){
    			var p = ps[1];
    			var val = '';
    			var cyc = (Box.refreshIndex)%3+1;
        		for(var i=0;i<cyc;i++){
        			val+='.';
        		}
        		p.innerHTML = val;
        		Box.refreshIndex++;
    		}
    	}
    	if(Box.refreshEnable){
    		setTimeout(Box.refreshNoAutoCloseInnerText,1000);
    	}
    },
    noAutoClose:function(str){
    	Box.beforeBox();
    	Box.refreshIndex = 0;
    	Box.refreshSource = str;
    	var oldElem = document.getElementsByClassName("layer")[0];
        var newElem = oldElem?oldElem.parentNode:document.createElement("div");
        var newText = document.createTextNode(str);

        newElem.innerHTML = box0;
        var p = newElem.getElementsByTagName("p")[0];
        p.appendChild(newText);
        body.insertBefore(newElem,article);
        /*var closeFunc = function(){
        	Box.close();
        	if(typeof closeAct=='function'){
        		closeAct.call(this);
        	}
        };*/
        Box.refreshEnable = true;
        setTimeout(Box.refreshNoAutoCloseInnerText,1000);
    },
    alert:function(str,closeAct){
        Box.beforeBox();
        var oldElem = document.getElementsByClassName("layer")[0];
        var newElem = oldElem?oldElem.parentNode:document.createElement("div");
        var newText = document.createTextNode(str);

        newElem.innerHTML = box2;
        body.insertBefore(newElem,article);
        var p = newElem.getElementsByTagName("p")[0];
        p.appendChild(newText);
        var closeId = document.getElementById("close");
        closeId.onclick = function(){
            Box.close();
            if(typeof closeAct=='function'){
                closeAct.call(this);
            }
        };
    },
    confirm:function(str,yes,no){
        Box.beforeBox();
        var oldElem = document.getElementsByClassName("layer")[0];
        var newElem = oldElem?oldElem.parentNode:document.createElement("div");
        var newText = document.createTextNode(str);

        newElem.innerHTML = box3;
        body.insertBefore(newElem,article);
        var p = newElem.getElementsByTagName("p")[0];
        p.appendChild(newText);
        var closeId = document.getElementById("close");
        var sureId = document.getElementById("sure");
        closeId.onclick = function(){
            Box.close();
            if(typeof yes =='function'){
                yes.call(this);
            }
        };
        sureId.onclick = function(){
            Box.close();
            if(typeof no=='function'){
                no.call(this);
            }
        };
    },
    leftmsg:function(str,yes,no){
    	Box.beforeBox();
    	var oldElem = document.getElementsByClassName("layer")[0];
    	var newElem = oldElem?oldElem.parentNode:document.createElement("div");
        var newText = document.createTextNode(str);

        newElem.innerHTML = box4;
        body.insertBefore(newElem,article);
        var p = newElem.getElementsByTagName("p")[0];
        p.appendChild(newText);
        var closeId = document.getElementById("close");
        var sureId = document.getElementById("sure");
        closeId.onclick = function(){
        	Box.close();
        	if(typeof yes =='function'){
        		yes.call(this);
        	}
        };
        sureId.onclick = function(){
        	Box.close();
        	if(typeof no=='function'){
        		no.call(this);
        	}
        };
    },
    leaveMessage:function(){
        Box.beforeBox();
        var oldElem = document.getElementsByClassName("layer")[0];
        var newElem = oldElem?oldElem.parentNode:document.createElement("div");

        newElem.innerHTML = box5;
        body.insertBefore(newElem,article);
        var world = document.getElementById('myMessage');
        var closeId = document.getElementById("close");
        var sureId = document.getElementById("sure");
        sureId.onclick=function(){
            Box.close();
            //alert(world.value);
            var leave_message=document.getElementById('leave-message');
            var a=document.createElement('a');
            var span=document.createElement('span');
            var br=document.createElement('br');
            a.innerHTML='杜莎莎';
            span.innerHTML=' : '+world.value;
            leave_message.appendChild(a);
            leave_message.appendChild(span);
            leave_message.appendChild(br);
        };
        closeId.onclick = function(){
            Box.close();
        };
    },
    close:function(){
    	Box.refreshIndex = 0;
    	Box.refreshEnable = false;
    	var layers = document.getElementsByClassName("layer");
    	if(layers&&layers.length>0){
    		var layer = layers[0];
    		layer.style.display = "none";
    	}
    },
    prompt:function(str,yes,no){
    	Box.beforeBox();
		var oldElem = document.getElementsByClassName("layer")[0];
        var newElem = oldElem?oldElem.parentNode:document.createElement("div");
        var newText = document.createTextNode(str);

        newElem.innerHTML = box3;
        body.insertBefore(newElem,article);
        var p = newElem.getElementsByTagName("p")[0];
        p.appendChild(newText);
        var closeId = document.getElementById("close");
        var sureId = document.getElementById("sure");
        closeId.onclick = function(){
            Box.close();
            if(typeof yes =='function'){
                yes.call(this);
            }
        };
        sureId.onclick = function(){
        	Box.close();
            location.href=contextPath+"/pub/login";
        };
	},
    replyMessage:function(questionId,syeReplyUserId,syeQuestionReplyId){ 
//    	alert(questionId+","+syeReplyUserId+","+syeQuestionReplyId);
    	var box6 = '<div class="layer"><div class="criticism"><div class="criticism-right"><div class="my-criticism"><textarea id="myMessage"></textarea></div></div><div class="bottom"><span id="sure" class="yes">确认</span><span id="close" class="no">取消</span></div></div></div>';
        Box.beforeBox();
        var oldElem = document.getElementsByClassName("layer")[0];
        var newElem = oldElem?oldElem.parentNode:document.createElement("div");
        var syeReplyUserName="";
        var standbyThree="";
        newElem.innerHTML = box6;
        body.insertBefore(newElem,article);        
        var closeId = document.getElementById("close");
        var sureId = document.getElementById("sure");
        var syeReplyContent=null;
        sureId.onclick=function(){
        	var syeReplyContentTemp = document.getElementById('myMessage').value;
        	$.ajax({
        		url:"addSyeQuestionReply",
        		data:{"questionId":questionId,"syeReplyUserId":syeReplyUserId,"syeReplyContent":syeReplyContentTemp,"syeQuestionReplyId":syeQuestionReplyId},
                type:"post",
                dataType:"json",
                success:function(data){
                	syeReplyUserName=data.questionReply.user.nickName;
                	syeReplyContent=data.questionReply.syeReplyContent;
                	standbyThree=data.questionReply.standbyThree; 
                    Box.close();                  
                    var leave_message= $('#'+questionId);     
                    $('#'+questionId).show();
                    
                    /*leave_message.style.display = "block";*//*有评论显示*/
                    var a=document.createElement('a');   
                    var span=document.createElement('span');
                    var span1=document.createElement('span');
                    var a1=document.createElement('a');
                    var br=document.createElement('br');                    
                    a.innerHTML=syeReplyUserName;  
                    if(standbyThree !="" && standbyThree != null){
                    	span1.innerHTML=' 回复 ';
                    	standbyThree=standbyThree+' : '
                    	a1.innerHTML=standbyThree;
                    }else{                  	
                    	span1.innerHTML=' 回复 : ';
                    }                
                    span.innerHTML=syeReplyContent; 
                    leave_message.append(a); 
                    leave_message.append(span1);
                    leave_message.append(a1);
                    leave_message.append(span);
                    leave_message.append(br);
                },
                error:function(){                
                }
            });
        };
        closeId.onclick = function(){
            Box.close();
        };
    },
};