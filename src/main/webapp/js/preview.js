/**
 * 
 */
window.onload = function() {
		var result = document.getElementById("result");
		var input = document.getElementById("img_file");
		if (typeof FileReader === 'undefined') {
			result.innerHTML = "抱歉，你的浏览器不支持 FileReader";
			input.setAttribute('disabled', 'disabled');
		} else {
			input.addEventListener('change', readFile, false);
		}
	}

	function readFile() {
		var file = this.files[0];
		if (!/image\/\w+/.test(file.type)) {
			alert("文件必须为图片！");
			return false;
		}
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
			//result.innerHTML = '<img id="testImage" value="waho" style="height:32px;width:36px" src="'+this.result+'" alt=""/>' 
			//<div id="result"></div>
			var preview = document.getElementById("preview");
			if(preview){
				preview.setAttribute("src", this.result);
				preview.style.display = 'inline-block';
				document.getElementById("img_name").innerHTML="点击更改照片";	
			}
		};
	}
