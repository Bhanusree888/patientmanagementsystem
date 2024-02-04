<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.bhanu.bean.patientuserdao,com.bhanu.bean.patientuser"%>  
  
<%  
String id=request.getParameter("patient");  
patientuser u=patientuserdao.getRecordById(Integer.parseInt(id));  
%>  
  
<h1>Edit Form</h1>  
<form action="patientedituser.jsp" method="post">  
<input type="hidden" name="patient" value="<%=u.getPatient() %>"/>  
<table>  

<tr><td>Gender:</td><td>  
<input type="text" name="Gender" value="<%= u.getGender()%>"/></td></tr>  
<tr><td>Mobileno:</td>
<td><input type="text" name="Mobileno" value="<%=u.getMobileno() %>"/></td></tr>  
<tr><td>Email:</td>
<td><input type="text" name="Email" value="<%=u.getEmail() %>"/></td></tr>
<tr><td>Problem:</td>
<td><input type="text" name="Problem" value="<%=u.getProblem() %>"/></td></tr>
<tr><td>Patientname:</td>
<td><input type="text" name="Patientname" value="<%=u.getPatientname() %>"/></td></tr>

<tr><td colspan="2"><input type="submit" value="Edit User"/></td></tr>  


</table>
</form>
</body>
</html>