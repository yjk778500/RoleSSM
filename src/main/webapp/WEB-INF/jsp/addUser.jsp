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
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <c:if test="${a==1 }">
    <div>
    	<table>
    		<tr>
    			<td>用户名:</td>
    			<td><input type="text" id="name" name="name"></td>
    		
    		</tr>
    	
    		<tr>
    			<td>年龄:</td>
    			<td><input type="text" id="age" name="age"></td>
    		</tr>
    		<tr>
    			<td>性别:</td>
    			<!-- <td><input type="text" id="gender" name="gender"></td> -->
    			<td><select id="gender" name="gender">
    				<option value="1">男</option>
    				<option value="2">女</option>
    			</select>
    			</td>
    		</tr>
    		<tr>
    			<td>住址:</td>
    			<td><input type="text" id="address" name="address"></td>
    		</tr>
    		<tr>
    			<td>密码:</td>
    			<td><input type="text" id="passwd" name="passwd"></td>
    		</tr>
    		
    		<td><input type="button" id="bc" onclick="addbaoc()" value="保存"></td>
    	</table>
    </div>
    </c:if>
    <c:if test="${a==2 }">
    <div>
    	<c:forEach items="${userList }" var="user">
    	<table>
    		<tr>
    			<td>用户名:</td>
    			<td><input type="text" id="name" name="name" value="${user.name }"></td>
    		
    		</tr>
    	
    		<tr>
    			<td>年龄:</td>
    			<td><input type="text" id="age" name="age" value="${user.age }"></td>
    		</tr>
    		<tr>
    			<td>性别:</td>
    			<td><input type="text" id="gender" name="gender" value="${user.gender==1?'男':'女' }"></td>
    		</tr>
    		<tr>
    			<td>住址:</td>
    			<td><input type="text" id="address" name="address" value="${user.address }"></td>
    		</tr>
    	
    		
    		<td><input type="button" id="bc" class="btn btn-info" onclick="upbaoc('${user.id}')" value="保存"></td>
    	</table>
    	</c:forEach>
    </div>
    </c:if>
  </body>
  <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
  <script type="text/javascript">
  function addbaoc(){
  	var name=$("#name").val();
  	var age=$("#age").val();
  	var gender=$("#gender").val();
  	var address=$("#address").val();
  	var passwd=$("#passwd").val();
  	
  	if(name == null || name ==""){
  		alert("姓名不能为空!");
  		return false;
  	}else if(age == null || age==""){
  		alert("年龄不能为空!");
  		return false;
  	}else if(gender == null || gender==""){
  		alert("请选择性别!");
  		return false;
  	}else if(address == null || address==""){
  		alert("住址不能为空!");
  		return false;
  	}else if(passwd == null || passwd==""){
  		alert("密码不能为空!");
  		return false;
  	}else{
  	alert("执行ajax");
  	$.ajax({
  	
  		url	:"addbaoc",
  		type:"post",
  		data:{
  			"name"	:name,
  			"age"	:age,
  			"gender":gender,
  			"address":address,
  			"password":passwd
  		
  		},
  		success:function(data){
  			if(data.type=="success"){
  				alert(data.msg);
  			}else{
  				alert(data.msg);
  			}
  		},
  		error:function(data){
  			alert("请求异常!");
  		}
  	
  	});
  }
  }
  </script>
  
</html>
