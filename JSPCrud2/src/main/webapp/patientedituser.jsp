<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.bhanu.bean.patientuserdao"%>  
<jsp:useBean id="u" class="com.bhanu.bean.patientuser"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
int i=patientuserdao.update(u);  
response.sendRedirect("viewpatient.jsp");  
%>  

</body>
</html>