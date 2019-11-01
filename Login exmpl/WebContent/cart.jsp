<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.login.cart, com.login.cartDao,java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Display</title>
<style>
body{
background-image: url("bga%20(2).jpg") ;
         background-size:cover;
         background-repeat: no-repeat;
     }
 </style> 
</head>
<body>
<%List<cart> list=cartDao.display(); 
request.setAttribute("list", list);
%>
<h1>Your Cart</h1>
<table border="1" width="90%">
<tr><th>product Id</th><th>Hsn Code</th><th>Customer Id</th><th>Customer Name</th><th>Product Name</th><th>Price</th><th>Remove From Cart</th></tr>
<c:forEach items="${list}" var="e">
<tr><th>${e.getPro_id() }</th><th>${e.getHsn_code() }</th><th>${e.getCust_id() }</th>
<th>${e.getCust_name() }</th><th>${e.getPro_name() }</th><th>${e.getPrice() }</th>
<td><a href="removecart.jsp?pro_id=${e.getPro_id() }">Remove</a></td></tr>
</c:forEach>
</table>
<button><a href="buysuccessfull.jsp">BUY NOW</a></button>


</body>
</html>