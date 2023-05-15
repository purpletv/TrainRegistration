<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Travel details</h2>
<table border = "1">
<tr><td><b>source</b></td><td><%=request.getParameter("from") %></td></tr>
<tr><td>destination</td><td><%=request.getParameter("to") %></td></tr>
<tr><td>train name</td><td><%=request.getParameter("train") %></td></tr>
<tr><td>train number</td><td><%=request.getParameter("train_no") %></td></tr>
<tr><td>class</td><td><%=request.getParameter("train_class") %></td></tr>
<tr><td>date</td><td><%=request.getParameter("date") %></td></tr>
</table>
<h2>Passengers</h2>
<table border = "1">
<tr><td>NAME</td><td>AGE</td><td>GENDER</td></tr>
<tr><td><%=request.getParameter("name1") %></td><td><%=request.getParameter("age1") %></td><td><%=request.getParameter("gender1") %></td></tr>
<tr><td><%=request.getParameter("name2") %></td><td><%=request.getParameter("age2") %></td><td><%=request.getParameter("gender2") %></td></tr>
<tr><td><%=request.getParameter("name3") %></td><td><%=request.getParameter("age3") %></td><td><%=request.getParameter("gender3") %></td></tr>
<tr><td><%=request.getParameter("name4") %></td><td><%=request.getParameter("age4") %></td><td><%=request.getParameter("gender4") %></td></tr>
<tr><td><%=request.getParameter("name5") %></td><td><%=request.getParameter("age5") %></td><td><%=request.getParameter("gender5") %></td></tr>
</table>
<br>
<button onclick="window.history.back()">edit</button>
<button onclick="">Book</button>
</body>
</html>