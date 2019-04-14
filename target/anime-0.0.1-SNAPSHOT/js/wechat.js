var Wechat = {
	initParam:{},
	initAndCheck:function(){
		Wechat.initParam.jsApiList = App.data.wechat.apis;
		wx.config(Wechat.initParam);
		wx.ready(Wechat.check);
	},
	check:function(){
		wx.checkJsApi({
			jsApiList: App.data.wechat.apis, // 需要检测的JS接口列表，所有JS接口列表见附录2,
		    success: function(res) {
		    	for(api in res.checkResult){
		    		if(!res.checkResult[api]){
		    			var apiName = App.data.wechat.API_NAMEs?App.data.wechat.API_NAMEs[api]:api;
		    			App.msg("当前安装的微信版本不支持"+apiName+"功能");
		    		}
		    	}
		    }
		});
	}
};