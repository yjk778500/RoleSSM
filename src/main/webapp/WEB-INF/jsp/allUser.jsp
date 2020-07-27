<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%-- <c:if test="${listA==null}">
  <script type="text/javascript">
  		location.href="<%=path%>/mohu";
  
  </script>
  </c:if> --%>
  <style type="text/css">
body{
  background:black;
  overflow:hidden;
}
  	
  </style>
  </head>
    <body>
   
       <canvas id="canvas"> </canvas>
  <div >

  <span>用户名:</span>
  	<input type="text" id="name" name="name">
  <span>性别:</span>
  	<select id="gender" name="gender">
  		<option value="0">请选择性别</option>
  		<option value="1">男</option>
  		<option value="2">女</option>
  	</select>

  	<input type="button" onclick="cha()" value="查询">

  </div>

      <div class="page-contents" align="center" id="aa" style="margin-top:50px">
      <div style="margin-left:-100px"> <c:forEach var="button" items="${button}">
      <a href="javascriipt:;" onclick="Quan('${button.menu_uri}')">
     	 ${button.menu_describe}</a>
      </c:forEach></div>
     
         <table align="center" border="1" width="500px" height="400px">
          <tr>
          <td>
          		<label>请选择</label>
          	</td>
          <td>
          		<label>姓名</label>
          	</td>
          	<td>
          		<label>年龄</label>
          	</td>
          	<td>
          		<label>性别</label>
          	</td>
          	<td>
          		<label>住址</label>
          	</td>

          </tr>
          <c:forEach var="list" items="${list }">
          	<tr>
          		<td><input name="ids" type="checkbox" value="${list.id }" /></td>
          		<td>${list.name }</td>
          		 <td>${list.age }</td>
          		 <td>${list.gender==1?'男':'女' }</td>
          		<td>${list.address }</td>
          	
          	</tr>
          </c:forEach>
         </table>
       </div>
    
  </body>
  <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
  <script type="text/javascript">
<%--   function cha(){
  	var name=$("#name").val();
  	var gender=$("#gender").val();
  
  	location.href="<%=path%>/mohu?name="+name+"&gender="+gender;
  }
   --%>
  
  particles = 180;
points = [];
points1 = [];
pointers = [];

canvas = document.getElementById("canvas");
context = canvas.getContext("2d");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
var x = canvas.width, y = canvas.height;
img=document.getElementById("img");

exp = 5;
for(i=0; i<particles; i++){
  exp = exp*(Math.floor(Math.random()*20)/100+1);
  newX = exp;
  points[points.length] = newX;
  
  exp = exp*(Math.floor(Math.random()*20)/100+1);
  newX = exp;  
  points1[points1.length] = newX;
}

pointX = x/2;
pointY = y/2;

rotate = 0.04;
function draw(){
  context.fillStyle = "rgba(0,0,0,0.03)";
  context.fillRect(0,0,x,y);
  context.save();
  context.translate(pointX,pointY);
  context.rotate(rotate);
  i = 0;
  while(i<points.length){
    context.fillStyle = "#FFF";
    context.fillRect(points[i],0,1,1);
    i++;
  }
  context.restore();
  context.save();
  context.translate(pointX,pointY);
  context.rotate(rotate*0.7);
  i = 0;
  while(i<points.length){
    context.fillStyle = "#FFF";
    context.fillRect(points1[i],0,1,1);
    i++;
  }
  context.restore();
  rotate = rotate+0.01;
  requestAnimationFrame(draw);
}
// requestAnimationFrame(draw);

exp = 5;
for(i=0; i<particles; i++){
  point = {};
  exp = exp*(Math.floor(Math.random()*12)/100+1);
  point.x = exp;
  point.r0 = Math.floor(Math.random()*50)/10+1;
  point.r = Math.floor(Math.random()*Math.PI)+1;
  pointers[pointers.length] = point;
}

function drawNew(){
  context.fillStyle = "rgba(0,0,0,0.03)";
  context.fillRect(0,0,x,y);
  context.fillStyle = "#FFF";
  context.save();
  i=0;
  while(i<pointers.length){
    context.save();
    context.translate(pointX,pointY);
    context.rotate(pointers[i].r*0.1);
    pointers[i].r = pointers[i].r+pointers[i].r0*0.05;
    context.fillRect(pointers[i].x,0,1,1);    
    context.restore();
    i++;
  }
  requestAnimationFrame(drawNew);
}
requestAnimationFrame(drawNew);
  
  
  
  
  //跳转分配权限
     function Quan(uri){
    if(uri=="Quan"){
		var ids = [];
		$("input[name='ids']:checked").each(function(){
			ids.push($(this).val());
		});
		if(ids.length==0){
			alert("请选择用户");
		}
		if(ids.length>1){
			alert("单次只能分配一名用户");
		}
		else{
		var id=ids[0];
			$.ajax({
     		url	:uri,
     		type	:"post",
     		data	:{
     			"id":	id,
	     		"uri"	: 	uri
     		},
     		success	:function(data){
     			$("#aa").html(data);
     		}
     	});
		}
		//执行删除用户
		}else if(uri=="delUser"){
		var ids = [];
		$("input[name='ids']:checked").each(function(){
			ids.push($(this).val());
			});
		if(ids.length==0){
			alert("请至少选择一名删除对象!");
		}else{
		$.ajax({
		url		:"delUser",
		type	:"post",
		data	:"ids="+ids,
		success	: function(data){
			if(data.type=="success"){
				alert(data.msg);
				location.href=location.href;
			}else{
				alert(data.msg)
			}
		},
		error	: function(){
			alert("请求异常!");
		}
		})
		}	
		//添加用户
		}else if(uri =="addUser"){
			alert("添加");
			$.ajax({
				url	:uri,
				type:"post",
				data:{},
				success:function(data){
				$("#aa").html(data);
				}
			});
			//修改用户
		}else if(uri =="upUser"){
		
		var ids=[];
		$("input[name='ids']:checked").each(function(){
			ids.push($(this).val());
		
		});
			if(ids.length==0){
				alert("请选择一名修改对象！");
			}else if(ids.length > 1){
				alert("单次只能次改一个对象");
				}else{
			var id=ids[0];
			$.ajax({
				url	:uri,
				type:"post",
				data:{
					"id":id
				},
				success:function(data){
				$("#aa").html(data);
				}
			});
		}
	}
     }
  
  
  </script>
</html>
