<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/bg/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/bg/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
<title>新增孵化园</title>
</head>
<body>
<div class="pd-20">
	<form  method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>孵化园名称：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:180px;" onblur="ipnameCheck(this);" placeholder="" id="" name="softName">
			</div>
		</div>
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>孵化园地址：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:250px;" onblur="ipaddressCheck(this);" placeholder="" id="" name="softParkAddress">
			</div>
		</div>
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>园区性质：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:250px;"  placeholder="" id="" name="softParkCharacter">
			</div>
		</div>
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>工位总量：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:50px;" value="" placeholder="" id="" name="totalCount">&nbsp;个
			</div>
		</div>
		
		
		<div  class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>工位单价：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:50px;" value="" placeholder="" id="" name="stationPrice">&nbsp;元
			</div>
		</div>
		
		
		<div id = "industry" class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>所属行业：</span>
			<c:forEach var="industryName" items="${industryNameList}">
				<span class="">
			<input type="checkbox" value="${industryName}" onclick="industryCheck(this);" name="industryList" id="user-Character-1-0-0">
				${industryName}
			</span>
			&nbsp;
			</c:forEach>
			
		</div>
		
		<div id="service" class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>提供服务：</span>
			<c:forEach var="serviceName" items="${serviceNameList}">
				<span class="">
			<input type="checkbox" value="${serviceName}" onclick="serviceCheck(this);" name="serviceList" id="user-Character-1-0-0">
				${serviceName}
			</span>
			&nbsp;
			</c:forEach>
		</div>
		
		<div class="form-label col-5 companyName" id="head-list"></div>
		<div class="row cl">
			<input type="hidden" name="companyName" />
			<span class="form-label col-2"><span class="c-red">*</span>入驻企业：</span>
				<div class="formControls col-10" id="head-input">
					<input class="input-text" style="width:250px;" id="head-rank" type="text" onblur="lostfocus('head-rank');"
						placeholder="请输入公司名称"> <span id="head-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
		<div class="form-label col-5 companyName" id="companyRequest-list"></div>
		<div class="row cl">
			<input type="hidden" name="projectRequire" />
			<span class="form-label col-2"><span class="c-red">*</span>入驻企业要求：</span>
				<div class="formControls col-10" id="request-input">
					<input class="input-text" style="width:250px;" id="companyRequest" type="text" onblur="lostfocus('head-rank');"
						placeholder="请输入驻企业要求"> <span id="companyRequest-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
		<div class="form-label col-5 companyName" id="goodPolicy-list"></div>
		<div class="row cl">
			<input type="hidden" name="privilegePolicy" />
			<span class="form-label col-2"><span class="c-red">*</span>优惠政策：</span>
				<div class="formControls col-10" id="head-input">
					<input class="input-text" style="width:250px;" id="goodPolicy" type="text" onblur="lostfocus('head-rank');"
						placeholder="请输入优惠政策"> <span id="goodPolicy-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
		<div class="form-label col-5 companyName" id="keySearch-list"></div>
		<div class="row cl">
			<input type="hidden" name="keySearch" />
			<span class="form-label col-2"><span class="c-red">*</span>关键字：</span>
				<div class="formControls col-10" id="head-input">
					<input class="input-text" style="width:250px;" id="keySearch" type="text" onblur="lostfocus('head-rank');"
						placeholder="请输入关键字"> <span id="keySearch-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>孵化园简介：</span>
			<div class="formControls col-10">
				<textarea name="softParkIntroduce" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<!-- <div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>封面预览：</span>
			<div class="formControls col-10">
				<div class="uploader-thum-container">
					<div id="fileList" class="uploader-list">
					
					</div>
					<div id="filePicker">选择图片</div>
					<button id="btn-star" class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>
				</div>
			</div>
		</div> -->
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>图片上传：</span>
			<div class="formControls col-10">
				<div class="uploader-list-container"> 
					<div class="queueList">
						<div id="dndArea" class="placeholder">
							<div id="filePicker-2"></div>
							<p>或将照片拖到这里，单次最多可选3张</p>
						</div>
					</div>
					<div class="statusBar" style="display:none;">
						<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
						<div class="info"></div>
						<div class="btns">
							<div id="filePicker2"></div>
							<div class="uploadBtn">开始上传</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 提交文件名称 -->
		<div id="fileNameHidden">
			
		</div>
	</form>
	<br/>
	<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onClick="submit();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
</div>

<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="${contextPath}/js/approve.js"></script> 
<script type="text/javascript">
var lock = false;
var ipnameold = "";
var ipaddressold = "";
/*验证表单信息*/
function check(){
	if($("input[name='softName']").val() == null || $("input[name='softName']").val() == ""){
		layer.msg('请输入孵化园名称!',{icon:2,time:2000});
		return false;
	}else if($("input[name='softParkAddress']").val() == null || $("input[name='softParkAddress']").val() == ""){
		layer.msg('请输入孵化园地址!',{icon:2,time:2000});
		return false;
	}else if($("input[name='softParkCharacter']").val() == null ||$("input[name='softParkCharacter']").val() == ""){
		layer.msg('请输入园区性质!',{icon:2,time:2000});
		return false;
	}else if($("input[name='companyName']").val() == null ||$("input[name='companyName']").val() == ""){
		layer.msg('请输入入驻公司!',{icon:2,time:2000});
		return false;
	}else if($("input[name='projectRequire']").val() == null ||$("input[name='projectRequire']").val() == ""){
		layer.msg('请输入入驻公司要求!',{icon:2,time:2000});
		return false;
	}else if($("input[name='privilegePolicy']").val() == null ||$("input[name='privilegePolicy']").val() == ""){
		layer.msg('请输入优惠政策!',{icon:2,time:2000});
		return false;
	}else if($("input[name='totalCount']").val() == "" || isNaN($("input[name='totalCount']").val())){
		layer.msg('工位总量必须为数字类型!',{icon:2,time:2000});
		return false;
	}else if($("input[name='stationPrice']").val() == "" || isNaN($("input[name='stationPrice']").val())){
		layer.msg('工位单价必须为数字类型!',{icon:2,time:2000});
		return false;
	}else if($("input[name='industryList']:checked").length < 1){
		layer.msg('请选择所属行业!',{icon:2,time:2000});
		return false;
	}else if($("input[name='serviceList']:checked").length < 1){
		layer.msg('请选择提供服务!',{icon:2,time:2000});
		return false;
	}else if($("textarea[name='softParkIntroduce']").val() == null || $("textarea[name='softParkIntroduce']").val() == ""){
		layer.msg('请输入孵化园简介!',{icon:2,time:2000});
		return false;
	}else if($("input[name='images']").attr("value") == null || $("input[name='images']").attr("value") == "undefined" || $("input[name='images']").attr("value") == ""){
		layer.msg('图片标示错误,请检查是否已经上传图片!',{icon:2,time:2000});
		return false;
	}
	return true;
}
function layer_close(){
	location.href="incubationpark-list?pageIndex=1";
}

function addList(){
	var companyName="";//入驻公司
	var projectRequire="";//入驻公司要求
	var privilegePolicy="";//优惠政策
	var keySearch="";//关键字
	var divList=$("#head-list div");
	for(var i=0;i<divList.length;i++){
		var name=divList[i].getElementsByTagName("p")[0].innerHTML+",";
		companyName +=name;
	}
	$("input[name='companyName']").val(companyName.substring(0,companyName.lastIndexOf(',')));
	
	var divList=$("#companyRequest-list div");
	for(var i=0;i<divList.length;i++){
		var name=(i+1)+"."+divList[i].getElementsByTagName("p")[0].innerHTML+",";
		projectRequire +=name;
	}
	$("input[name='projectRequire']").val(projectRequire.substring(0,projectRequire.lastIndexOf(',')));
	
	var divList=$("#goodPolicy-list div");
	for(var i=0;i<divList.length;i++){
		var name=(i+1)+"."+divList[i].getElementsByTagName("p")[0].innerHTML+",";
		privilegePolicy +=name;
	}
	$("input[name='privilegePolicy']").val(privilegePolicy.substring(0,privilegePolicy.lastIndexOf(',')));

	var divList=$("#keySearch-list div");
	for(var i=0;i<divList.length;i++){
		var name=divList[i].getElementsByTagName("p")[0].innerHTML+",";
		keySearch +=name;
	}
	$("input[name='keySearch']").val(keySearch.substring(0,keySearch.lastIndexOf(',')));
	
}
/*提交表单*/
function submit(){
	
	addList();
	
	if(lock){
		return;
	}
	//提交前验证
	if(!check()){
		return false;
	}
	
	
	lock = true;
	var url = "incubationpark-add";//$("#incubationpark-add").attr("action");
	var method = $("#form-article-add").attr("method");
	var data = $("#form-article-add").serialize();
	//alert(data);
	$.ajax({
		url:url,
		type:method,
		data:data,
		success:function(result){
			//alert('提交成功');
			layer.msg('提交成功!',{icon:1,time:1000});
			//location.href = result;
			setTimeout('gotoResult()',1000);
		},
		error:function(result){
			layer.msg("系统错误",{icon:2,time:1000});
		}
	});
	
	
}
/*跳转*/
function gotoResult(){
	location.href="incubationpark-list?pageIndex=1";
}

$(function(){
	addHead('head-rank','head-bottom','head-list');
	addHead('companyRequest','companyRequest-bottom','companyRequest-list');
	addHead('goodPolicy','goodPolicy-bottom','goodPolicy-list');
	addHead('keySearch','keySearch-bottom','keySearch-list');
	
	var boxes = document.getElementById('industry').getElementsByTagName("checkbox");
	console.info(boxes)
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: '../lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: 'uploadImages',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		 pick: {
             id: '#filePicker',
             label: '点击选择图片'
         },
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		fileNumLimit: 3,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
		
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });

});

(function( $ ){
    // 当domReady的时候开始初始化
    $(function() {
        var $wrap = $('.uploader-list-container'),

            // 图片容器
            $queue = $( '<ul class="filelist"></ul>' )
                .appendTo( $wrap.find( '.queueList' ) ),

            // 状态栏，包括进度和控制按钮
            $statusBar = $wrap.find( '.statusBar' ),

            // 文件总体选择信息。
            $info = $statusBar.find( '.info' ),

            // 上传按钮
            $upload = $wrap.find( '.uploadBtn' ),

            // 没选择文件之前的内容。
            $placeHolder = $wrap.find( '.placeholder' ),

            $progress = $statusBar.find( '.progress' ).hide(),

            // 添加的文件数量
            fileCount = 0,

            // 添加的文件总大小
            fileSize = 0,

            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,

            // 缩略图大小
            thumbnailWidth = 110 * ratio,
            thumbnailHeight = 110 * ratio,

            // 可能有pedding, ready, uploading, confirm, done.
            state = 'pedding',

            // 所有文件的进度信息，key为file id
            percentages = {},
            // 判断浏览器是否支持图片的base64
            isSupportBase64 = ( function() {
                var data = new Image();
                var support = true;
                data.onload = data.onerror = function() {
                    if( this.width != 1 || this.height != 1 ) {
                        support = false;
                    }
                }
                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                return support;
            } )(),

            // 检测是否已经安装flash，检测flash的版本
            flashVersion = ( function() {
                var version;

                try {
                    version = navigator.plugins[ 'Shockwave Flash' ];
                    version = version.description;
                } catch ( ex ) {
                    try {
                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                .GetVariable('$version');
                    } catch ( ex2 ) {
                        version = '0.0';
                    }
                }
                version = version.match( /\d+/g );
                return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
            } )(),

            supportTransition = (function(){
                var s = document.createElement('p').style,
                    r = 'transition' in s ||
                            'WebkitTransition' in s ||
                            'MozTransition' in s ||
                            'msTransition' in s ||
                            'OTransition' in s;
                s = null;
                return r;
            })(),

            // WebUploader实例
            uploader;

        if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {

            // flash 安装了但是版本过低。
            if (flashVersion) {
                (function(container) {
                    window['expressinstallcallback'] = function( state ) {
                        switch(state) {
                            case 'Download.Cancelled':
                                alert('您取消了更新！')
                                break;

                            case 'Download.Failed':
                                alert('安装失败')
                                break;

                            default:
                                alert('安装已成功，请刷新！');
                                break;
                        }
                        delete window['expressinstallcallback'];
                    };

                    var swf = 'expressInstall.swf';
                    // insert flash object
                    var html = '<object type="application/' +
                            'x-shockwave-flash" data="' +  swf + '" ';

                    if (WebUploader.browser.ie) {
                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                    }

                    html += 'width="100%" height="100%" style="outline:0">'  +
                        '<param name="movie" value="' + swf + '" />' +
                        '<param name="wmode" value="transparent" />' +
                        '<param name="allowscriptaccess" value="always" />' +
                    '</object>';

                    container.html(html);

                })($wrap);

            // 压根就没有安转。
            } else {
                $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
            }

            return;
        } else if (!WebUploader.Uploader.support()) {
            alert( 'Web Uploader 不支持您的浏览器！');
            return;
        }
        
     

        // 实例化
        uploader = WebUploader.create({
            pick: {
                id: '#filePicker-2',
                label: '点击选择图片'
            },
            formData: {
                uid: 123
            },
            fileNumLimit:3,
            dnd: '#dndArea',
            paste: '#uploader',
            swf: '../lib/webuploader/0.1.5/Uploader.swf',
            chunked: false,
            chunkSize: 512 * 1024,
            server: 'uploadImages',
            // runtimeOrder: 'flash',

            // accept: {
            //     title: 'Images',
            //     extensions: 'gif,jpg,jpeg,bmp,png',
            //     mimeTypes: 'image/*'
            // },

            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
            disableGlobalDnd: true,
            fileNumLimit: 3,
            fileSizeLimit: 200 * 1024 * 1024,    // 200 M
            fileSingleSizeLimit: 50 * 1024 * 1024    // 50 M
        });

        // 拖拽时不接受 js, txt 文件。
        uploader.on( 'dndAccept', function( items ) {
            var denied = false,
                len = items.length,
                i = 0,
                // 修改js类型
                unAllowed = 'text/plain;application/javascript ';

            for ( ; i < len; i++ ) {
                // 如果在列表里面
                if ( ~unAllowed.indexOf( items[ i ].type ) ) {
                    denied = true;
                    break;
                }
            }

            return !denied;
        });

        uploader.on('dialogOpen', function() {
            console.log('here');
        });

        // uploader.on('filesQueued', function() {
        //     uploader.sort(function( a, b ) {
        //         if ( a.name < b.name )
        //           return -1;
        //         if ( a.name > b.name )
        //           return 1;
        //         return 0;
        //     });
        // });

        // 添加“添加文件”的按钮，
        uploader.addButton({
            id: '#filePicker2',
            label: '继续添加'
        });
  
        uploader.on('ready', function() {
            window.uploader = uploader;
        });
        uploader.on('uploadSuccess',function(file,json){
        	var newInput;
        	newInput = '<input type="hidden" name="images" value="'+json.result+'"/>';
        	$("#fileNameHidden").append(newInput);
        });
        // 当有文件添加进来时执行，负责view的创建
        function addFile( file ) {
            var $li = $( '<li id="' + file.id + '">' +
                    '<p class="title">' + file.name + '</p>' +
                    '<p class="imgWrap"></p>'+
                    '<p class="progress"><span></span></p>' +
                    '</li>' ),

                $btns = $('<div class="file-panel">' +
                    '<span class="cancel">删除</span>' +
                    '<span class="rotateRight">向右旋转</span>' +
                    '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
                $prgress = $li.find('p.progress span'),
                $wrap = $li.find( 'p.imgWrap' ),
                $info = $('<p class="error"></p>'),

                showError = function( code ) {
                    switch( code ) {
                        case 'exceed_size':
                            text = '文件大小超出';
                            break;

                        case 'interrupt':
                            text = '上传暂停';
                            break;

                        default:
                            text = '上传失败，请重试';
                            break;
                    }

                    $info.text( text ).appendTo( $li );
                };

            if ( file.getStatus() === 'invalid' ) {
                showError( file.statusText );
            } else {
                // @todo lazyload
                $wrap.text( '预览中' );
                uploader.makeThumb( file, function( error, src ) {
                    var img;

                    if ( error ) {
                        $wrap.text( '不能预览' );
                        return;
                    }

                    if( isSupportBase64 ) {
                        img = $('<img src="'+src+'">');
                        $wrap.empty().append( img );
                    } else {
                        $.ajax('../lib/webuploader/0.1.5/server/preview.php', {
                            method: 'POST',
                            data: src,
                            dataType:'json'
                        }).done(function( response ) {
                            if (response.result) {
                                img = $('<img src="'+response.result+'">');
                                $wrap.empty().append( img );
                            } else {
                                $wrap.text("预览出错");
                            }
                        });
                    }
                }, thumbnailWidth, thumbnailHeight );

                percentages[ file.id ] = [ file.size, 0 ];
                file.rotation = 0;
            }

            file.on('statuschange', function( cur, prev ) {
                if ( prev === 'progress' ) {
                    $prgress.hide().width(0);
                } else if ( prev === 'queued' ) {
                    $li.off( 'mouseenter mouseleave' );
                    $btns.remove();
                }

                // 成功
                if ( cur === 'error' || cur === 'invalid' ) {
                    console.log( file.statusText );
                    showError( file.statusText );
                    percentages[ file.id ][ 1 ] = 1;
                } else if ( cur === 'interrupt' ) {
                    showError( 'interrupt' );
                } else if ( cur === 'queued' ) {
                    percentages[ file.id ][ 1 ] = 0;
                } else if ( cur === 'progress' ) {
                    $info.remove();
                    $prgress.css('display', 'block');
                } else if ( cur === 'complete' ) {
                    $li.append( '<span class="success"></span>' );
                }

                $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
            });

            $li.on( 'mouseenter', function() {
                $btns.stop().animate({height: 30});
            });

            $li.on( 'mouseleave', function() {
                $btns.stop().animate({height: 0});
            });

            $btns.on( 'click', 'span', function() {
                var index = $(this).index(),
                    deg;

                switch ( index ) {
                    case 0:
                        uploader.removeFile( file );
                        return;

                    case 1:
                        file.rotation += 90;
                        break;

                    case 2:
                        file.rotation -= 90;
                        break;
                }

                if ( supportTransition ) {
                    deg = 'rotate(' + file.rotation + 'deg)';
                    $wrap.css({
                        '-webkit-transform': deg,
                        '-mos-transform': deg,
                        '-o-transform': deg,
                        'transform': deg
                    });
                } else {
                    $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
                    // use jquery animate to rotation
                    // $({
                    //     rotation: rotation
                    // }).animate({
                    //     rotation: file.rotation
                    // }, {
                    //     easing: 'linear',
                    //     step: function( now ) {
                    //         now = now * Math.PI / 180;

                    //         var cos = Math.cos( now ),
                    //             sin = Math.sin( now );

                    //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                    //     }
                    // });
                }


            });

            $li.appendTo( $queue );
        }

        // 负责view的销毁
        function removeFile( file ) {
            var $li = $('#'+file.id);

            delete percentages[ file.id ];
            updateTotalProgress();
            $li.off().find('.file-panel').off().end().remove();
        }

        function updateTotalProgress() {
            var loaded = 0,
                total = 0,
                spans = $progress.children(),
                percent;

            $.each( percentages, function( k, v ) {
                total += v[ 0 ];
                loaded += v[ 0 ] * v[ 1 ];
            } );

            percent = total ? loaded / total : 0;


            spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
            spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
            updateStatus();
        }

        function updateStatus() {
            var text = '', stats;

            if ( state === 'ready' ) {
                text = '选中' + fileCount + '张图片，共' +
                        WebUploader.formatSize( fileSize ) + '。';
            } else if ( state === 'confirm' ) {
                stats = uploader.getStats();
                if ( stats.uploadFailNum ) {
                    text = '已成功上传' + stats.successNum+ '张照片至服务器，'+
                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
                }

            } else {
                stats = uploader.getStats();
                text = '共' + fileCount + '张（' +
                        WebUploader.formatSize( fileSize )  +
                        '），已上传' + stats.successNum + '张';

                if ( stats.uploadFailNum ) {
                    text += '，失败' + stats.uploadFailNum + '张';
                }
            }

            $info.html( text );
        }

        function setState( val ) {
            var file, stats;

            if ( val === state ) {
                return;
            }

            $upload.removeClass( 'state-' + state );
            $upload.addClass( 'state-' + val );
            state = val;

            switch ( state ) {
                case 'pedding':
                    $placeHolder.removeClass( 'element-invisible' );
                    $queue.hide();
                    $statusBar.addClass( 'element-invisible' );
                    uploader.refresh();
                    break;

                case 'ready':
                    $placeHolder.addClass( 'element-invisible' );
                    $( '#filePicker2' ).removeClass( 'element-invisible');
                    $queue.show();
                    $statusBar.removeClass('element-invisible');
                    uploader.refresh();
                    break;

                case 'uploading':
                    $( '#filePicker2' ).addClass( 'element-invisible' );
                    $progress.show();
                    $upload.text( '暂停上传' );
                    break;

                case 'paused':
                    $progress.show();
                    $upload.text( '继续上传' );
                    break;

                case 'confirm':
                    $progress.hide();
                    $( '#filePicker2' ).removeClass( 'element-invisible' );
                    $upload.text( '开始上传' );

                    stats = uploader.getStats();
                    if ( stats.successNum && !stats.uploadFailNum ) {
                        setState( 'finish' );
                        return;
                    }
                    break;
                case 'finish':
                    stats = uploader.getStats();
                    if ( stats.successNum ) {
                    	layer.msg('上传成功!',{icon:1,time:1000});
                    } else {
                        // 没有成功的图片，重设
                        state = 'done';
                        location.reload();
                    }
                    break;
            }

            updateStatus();
        }
        
        uploader.onUploadProgress = function( file, percentage ) {
            var $li = $('#'+file.id),
                $percent = $li.find('.progress span');

            $percent.css( 'width', percentage * 100 + '%' );
            percentages[ file.id ][ 1 ] = percentage;
            updateTotalProgress();
        };

        uploader.onFileQueued = function( file ) {
            fileCount++;
            fileSize += file.size;

            if ( fileCount === 1 ) {
                $placeHolder.addClass( 'element-invisible' );
                $statusBar.show();
            }

            addFile( file );
            setState( 'ready' );
            updateTotalProgress();
        };

        uploader.onFileDequeued = function( file ) {
            fileCount--;
            fileSize -= file.size;

            if ( !fileCount ) {
                setState( 'pedding' );
            }

            removeFile( file );
            updateTotalProgress();

        };

        uploader.on( 'all', function( type ) {
            var stats;
            switch( type ) {
                case 'uploadFinished':
                    setState( 'confirm' );
                    break;

                case 'startUpload':
                    setState( 'uploading' );
                    break;

                case 'stopUpload':
                    setState( 'paused' );
                    break;

            }
        });

        uploader.onError = function( code ) {
            alert( 'Eroor: ' + code );
        };

        $upload.on('click', function() {
            if ( $(this).hasClass( 'disabled' ) ) {
                return false;
            }

            if ( state === 'ready' ) {
                uploader.upload();
            } else if ( state === 'paused' ) {
                uploader.upload();
            } else if ( state === 'uploading' ) {
                uploader.stop();
            }
        });

        $info.on( 'click', '.retry', function() {
            uploader.retry();
        } );

        $info.on( 'click', '.ignore', function() {
            alert( 'todo' );
        } );

        $upload.addClass( 'state-' + state );
        updateTotalProgress();
    });

})( jQuery );

//动态生成入驻行业——关键字
function industryCheck(t){
	if($(t).is(':checked')){
		$("#keySearch-list").find("div").each(function (i){
			if($(t).val()==$(this).find("p").text()){
				$(this).remove();
			}
		});
		var div=document.createElement('div');
        var p = document.createElement('p');
        var label=document.createElement('label');
        label.innerHTML="&#10005";
        p.innerHTML = $(t).val();
        document.getElementById("keySearch-list").appendChild(div);
        div.appendChild(p);
        div.appendChild(label);
	}else{
		$("#keySearch-list").find("div").each(function (i){
			if($(t).val()==$(this).find("p").text()){
				$(this).remove();
			}
		});
	}
	removeHead("keySearch-list");
}

//动态生成提供服务——关键字
function serviceCheck(t){
	$("#keySearch-list").find("div").each(function (i){
		if($(t).val()==$(this).find("p").text()){
			$(this).remove();
		}
	});
	if($(t).is(':checked')){
		var div=document.createElement('div');
        var p = document.createElement('p');
        var label=document.createElement('label');
        label.innerHTML="&#10005";
        p.innerHTML = $(t).val();
        document.getElementById("keySearch-list").appendChild(div);
        div.appendChild(p);
        div.appendChild(label);
	}else{
		$("#keySearch-list").find("div").each(function (i){
			if($(t).val()==$(this).find("p").text()){
				$(this).remove();
			}
		});
	}
	removeHead("keySearch-list");
}

//获取孵化园名称
function ipnameCheck(t){
	var ipname=$(t).val();
	/* console.info("孵化园名称：ipname"+ipname+"=ipnameold"+ipnameold+"=ipaddressold"+ipaddressold); */
	$("#keySearch-list").find("div").each(function (i){
		if(ipnameold==$(this).find("p").text()){
			$(this).remove();
		}
	});
  	ipnameold = ipname;
	if(ipname!=""&&ipname!=ipaddressold){
		var div=document.createElement('div');
        var p = document.createElement('p');
        var label=document.createElement('label');
        label.innerHTML="&#10005";
        p.innerHTML = ipname;
        document.getElementById("keySearch-list").appendChild(div);
        div.appendChild(p);
        div.appendChild(label);
	}
	removeHead("keySearch-list");
}

//获取孵化园地址
function ipaddressCheck(t){
	var ipaddress=$(t).val();
	/* console.info("孵化园地址：ipaddress"+ipaddress+"=ipnameold"+ipnameold+"=ipaddressold"+ipaddressold); */
	$("#keySearch-list").find("div").each(function (i){
		if(ipaddressold==$(this).find("p").text()){
			$(this).remove();
		}
	});
  	ipaddressold = ipaddress;
	if(ipaddress!=""&&ipaddress!=ipnameold){
		var div=document.createElement('div');
        var p = document.createElement('p');
        var label=document.createElement('label');
        label.innerHTML="&#10005";
        p.innerHTML = ipaddress;
        document.getElementById("keySearch-list").appendChild(div);
        div.appendChild(p);
        div.appendChild(label);
	}
	removeHead("keySearch-list");
}
</script>
</body>
</html>