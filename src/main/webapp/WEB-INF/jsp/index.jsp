<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 	// <script type="text/javascript" src="../static/js/jquery-1.12.4.js"></script> -->
	<style>
    body{ text-align:center} 
    	#divcss5{margin:0 auto;width:500px;height:250px;text-align:center} 
    .a{
    	position: relative;
    	left:10px;
    	top:25px;
    	}
   #dengl{
   
   }
    </style>
    
  </head>

  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
   

  <body style="background-color: gray;>
  <div align="center" id="divcss5"  margin-top: 100px class="input-group" >
			<h3 class="a" style="margin-top: 200px">登录</h3>
			<form action="login" method="get">
				<table align="center" style="margin-top: 100px" >
					<tr  style="height: 40px">
						<td>用户名</td>
						<td ><input style="color:green"type="text" name="student_name" id="userName" /></td>
					</tr>

					<tr>
						<td>密 码</td>
						<td><input type="password" name="student_password" id="password" /></td>
					</tr>
				</table>
				</br>
				<input style="color:#000000;background-color:#DDDCEB"  type="button" value="登陆" class="btn btn-info" id="dengl" onclick="loginUser();"/>
				<input style="color:#000000;background-color:#DDDCEB" type="button"  value="注册" onclick="addUser()" class="btn btn-danger"/>
				
			</form>
		</div>
  </body>

  <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
  <script type="text/javascript">
  
  	function addUser(){
  	 location.href="addUser";
  	}

  	//登录
  	function loginUser(){
  		var userName = $("#userName").val();
  		var password = $("#password").val();
  		var cpacha = $("#cpacha").val();
  		if(userName == null || userName==""){
  			alert("用户名不能为空!");
  		}else if(password == null || password ==""){
  			alert("密码不能为空");
  	
  		}else{
  			$.ajax({
  				url			:			"login",
  				type		:			"post",
  				data		:			{
  					"name"	:	userName,
  					"password"	:	password
  					
  				},
  				dataType	:		"json",
  				success		:			function(data){
					if(data.type=="success"){
						location.href="menu"
					}else{
						alert(data.msg);
					}
  				},
  				error		:		function(){
  					alert("请求异常!");
  				}
  			});
  		}
  	}
  </script>
  

</html>
