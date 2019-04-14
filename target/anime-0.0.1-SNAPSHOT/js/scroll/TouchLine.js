/*
	声明：保留头部版权的情况下，可以自由的使用，可以作为商业用�??
	�?发�?�：狼族小狈
	官网：http://kelink.com
	版本�?1.0
	�?后修改日期：2014.4.15
*/
var TouchLine = function(config) {
    this.containerNode = config.container.parentNode;
    this.container = config.container;
    this.downX = 0;
    this.downLeft = 0;
    this.prevX = 0;
    this.iSpeedY = 0;
    this.timer = null;
    this.oLi = this.container.getElementsByTagName(config.nodeTagName);
    this.barWidth = this.containerNode.offsetWidth * this.containerNode.offsetWidth / this.container.offsetWidth;
    this.init();
}
TouchLine.prototype = {
    init: function() {
        var _this = this;
		var oUlWidth = 0;
        _this.containerNode.style.width = '100%';
        _this.containerNode.style.overflow = 'hidden';
        _this.containerNode.style.position = 'relative';
        _this.containerNode.style.minHeight = this.oLi[0].offsetHeight + 'px';
		for(var i=0;i<_this.oLi.length;i++){
			console.log(_this.oLi[i].offsetWidth);
			oUlWidth += _this.oLi[i].offsetWidth;
		}
        _this.container.style.width = oUlWidth + 'px';
        if (_this.barWidth <= 40) {
            _this.barWidth = 40;
        } 
        else if (_this.barWidth >= _this.containerNode.offsetWidth) {
            _this.barWidth = 0;
        }
        
        
        _this.container.ontouchstart = function(ev) {
            document.ontouchmove = function(ev) {
                ev.preventDefault();
            };
            var touchs = ev.changedTouches[0];
            _this.downX = touchs.pageX;
            _this.downLeft = this.offsetLeft;
            _this.prevX = touchs.pageX;
            var bBtn = true;
            
            _this.container.ontouchmove = function(ev) {
                var touchs = ev.changedTouches[0];
                
                _this.iSpeedY = touchs.pageX - _this.prevX;
                _this.prevX = touchs.pageX;
                
                if (this.offsetLeft >= 0) {
                    if (bBtn) {
                        bBtn = false;
                        _this.downX = touchs.pageX;
                    }
                    this.style.left = (touchs.pageX - _this.downX) / 3 + 'px';
                } 
                else if (this.offsetLeft <= _this.containerNode.offsetWidth - _this.container.offsetWidth) {
                    if (bBtn) {
                        bBtn = false;
                        _this.downX = touchs.pageX;
                    }
                    this.style.left = (touchs.pageX - _this.downX) / 3 + (_this.containerNode.offsetWidth - _this.container.offsetWidth) + 'px';
                } 
                else {
                    this.style.left = touchs.pageX - _this.downX + _this.downLeft + 'px';
                    var scaleY = this.offsetLeft / (_this.containerNode.offsetWidth - _this.container.offsetWidth);
                }
            };
            _this.container.ontouchend = function() {
                document.ontouchmove = null;
                this.ontouchmove = null;
                this.ontouchend = null;
                var This = this;
                
                clearInterval(_this.timer);
                _this.timer = setInterval(function() {
                    if (Math.abs(_this.iSpeedY) <= 1 || This.offsetLeft > 50 || This.offsetLeft <= _this.containerNode.offsetWidth - _this.container.offsetWidth - 50) {
                        clearInterval(_this.timer);
                        if (This.offsetLeft >= 0) {
                            startMove(This, {left: 0}, 400, 'easeOut', function() {
                            });
                        } 
                        else if (This.offsetLeft <= _this.containerNode.offsetWidth - _this.container.offsetWidth) {
                            startMove(This, {left: _this.containerNode.offsetWidth - _this.container.offsetWidth}, 400, 'easeOut', function() {
                            });
                        }
                    } 
                    else {
                        _this.iSpeedY *= 0.95;
                        This.style.left = This.offsetLeft + _this.iSpeedY + 'px';
                    
                    }
                
                }, 13);
            
            };
        };

        function startMove(obj, json, times, fx, fn, fnMove) {
            var iCur = {};
            for (var attr in json) {
                if (attr == 'opacity') {
                    iCur[attr] = Math.round(getStyle(obj, attr) * 100);
                } 
                else {
                    iCur[attr] = parseInt(getStyle(obj, attr));
                }
            }
            
            var startTime = now();
            
            clearInterval(obj.timer);
            obj.timer = setInterval(function() {
                
                var changeTime = now();
                
                var scale = 1 - Math.max(0, (startTime - changeTime + times) / times);
                
                if (fnMove) {
                    fnMove(scale);
                }
                
                for (var attr in json) {
                    
                    var value = Tween[fx](scale * times, iCur[attr], json[attr] - iCur[attr], times);
                    
                    if (attr == 'opacity') {
                        obj.style.filter = 'alpha(opacity=' + value + ')';
                        obj.style.opacity = value / 100;
                    } 
                    else {
                        obj.style[attr] = value + 'px';
                    }
                    
                    if (scale == 1) {
                        clearInterval(obj.timer);
                        if (fn) {
                            fn.call(obj);
                        }
                    }
                
                }
            
            }, 13);
            
            function now() {
                return Date.now();
            }
            
            function getStyle(obj, attr) {
                return getComputedStyle(obj, false)[attr];
            }
            
            var Tween = {
                linear: function(t, b, c, d) {
                    return c * t / d + b;
                },
                easeIn: function(t, b, c, d) {
                    return c * (t /= d) * t + b;
                },
                easeOut: function(t, b, c, d) {
                    return -c * (t /= d) * (t - 2) + b;
                },
                easeBoth: function(t, b, c, d) {
                    if ((t /= d / 2) < 1) {
                        return c / 2 * t * t + b;
                    }
                    return -c / 2 * ((--t) * (t - 2) - 1) + b;
                },
                easeInStrong: function(t, b, c, d) {
                    return c * (t /= d) * t * t * t + b;
                },
                easeOutStrong: function(t, b, c, d) {
                    return -c * ((t = t / d - 1) * t * t * t - 1) + b;
                },
                easeBothStrong: function(t, b, c, d) {
                    if ((t /= d / 2) < 1) {
                        return c / 2 * t * t * t * t + b;
                    }
                    return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
                }
            }
        }
        function setCookie(name, value) {
            var Days = 30;
            var exp = new Date();
            exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
            document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/";
        }
        
        function getCookie(name) {
            var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
            if (arr = document.cookie.match(reg))
                return unescape(arr[2]);
            else
                return null;
        }
    }

};
