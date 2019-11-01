<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.login.cart, com.login.cartDao,java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="p" class="com.login.cart"></jsp:useBean>
    <jsp:setProperty property="*" name="p"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert cart</title>
</head>
<body>
<% int i=cartDao.insert(p);
if(i>0)
	response.sendRedirect("shop.jsp");
%>

</body>
</html>