<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.login.Product, com.login.ProductDao,java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.login.customer, com.login.CustomerDao,java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ page import="com.login.cart, com.login.cartDao,java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>loginSuccessfull</title>
<style>
body{
background-image: url("bga%20(2).jpg") ;
         background-size:cover;
         background-repeat: no-repeat;
     }
 </style>   
</head>
<body>
<button><a href="Login.jsp">LOGOUT</a><br/></button>
<h1>Product List</h1>
<%List<Product> list=ProductDao.display(); 
request.setAttribute("list", list);
%>
<table border="1" width="90%">
<tr><th>Hsn Code</th><th>Product Name</th><th>Stock Left</th><th>Stock Sold</th><th>Price</th><th>Update</th><th>Delete</th></tr>
<c:forEach items="${list}" var="e">
<tr><td>${e.getHsn_code() }</td><td>${e.getName() }</td><td>${e.getStock_left()}</td><td>${e.getStock_sold()}</td><td>${e.getPrice()} </td>
<td><a href="updateProduct.jsp?hsn_code=${e.getHsn_code()}">Update</a></td><td><a href="deleteProduct.jsp?hsn_code=${e.getHsn_code() }">Delete</a></td>
</tr>
</c:forEach>
</table>
<a href="insertProduct.jsp">Add New Product</a>
<h1>Customer List</h1>
<%List<customer> clist=CustomerDao.display(); 
request.setAttribute("list", clist);
%>
<table border="1" width="90%">
<tr><td>Customer Id</td><td>Customer Name</td><td>Phone No</td><td>Email Id</td><td>Password</td><td>Gender</td><td>Address</td><td>Delete</td>
</tr>
<c:forEach items="${list}" var="p">
<tr><td>${p.getCust_id() }</td><td>${p.getCust_name() }</td><td>${p.getPhoneNo() }</td><td>${p.getEmail_id() }</td><td>${p.getPassword() }</td>
<td>${p.getGender() }</td><td>${p.getAddress() }</td><td><a href="deleteCustomer.jsp?cust_id=${p.getCust_id() }">Delete</a></td>
</tr>
</c:forEach>
</table>

<h1>Cart List</h1>
<%List<cart> crtlist=cartDao.display(); 
request.setAttribute("list", crtlist);
%>
<table border="1" width="90%">
<tr><th>product Id</th><th>Hsn Code</th><th>Customer Id</th><th>Customer Name</th><th>Product Name</th><th>Price</th></tr>
<c:forEach items="${list}" var="e">
<tr><th>${e.getPro_id() }</th><th>${e.getHsn_code() }</th><th>${e.getCust_id() }</th>
<th>${e.getCust_name() }</th><th>${e.getPro_name() }</th><th>${e.getPrice() }</th>

</tr>
</c:forEach>
</table>


</body>
</html>