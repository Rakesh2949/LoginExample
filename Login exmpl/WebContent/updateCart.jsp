<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.login.Product, com.login.ProductDao,java.util.*" %>
   
     <%@ page import="com.login.customer, com.login.CustomerDao,java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updating Cart</title>
</head>
<body>
<%String id=request.getParameter("hsn_code"); 
int i=Integer.parseInt(id);
    Product p=ProductDao.getProductById(i);
    %>
    <form action="cartinsert.jsp" method="post">
    Hsn Code:<input type="text" name="hsn_code" value="<%= p.getHsn_code()%> "><br/>
    Customer Id:<input type="text" name="cust_id" value="6" ><br/>
    Customer Name:<input type="text" name="cust_name" value="Gauri" ><br/>
    Product Name:<input type="text" name="pro_name" value="<%=p.getName() %>" ><br/>
    Price:<input type="text" name="price" value="<%=p.getPrice() %> "><br/>
    <input type="submit" name="update" value="ADD">
    </form>
</body>
</html>