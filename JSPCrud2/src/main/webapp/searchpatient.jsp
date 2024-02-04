<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.bhanu.bean.patientuserdao,com.bhanu.bean.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  
<h1>Users List</h1>  
  <%
  String pid=request.getParameter("searchpid");
  patientuser u=patientuserdao.getRecordById(Integer.parseInt(pid));  
  
  
List<patientuser> list=patientuserdao.getRecordById(pid);  
request.setAttribute("list",list);  
%> 
<h1>patient details</h1> 
 

<table>
 <tr>
 <td>patient</td><td>:&nbsp;<%=u.getPatient() %></td></tr>
 <tr><td>patientname</td><td>:&nbsp;<%=u.getPatientname() %></td></tr>
 <tr><td>gender</td><td>:&nbsp;<%=u.getGender() %></td></tr>
 <tr><td>Mobileno</td><td>:&nbsp;<%=u.getMobileno() %></td></tr>
 <tr><td>Email</td><td>:&nbsp;<%=u.getEmail() %></td></tr>
<tr> <td>Address</td><td>:&nbsp;<%=u.getAddress() %></td></tr>
 <tr><td>Mobileno</td><td>:&nbsp;<%=u.getMobileno() %></td></tr>
 
</table>
</body>  
</html>  

