<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.login.cart, com.login.cartDao,java.util.*"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="e" class="com.login.cart"></jsp:useBean>
    <jsp:setProperty property="*" name="e"/>
<% int i=cartDao.insert(e);
if(i>0)
	response.sendRedirect("loginsuccessfull.jsp");
%>
</body>
</html>