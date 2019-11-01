<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="com.login.customer, com.login.CustomerDao,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.login.Product, com.login.ProductDao,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="e" class="com.login.Product"></jsp:useBean>
<jsp:setProperty property="*" name="e" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/login"  
     user="root"  password="password@123"/>  
     
     <sql:query dataSource="${db}" var="rs">  
SELECT * from tvr;  
</sql:query> 
<table border="2" width="100%">  
<tr>  
<th>Hsn code</th>  
<th>Name</th>  
<th>stock left</th>  
<th>stock Sold</th>
<th>price</th>  
</tr>  
<c:forEach var="table" items="${rs.rows}">  
<tr>  
<td><c:out value="${table.hsn_code}"/></td>  
<td><c:out value="${table.name}"/></td>  
<td><c:out value="${table.stock_left}"/></td>  
<td><c:out value="${table.stock_sold}"/></td> 
<td><c:out value="${table.price}"/></td>  
</tr>  
</c:forEach>  
</table> 
</body>
</html>