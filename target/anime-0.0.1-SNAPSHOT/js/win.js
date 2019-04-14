/**
 * Created by Administrator on 2015/12/17 0017.
 */

var user ={'id':null,'nickName':null};
var present ={'id':null,'name':null};
function nameGame(){
    var nameBox = document.getElementById(IdBox);
    var lis = nameBox.getElementsByTagName("li");
    var newLi = lis[0];
    nameBox.removeChild(lis[0]);
    nameBox.appendChild(newLi);
    nameS = setTimeout(nameGame,50);
}
var boxStatus = '';
function layer(){
    var layer = document.getElementsByClassName("layer")[0];
    layer.style.display = "block";
    var textBox = document.getElementsByClassName("textBox")[0];
    var imgBox = document.getElementsByClassName("imgBox")[0];
    var game = document.getElementById("game");
    var goodsOk = document.getElementById("goodsOk");
    var goodsNo = document.getElementById("goodsNo");
    var nameBox = document.getElementById("nameBox");
    var nameBtn = document.getElementById("nameBtn");
    var goodsBtn = document.getElementById("goodBtn");
    var goodsBox = document.getElementById("goodsBox");
    var alertBox = document.getElementById("alertBox");
    var notHaveGoogs = document.getElementById("notHaveGoogs");
    if(!user){
    	textBox.style.display = "none"; 
    	imgBox.style.display = "none"; 
        alertBox.style.display = "block"; 
        notHaveGoogs.onclick = function(){
            layer.style.display = "none";
        };
        nameBtn.innerHTML = "开始抽奖";
        return;
    }
    
    if(boxStatus == "name"){
        imgBox.style.display = "none";
        textBox.style.display = "block";
        goodsOk.onclick = function(){
            layer.style.display = "none";
            nameBox.style.display = "none";
            nameBtn.style.display = "none";
            goodsBtn.style.display = "block";
            goodsBox.style.display = "block";
            document.getElementById("curr").innerHTML="抽取礼品";
  
            
        };
        goodsNo.onclick = function(){
            layer.style.display = "none";
        };
    }else if(boxStatus == "goods"){
        textBox.style.display = "none";
        imgBox.style.display = "block";
        game.onclick = function(){
            layer.style.display = "none";
            nameBtn.style.display = "block";
            nameBox.style.display = "block";
            goodsBtn.style.display = "none";
            goodsBox.style.display = "none";
            document.getElementById("curr").innerHTML="抽取幸运观众";
        };
    }
}

window.onload = function(){
    var nameBox = document.getElementById("nameBox");
    var goodsBtn = document.getElementById("goodBtn");
    var goodsBox = document.getElementById("goodsBox");
    var nameBtn = document.getElementById("nameBtn");

    nameBtn.onclick = function(){
        IdBox = "nameBox";
        var text = nameBtn.innerHTML;
        if(text == "开始抽奖"){
        	getWinInfo();
            nameBtn.innerHTML = "结束";
            var nameBox = document.getElementById("nameBox");
            //var lis = nameBox.getElementsByTagName("li");
            //nameBox.removeChild(lis[1]);
            nameGame();
        }else if(text == "结束"){
            nameBtn.innerHTML = "开始抽奖";
            clearTimeout(nameS);
            var nameBox = document.getElementById("nameBox");
            var lis = nameBox.getElementsByTagName("li");
            var winUser = $("#"+user.id);
            if(winUser){
            	winUser.remove();
            }
            var newNode = document.createElement("li");
            newNode.id = user.id;//added by lynn to fix bug: duplicate gifts in box;
            newNode.innerHTML = ""+user.nickName;
            nameBox.insertBefore(newNode,lis[1]);
            boxStatus = "name";
            setTimeout(layer,1000);
        }
    };

    goodsBtn.onclick = function(){
        IdBox = "goodsBox";
        var text = goodsBtn.innerHTML;
        if(text == "开始抽奖"){
            goodsBtn.innerHTML = "结束";
            nameGame();
        }else if(text == "结束"){
            goodsBtn.innerHTML = "开始抽奖";
            clearTimeout(nameS);
            
            var goodsBox = document.getElementById("goodsBox");
            var lis = goodsBox.getElementsByTagName("li");
            var winPresent = $("#"+present.id);
            if(winPresent){
            	winPresent.remove();
            }
            var newNode = document.createElement("li");
            newNode.id = present.id;//added by lynn to fix bug: duplicate gifts in box;
            newNode.innerHTML = ""+present.name;
            goodsBox.insertBefore(newNode,lis[1]);
            
            boxStatus = "goods";
            setTimeout(layer,1000);
        }
    }
};


function getWinInfo(){
	$jyb.show();
	$.ajax({
		url : "getWinInfo",
		data : null,
		type : 'get',
		cache : false,
		dataType : 'json',
		asyn:false,
		timeout:10000,
		success : function(data) {
			if(data.result){
				$("#nickName").text(data.result.nickName);
				var headImg = data.result.headimgurl;
				if(!headImg){
					headImg = contextPath_js+'/image/user_default.jpg';
				}
				$("#headimgurl").attr("src",headImg);
				$("#msg").text(data.result.msg);
				$("#pimg").attr("src",contextPath_js+'/pics/'+data.result.pimg);
				$("#pName").text(data.result.pName);
				user.id = data.result.id;
				user.nickName = data.result.nickName;
				present.id = data.result.presentId;
				present.name = data.result.pName;
			}else{
				clearTimeout(nameS);
				user=null;
				present = null;
				setTimeout(layer,10);
			}
			setTimeout('$jyb.hide()',2000);
		},
		error : function() {
			$jyb.hide(1000);
			alert("网络不畅，请稍后重试！");
		}
	});
}

