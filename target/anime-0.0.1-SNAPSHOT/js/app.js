var App = {
	utils:{
		isEmpty:function(str){
			return str==null||''==str.replace(/(^\s*)|(\s*$)/g,'');
		},
		dateFormat:function(date,fmt){ 
		  var o = { 
		    "M+" : date.getMonth()+1,                 //月份 
		    "d+" : date.getDate(),                    //日 
		    "h+" : date.getHours(),                   //小时 
		    "m+" : date.getMinutes(),                 //分 
		    "s+" : date.getSeconds(),                 //秒 
		    "q+" : Math.floor((date.getMonth()+3)/3), //季度 
		    "S"  : date.getMilliseconds()             //毫秒 
		  }; 
		  if(/(y+)/.test(fmt)) 
		    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length)); 
		  for(var k in o) 
		    if(new RegExp("("+ k +")").test(fmt)) 
		  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
		  return fmt; 
		},
		timeFormat:function(timeMills,fmt){ 
		  if(isNaN(timeMills)){
			  return '--';
		  }
		  var date = new Date(timeMills);
		  var o = { 
		    "M+" : date.getMonth()+1,                 //月份 
		    "d+" : date.getDate(),                    //日 
		    "h+" : date.getHours(),                   //小时 
		    "m+" : date.getMinutes(),                 //分 
		    "s+" : date.getSeconds(),                 //秒 
		    "q+" : Math.floor((date.getMonth()+3)/3), //季度 
		    "S"  : date.getMilliseconds()             //毫秒 
		  }; 
		  if(/(y+)/.test(fmt)) 
		    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length)); 
		  for(var k in o) 
		    if(new RegExp("("+ k +")").test(fmt)) 
		  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
		  return fmt; 
		}
	},
	msg:function(msg){
		alert(msg);
	},
	confirm:function(msg,yes,no){
		if(confirm(msg)){
			yes.call(this);
		}else{
			no.call(this);
		}
	},
	prompt:function(title,defaultVal){
		window.prompt(title,defaultVal);
	},
	goTo:function(href){
		location.href = href;
	},
	data:{
		wechat:{}
	},
	/**判断页面是否已滑动到底部
	 * @returns 1.true:到达底部 2.false:未到达底部
	 */
	windowReachBottom:function(){
        var scrollTop = 0,
            clientHeight = 0,
            scrollHeight = 0;
        if (document.documentElement && document.documentElement.scrollTop) {
            scrollTop = document.documentElement.scrollTop;
        } else if (document.body) {
            scrollTop = document.body.scrollTop;
        }
        if (document.body.clientHeight && document.documentElement.clientHeight) {
            clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight;
        } else {
            clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight;
        }
        scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
        return (scrollTop + clientHeight == scrollHeight);
	},
	windowReachTop:function(){
		var scrollTop = 0;
	    if (document.documentElement && document.documentElement.scrollTop) {
	        scrollTop = document.documentElement.scrollTop;
	    } else if (document.body) {
	        scrollTop = document.body.scrollTop;
	    }
	    return scrollTop ==0;
	}
};