<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="getconnection.jsp"%>
 <!-- to connect a database-->
 public static Connection getConnection() {
			Connection con=null;
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
				System.out.println("Connection created");
			}
			catch(Exception e) {
				System.out.println(e);
				System.out.println("Connection not created");
			}
			return con;
		}

<%
try
{
String ImageFile="";
String itemName = "";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
}
catch (FileUploadException e)
{
e.getMessage();
}

Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if (item.isFormField())
{
String name = item.getFieldName();
String value = item.getString();
if(name.equals("ImageFile"))
{
ImageFile=value;
}

}
else
{
try
{
itemName = item.getName();
File savedFile = new File("config.getServletContext().getRealPath("C:\Users\bhanu\OneDrive\Pictures\Camera Roll\WIN_20240122_14_36_46_Pro.jpg"")+"Example\\images\\"+itemname);

item.write(savedfile);
}
catch (Exception e)
{
out.println("Error"+e.getMessage());
}
}
}
try
{
st.executeUpdate("insert into test(image) values ('"+itemName+"')");

}
catch(Exception el)
{
out.println("Inserting error"+el.getMessage());
}
}
}
catch (Exception e){
out.println(e.getMessage());
}
%>


</body>
</html>