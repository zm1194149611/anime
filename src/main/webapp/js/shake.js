var Shake ={
	SHAKE_THRESHOLD:2000,
	last_update:0,
	last_x:0,
	last_y:0,
	last_z:0,
	shaked:false,
	init:function () {
	    if (window.DeviceMotionEvent) {
	        window.addEventListener('devicemotion', Shake.deviceMotionHandler, false);
	    } else {
	        alert('not support mobile event');
	    }
	},
	deviceMotionHandler:function(eventData) {
		Shake.shake(eventData);
	},
	shake:function(eventData){
		var acceleration = eventData.accelerationIncludingGravity;
	    var curTime = new Date().getTime();
	    if ((curTime - Shake.last_update) > 100) {
	        var diffTime = curTime - Shake.last_update;
	        Shake.last_update = curTime;
	        var x = acceleration.x;
	        var y = acceleration.y;
	        var z = acceleration.z;
	        var speed = Math.abs(x + y + z - Shake.last_x - Shake.last_y - Shake.last_z) / diffTime * 10000;
	        if (speed > Shake.SHAKE_THRESHOLD && !Shake.shaked) {
	        	Shake.beforeAct();
	        	Shake.shakeAct();
	        	Shake.afterAct();
	        }
	        Shake.last_x = x;
	        Shake.last_y = y;
	        Shake.last_z = z;
	    }
	},
	beforeAct:function(){
    	Shake.shaked = true;
	},
	shakeAct:function(){
		App.confirm("已触发摇一摇1999，但尚未实现具体摇一摇操作",function(){
	    	Shake.shaked = false;
		},function(){
	    	Shake.shaked = false;
		});
	},
	afterAct:function(){
		Shake.shaked = false;
	}
};