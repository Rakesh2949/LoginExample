<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.login.cart, com.login.cartDao,java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="e" class="com.login.cart"></jsp:useBean>
    <jsp:setProperty property="*" name="e"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int i=cartDao.delete(e);
if(i>0)
	response.sendRedirect("cart.jsp");
else
	response.sendRedirect("cart.jsp");
%>
</body>
</html>