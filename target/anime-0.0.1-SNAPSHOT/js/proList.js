/**
 * Created by Administrator on 2015/12/8 0008.
 */
var SelectionCondition={
		init:function(){
			SelectionCondition.selectedCard();//选择器
			SelectionCondition.banner();//banner
		},
		imgChange:function(){
			var picBox = document.getElementsByClassName("picBox")[0];
		    var picIndex = document.getElementById("picIndex");
		    var lis = picBox.getElementsByTagName("li");
		    var spanS = picIndex.getElementsByTagName("span");
		    //第一个li变为最后一个
	        var lastLi = lis[0];
	        picBox.removeChild(lis[0]);
	        picBox.appendChild(lastLi);
	        //新的第一个li，把left设为0，取他的index
	        var firstLi = lis[0];
	        firstLi.style.left = "0px";
	        var index = firstLi.index;
	        //将span全部设为未选中，将第index个span设为选中；
	        for(var i=0;i<spanS.length;i++){
	            spanS[i].className = "";
	        }
	        spanS[index].className = "selectedSpan";
		},
		banner:function(){
			var picBox = document.getElementById("picBox");
		    var picIndex = document.getElementById("picIndex");
		    var Lis = picBox.getElementsByTagName("li");
		    for(var i=0;i<Lis.length;i++){
		        var span = document.createElement("span");
		        Lis[i].index = i;
		        picIndex.appendChild(span);
		    }
		    var spanS = picIndex.getElementsByTagName("span");
		    spanS[0].className = "selectedSpan";
		    setInterval(SelectionCondition.imgChange,3000);
		},
		arrowsClose:function(){
			var titleNum = document.getElementsByClassName("title");
		    for(var j=0;j<titleNum.length;j++){
		        var spanA = titleNum[j].getElementsByTagName("span")[0];
		        if(!spanA)continue;
		        spanA.style.borderBottom = "0" ;
		        spanA.style.borderTop = "6px solid #e0485e" ;
		    }
		},
		cardClose:function(){
			var choose = document.getElementsByClassName("choose")[0];
		    if(!choose)return false;
		    var ulS = choose.getElementsByTagName("ul");
		    for(var p=0;p<ulS.length;p++){
		        ulS[p].style.display = "none";
		    }
		},
		listSonBind:function(listElem,name){
			var liS = listElem.getElementsByTagName("li");
		    var selectedP = document.getElementsByClassName("selectedP")[0];
		    for(var i=0;i<liS.length;i++){
		    	liS[i].onclick = function(){
		            var value = this.getElementsByTagName("span")[0].innerHTML;//选择的结果
		            selectedP.style.display = "block";
		            selectedP.innerHTML = "筛选条件：";
		            var span = document.createElement("span");
		            var text = document.createTextNode(value);
		            span.appendChild(text);
		            selectedP.appendChild(span);
		            SelectionCondition.arrowsClose();
		            SelectionCondition.cardClose();
		            SelectionCondition.conditionSelected(name,this.getElementsByTagName("div")[0].innerHTML);
		        };
		    }
		},
		selectedCard:function(){
			var titleS = document.getElementsByClassName("title");
		    var selectedP = document.getElementsByClassName("selectedP")[0];
		    titleS[0].onclick = function(){
		        selectedP.style.display = "none";
		        SelectionCondition.cardClose();
		        SelectionCondition.arrowsClose();
		    };
		    for(var i=1;i<titleS.length;i++){
		        titleS[i].onclick = function(){
		            //选项卡消失/出现
		            var Id = this.id + "List";
		            var list = document.getElementById(Id);
		            var view = list.style.display;
		            if(view == "none"){
		            	SelectionCondition.cardClose();
		                list.style.display = "block";
		                //改变箭头方向
		                SelectionCondition.arrowsClose();
		                var span = this.getElementsByTagName("span")[0];
		                span.style.borderBottom = "6px solid #e0485e" ;
		                span.style.borderTop = "0" ;
		                SelectionCondition.listSonBind(list,this.id);
		            }else{
		            	SelectionCondition.arrowsClose();
		                list.style.display = "none";
		            }
		        }
		    }
		},
};
