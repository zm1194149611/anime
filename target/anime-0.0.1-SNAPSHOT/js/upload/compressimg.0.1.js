
var Compress = {
	isCanvasSupported: function(){
	    var elem = document.createElement('canvas');
	    return !!(elem.getContext && elem.getContext('2d'));
	},
	isNeedCompress:function(event){
		var need = true;
		if(event.currentTarget&&event.currentTarget.files
				&&event.currentTarget.files.length>0){
			var file = event.currentTarget.files[0];
			if(file.size<102400){
				//图片小于100k，不需要压缩
				need = false;
			}
		}
		return need;
	},
	compress: function compress(event, callback, params){
		if(!Compress.isCanvasSupported()){
			if(typeof params == 'function'){
				params.call(this);
			}
			return;
		}
	    var file = event.currentTarget.files[0];
	    var reader = new FileReader();
	    console.log(event);
	    reader.onload = function (e) {
	        var image = $('<img/>');
	        image[0].onload = function () {
	             var square = 700;
	             var canvas = document.createElement('canvas');
	             var context = canvas.getContext('2d');
	             var imageWidth;
	             var imageHeight;
	             var offsetX = 0;
	             var offsetY = 0;
	            if (this.width < this.height) {
	                  imageWidth = Math.round(square * this.width / this.height);
	                  imageHeight = square;
	                  //offsetX = - Math.round((imageWidth - square) / 2);
	           } else {
	                 imageHeight = Math.round(square * this.height / this.width);
	                 imageWidth = square; 
	                 //offsetY = - Math.round((imageHeight - square) / 2); 
	           }
	            canvas.width = imageWidth;
	            canvas.height = imageHeight;
	            context.clearRect(0, 0, imageWidth, imageHeight);
	            context.drawImage(this, offsetX, offsetY, imageWidth, imageHeight);
	            var data = canvas.toDataURL('image/jpeg');
	            callback(data,params);
	         };
	          image.attr('src', e.target.result);
	       };
	     reader.readAsDataURL(file);
	}	
};

