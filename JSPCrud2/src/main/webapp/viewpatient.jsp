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
List<patientuser> list=patientuserdao.getAllRecords();  
request.setAttribute("list",list);  
%>  
 <form action="searchpatient.jsp" method="post">
      <input type="text" name="searchpid">
      <tr><td>patient:</td><td>  
 
<select name="patient" style="width:155px">  

<option>Patient</option>  
<option>gender<td>${u.getGender()}</td></option>  
<option>mobileno</option>  
<option>email</option>  
<option>address</option> 
<option>patientname</option>
</select>  
</td></tr>  
      
      <input type="submit" value="submit">
    </form> 
<table border="1" width="90%">  

<tr><th>patient</th><th>gender</th>
<th>mobileno</th><th>email</th><th>address</th><th>problem</th><th>patientname</th>
<th>Edit</th><th>Delete</th></tr>  
<c:forEach items="${list}" var="u">  
<tr><td>${u.getPatient()}</td>
<td>${u.getGender()}</td>
 <td>${u.getMobileno()}</td> 
 <td>${u.getEmail()}</td>
 <td>${u.getAddress()}</td>
 <td>${u.getProblem()}</td>
 <td>${u.getPatientname()}</td>
<td><a href="patienteditform.jsp?patient=${u.getPatient()}">Edit</a></td>  
<td><a href="patientdelete.jsp?patient=${u.getPatient()}">Delete</a></td></tr>  
</c:forEach>  
</table>  
<br/><a href="patientadduserform.jsp">Add New User</a>  
  
</body>  
</html>  

