<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Liangzi.jsp' starting page</title>
  <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" /> -->
        <meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="static/layui/css/layui.css">
		<link rel="stylesheet" href="static/css/font.css">
        <link rel="stylesheet" href="static/css/xadmin.css">
       <!--  <link rel="stylesheet" href="./css/theme5.css">-->
        <script src="static/layui/layui.js" charset="utf-8"></script> 
        <script type="text/javascript" src="static/js/xadmin.js"></script>

        	<style type="text/css">
        body {
		  margin: 0;
		  width: 100%;
 		 overflow: hidden;
			}
        
        </style>
  </head>
  
  <body>
    <div>测试</div>
    <canvas id='canv'></canvas>
<!--
mousemove / touchswipe over words
!-->
    
  </body>
  <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
  <script type="text/javascript">
  	var c = document.getElementById('canv');
		var $ = c.getContext('2d');
		
		var w = c.width = window.innerWidth;
		var h = c.height = window.innerHeight;
		
		$.fillStyle = 'hsla(0,0%,0%,1)';
		$.fillRect(0, 0, w, h);
		
		var u = 0;
		var arr = [];
		
		var w;
		var h;
		
		var str;
		var strs = ['原江未', '骚猪', '死胖子', '非你莫属', '臭傻逼', '真该死'];
		
		var _off = 150;
		var _spr = 0.3;
		
		var ms;
		
		var txt = function() {
		  str = strs[Math.floor(Math.random() * strs.length)];
		  for (var i in strs) {
		    $.fillStyle = 'hsla(' + u * i + ', 95%, 50%, 1)';
		  }
		  $.font = 'bold 100px "Georgia"';
		  $.textAlign = 'left';
		  $.textBaseline = 'middle';
		  $.fillText(str, (w - $.measureText(str).width) * 0.5, h * 0.5);
		};
		
		var pixis = function() {
		  var p = $.getImageData(0, 0, w, h);
		  var pt = 0;
		
		  for (var i = 0; i < h; i += 1) {
		    for (var j = 0; j < w; j += 1) {
		      var r = p.data[pt];
		
		      if (r !== 0) {
		        var e = p.data[pt + 1];
		        var b = p.data[pt + 2];
		        var a = p.data[pt + 3];
		        var _px = new _Px(j, i, r, e, b, a);
		        arr.push(_px);
		      };
		      pt += 4;
		    };
		  };
		};
		
		var save = function() {
		  $.fillStyle = 'hsla(0,0%,0%,1)';
		  $.fillRect(0, 0, w, h);
		};
		
		var msPos = function() {
		  for (var i in arr) {
		    u -= .5;
		    if (!ms) return;
		
		    var _px = arr[i];
		
		    var dx = _px.x - ms.x;
		    var dy = _px.y - ms.y;
		
		    var d = Math.sqrt(dx * dx + dy * dy);
		    var minD = _px.w + _off;
		
		    if (d < minD) {
		      var ang = Math.atan2(dy, dx);
		
		      var tx = ms.x + Math.cos(ang) * minD;
		      var ty = ms.y + Math.sin(ang) * minD;
		
		      var ax = (tx - _px.x) * _spr;
		      var ay = (ty - _px.y) * _spr;
		
		      _px.vx += ax;
		      _px.vy += ay;
		    };
		  };
		};
		
		var txtPos = function() {
		  if (arr.length === 0) {
		
		    delete arr[0];
		    arr.splice(0);
		    str = strs[Math.floor(Math.random() * strs.length)];
		    go();
		  } else {
		    for (var i = 0; i < arr.length; i++) {
		      var _px = arr[i];
		      if (_px.y > h) {
		        delete arr[i];
		        arr.splice(i, 1);
		      } else {
		        break;
		      };
		    };
		  };
		};
		
		var fall = function() {
		  for (var i = 0; i < arr.length; i++) {
		    if (i % 6 === 0) {
		      delete arr[i];
		      arr.splice(i, 1);
		    } else {
		      var _px = arr[i];
		      _px.draw();
		      _px.move();
		    };
		  };
		};
		
		var upd = function() {
		  save();
		  msPos();
		  txtPos();
		  fall();
		};
		
		var _Px = function(x, y) {
		  this.w = 1;
		  this.h = 1;
		  this.x = x;
		  this.y = y;
		  this.vx = Math.random() * 5 - 2.5;
		  this.vy = Math.random() * 5 - 2;
		  this.color = 'hsla(' + u + ', 95%, 50%, 1)';
		};
		
		_Px.prototype = {
		  move: function() {
		    this.vx *= Math.random() * (1 - 0.8) + 0.4;
		    this.vy *= Math.random() * (1 - 0.8) + 0.7;
		    this.vy += Math.random() * 2;
		    this.x += this.vx;
		    this.y += this.vy;
		  },
		
		  draw: function() {
		    $.fillStyle = this.color;
		    $.fillRect(this.x, this.y, this.w, this.h);
		  }
		};
		
		var go = function() {
		  txt();
		  pixis();
		};
		
		window.requestAnimFrame = (function() {
		  return window.requestAnimationFrame ||
		    window.webkitRequestAnimationFrame ||
		    window.mozRequestAnimationFrame ||
		    window.oRequestAnimationFrame ||
		    window.msRequestAnimationFrame ||
		    function(callback) {
		      window.setTimeout(callback, 1000 / 60);
		    };
		})();
		
		var run = function() {
		  window.requestAnimFrame(run);
		  upd();
		}
		
		window.addEventListener('resize', function() {
		  c.width = w = window.innerWidth;
		  c.height = h = window.innerHeight;
		}, false);
		
		window.addEventListener('mousemove', function(e) {
		  ms = {};
		  if (e) {
		    ms.x = e.pageX;
		    ms.y = e.pageY;
		  } else {
		    ms.x = e.x + document.body.scrollLeft;
		    ms.y = e.y + document.body.scrollTop;
		  };
		  return ms;
		}, false);
		
		window.addEventListener('touchmove', function(e) {
		  ms = {};
		  if (e) {
		    ms.x = e.touches[0].pageX;
		    ms.y = e.touches[0].pageY;
		  } else {
		    ms.x = e.touches[0].x + document.body.scrollLeft;
		    ms.y = e.touches[0].y + document.body.scrollTop;
		    e.preventDefault();
		  };
		  return ms;
		}, false);
		
		go();
		run();
  
  
  </script>
</html>
