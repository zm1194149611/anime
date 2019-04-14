var upFileList = {};
function showImageDetail(){
    var input_projPic = document.getElementById("projPic");
    if (typeof FileReader === 'undefined') {
        alert("对不起，您的浏览器不支持长传图片！！");
    } else {
        input_projPic.addEventListener('change', readFile2, false);
    }
}
function readFile2() {
    var file = this.files[0];
    if(!file){
        return;
    }
    var pex = this.getAttribute("id");
    if (!/image\/\w+/.test(file.type)) {
        alert("请选择图片进行上传！")
        return false;
    }
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(e) {
        var thisVar = document.getElementById(pex);
        var numbers = thisVar.getAttribute("title");
        var im_3 = document.getElementById("preview_"+pex+"_"+numbers);
        var fileUpKey =  upFileList[pex];
        if(!fileUpKey){
            fileUpKey = {};
            upFileList[pex] = 	fileUpKey;
        }
        fileUpKey.uping = numbers;
        fileUpKey[numbers] = '';
        im_3.setAttribute("src",this.result);
        im_3.setAttribute("style","");
        thisVar.setAttribute("title",parseInt(numbers)+1);
    }
}
function fileClick(fileId){
    var thisVar = document.getElementById(fileId);
    var numbers = thisVar.getAttribute("title");
    if(numbers >= 3){
        alert("您已经选择了3张图片！");
        return;
    }
    thisVar.click();
}
function changeImg(fileId,id) {
    var inputFile = document.getElementById(fileId);
    var numbers = inputFile.getAttribute("title");
    var currentImg = document.getElementById("preview_" + fileId + "_" + id);
    if (id == '2') {
        currentImg.setAttribute("src", "");
        currentImg.setAttribute("style", "display:none;");
        var fileUpKey = upFileList[fileId];
        if (fileUpKey) {
            delete fileUpKey[id];
        }
    } else if (id == '1' || id == '0') {
        var nexImg = document.getElementById("preview_" + fileId + "_" + (parseInt(id) + 1));
        var fileUpKey = upFileList[fileId];
        var curKey = '';
        if (nexImg.getAttribute("src") != "") {
            if (fileUpKey) {
                curKey = fileUpKey[id];
            }
            if (id == '0') {
                var nex2Img = document.getElementById("preview_" + fileId + "_" + (parseInt(id) + 2));
                if (nex2Img.getAttribute("src") != "") {
                    currentImg.setAttribute("src", nexImg.getAttribute("src"));
                    nexImg.setAttribute("src", nex2Img.getAttribute("src"));
                    nex2Img.setAttribute("src", "");
                    nex2Img.setAttribute("style", "display:none;");
                    if (fileUpKey) {
                        curKey = fileUpKey[id];
                        var prev1 = fileUpKey['1'];
                        var prev2 = fileUpKey['2'];
                        fileUpKey['0'] = prev1;
                        fileUpKey['1'] = prev2;
                        delete fileUpKey['2'];
                    }
                } else {
                    currentImg.setAttribute("src", nexImg.getAttribute("src"));
                    nexImg.setAttribute("src", "");
                    nexImg.setAttribute("style", "display:none;");
                    if (fileUpKey) {
                        curKey = fileUpKey[id];
                        var prev1 = fileUpKey['1'];
                        fileUpKey['0'] = prev1;
                        delete fileUpKey['1'];
                    }
                }
            } else {
                currentImg.setAttribute("src", nexImg.getAttribute("src"));
                nexImg.setAttribute("src", "");
                nexImg.setAttribute("style", "display:none;");
                if (fileUpKey) {
                    curKey = fileUpKey[id];
                    var prev1 = fileUpKey['2'];
                    fileUpKey['1'] = prev1;
                    delete fileUpKey['2'];
                }
            }
        } else {
            currentImg.setAttribute("src", "");
            currentImg.setAttribute("style", "display:none;");
            if (fileUpKey) {
                delete fileUpKey[id];
            }
        }
    }
    inputFile.title = numbers-1;
}