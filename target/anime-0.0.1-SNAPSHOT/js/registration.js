window.onload = function() {
	changeHeight();
	var startTime = document.getElementById('startTime');
	var endTime = document.getElementById('endTime');
	var totalTime = document.getElementById('totalTime');
	// 签到方法
	$("#registration").click(function() {
		$.ajax({
			type : "POST",
			url : contextPath + '/user/signed',
			data : {
				userId : $("#userId").val()
			},
			dataType : "json",
			success : function(data) {
				if (data.success) {
					startTime.style.display = "block";
					endTime.style.display = "none";
					totalTime.style.display = "none";
					$("#sp1").html(data.signTime);
					message('签到成功');
				}
			},
			error : function(data) {

			}
		})
	});
	// 签退方法
	$("#singOut").click(function() {

		$.ajax({
			type : "POST",
			url : contextPath + '/user/signOut',
			data : {
				openId : $("#openId").val(),
				userId : $("#userId").val()
			},
			dataType : "json",
			success : function(data) {
				if (data.success) {
					startTime.style.display = "block";
					endTime.style.display = "block";
					totalTime.style.display = "block";
					$("#sp1").html(data.signTime);
					$("#sp2").html(data.signOut);
					$("#sp3").html(data.lengthOfService + "小时");
					message('签退成功');
				}
			},
			error : function(data) {

			}
		})
	})

}
function message(text) {
	Box.alert(text, closeWindow);
}
// 关闭当前页面并调用微信二维码扫一扫
function closeWindow() {
	wx.config(wxConfig);
	wx.ready(function() {
		wx.closeWindow();
		wx.scanQRCode({
			desc : 'scanQRCode desc',
			needResult : 0, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
			scanType : [ "qrCode", "barCode" ], // 可以指定扫二维码还是一维码，默认二者都有
			success : function(res) {
				var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
			}
		})
		// })
	})
}
function changeHeight() {
	var real = 0;
	var me = document.getElementById('me');
	real = me.width || me.style.width || me.offsetWidth;
	me.height = real;
}
