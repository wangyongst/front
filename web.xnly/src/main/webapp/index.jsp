﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登陆西宁乐缘综合管理系统</title>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">     
  	$(document).ready(function() {
  		window.location.href= "<%=basePath%>jsp/login.jsp";
	});
    </script>
  </head>
  <body>
  </body>
</html>
