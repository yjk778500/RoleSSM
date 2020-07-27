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
    
    <title>My JSP 'Menu.jsp' starting page</title>
    
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
        <div class="page-contents" align="center" id="aa" style="margin-top:50px">

        <table align="center" border="1" width="500px" height="400px">
        	<c:forEach var="list" items="${listmenu }">
        		<tr>
        		<td><input name="ids" type="checkbox" value="${list.id }" 
        		<c:forEach var="button" items="${button }">${button.id==list.id ? 'checked':'' }</c:forEach>
        		/>
        		</td>
        		<td>${list.menu_name }</td>
        		</tr>
        	</c:forEach>
        </table>
        <td colspan="2" align="center">
    			<input type="button" value="提交" class="btn btn-info" onclick="updatebaoc('${id}')"/>
    	
    			
    		</td>
        </div>
  </body>
</html>
