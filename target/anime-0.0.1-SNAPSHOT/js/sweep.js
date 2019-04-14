var Sweep = {
		sweep:function(){
			wx.scanQRCode({
			    needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
			    scanType: ["qrCode"], // 可以指定扫二维码还是一维码，默认二者都有
			    success: function (res) {
			    	Sweep.resultAct(res.resultStr); // 当needResult 为 1 时，扫码返回的结果
			    }
			});
		},
		resultAct:function(result){
			if(Sweep.utils.checkIsURL(result)){
				App.goTo(result);
			}else{
				App.msg(result);
			}
		},
		utils:{
			checkIsURL:function(result){
				return result&&result.indexOf&&result.indexOf("http://");
			}
		}
};