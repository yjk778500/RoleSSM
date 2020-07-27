<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", path);
%>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>权限管理</title>
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
        
        <script>
            //是否开启刷新记忆tab功能
             var is_remember = false;
        </script>
        	<style type="text/css">
        	
         tr{
         	height: 30px;
         	align:center;
         }
         td{
         	width: 80px;
         	text-align:center;
         }
        </style>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a>用户信息管理</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item" style="margin-right: 30px;">
                 	欢迎您!  ${sessionScope.user1.name}
                </li>
                <li class="layui-nav-item to-index">
                    <a href="index">退出</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                <c:forEach var="menu1" items="${menu}">
                 <c:if test="${menu1.menu_type ==1 }">
                 <li>
					<a href="javascript:;" > 
						<i class="iconfont left-nav-li" lay-tips="系统基础管理">&#xe6b8;</i>
						<cite>${menu1.menu_name }</cite> 
						<i class="iconfont nav_right">&#xe697;</i>
					</a>
				<ul class="sub-menu">
				 <c:forEach var="menulist" items="${menu}">
				 <c:if test="${menulist.menu_type ==2 && menulist.menu_parent == menu1.id}">
                        <li>
                            <a onclick="${menulist.menu_uri}('${menulist.menu_uri}','${sessionScope.user1.id}','${menulist.id }')">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>${menulist.menu_name }</cite></a>
                        </li>
                   </c:if>
                   </c:forEach>
                   </ul>
				</li>
				</c:if>
                </c:forEach>
                  </ul>
            </div>
        </div>
         <div class="page-contents" align="center" id="aa" style="margin-top:50px">
         <h1>权限管理</h1>
        </div>
    
     <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
     <script src="${path}/statics/js/ui.js"></script>
     <script>
     //查询用户所有的信息
     function allUser(uri,user_id,menu_parent){
     		$.ajax({
     		url	:uri,
     		type	:"post",
     		data	:{
	     		"uri"	: 	uri,
	     		"user_id":	user_id,
	     		"menu_parent":menu_parent
     		},
     		success	:function(data){
     			$("#aa").html(data);
     		}
     	});
     	}
     	
     
     //菜单列表
     function menuUser(uri,user_id,menu_parent){
   
     	/* var ise = {
     		"uri"	: 	uri,
     		"user_id":	user_id,
     		"menu_parent":menu_parent
     	}
     	$(".page-contents").removeClass();
     	$("#aa").load(uri+" .page-contents",ise); */
     	$.ajax({
     		url	:uri,
     		type	:"post",
     		data	:{
	     		"uri"	: 	uri,
	     		"user_id":	user_id,
	     		"menu_parent":menu_parent
     		},
     		success	:function(data){
     			$("#aa").html(data);
     		}
     	});
     	
     	}
     	
     	//量子特效
     	function Liangzi(uri,user_id,menu_parent){
     	$.ajax({
     		url	:uri,
     		type	:"post",
     		data	:{
	     		"uri"	: 	uri,
	     		"user_id":	user_id,
	     		"menu_parent":menu_parent
     		},
     		success	:function(data){
     			$("#aa").html(data);
     		}
     	});
     	
     	}
     function roleUser(uri,user_id,menu_parent){
     	$.ajax({
     		url	:uri,
     		type	:"post",
     		data	:{
	     		"uri"	: 	uri,
	     		"user_id":	user_id,
	     		"menu_parent":menu_parent
     		},
     		success	:function(data){
     			$("#aa").html(data);
     		}
     	});
     	
     	}
     	
   
     
     //保存
   function updatebaoc(id){
   	var ids=[];
     		$("input[name='ids']:checked").each(function(){
			ids.push($(this).val());
		});
	
		$.ajax({
		url		:	"updatemenu",
		type	:	"post",
		data	:"ids="+ids+"&id="+id,
		success	:	function(data){
			if(data.type=="success"){
				alert(data.msg);
			location.href=location.href;
			}else{
				alert(data.msg);
			}
		},
		error	:	function(){
			alert("请求异常!");
		}
		
		
		});
	
   }
     		
    function upRole(){ 
			$(".page-contents").removeClass();
     		$("#aa").load(upRole+" .page-contents",ise);
		
		
    }
     </script>
     </body>
</html>