<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import=" java.io.IOException,java.sql.CallableStatement, java.sql.Connection,java.sql.DriverManager,java.sql.Types,javax.servlet.RequestDispatcher,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function BOOK(){
	 var request;
	if(window.XMLHttpRequest){  
		request=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		request=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	var url="BookTickets.jsp"; 
	
	
}
</script>
</head>
<%
 ArrayList<Pasenger> pl=new ArrayList<>();

%>
<body>
<h2>Travel details</h2>
<table border = "1">

<% 
Double fare = 0.0;
Double tcost=0.0;
ArrayList<Double> individualFare =new ArrayList<>();
try {
	String a = request.getParameter("to");
	String b = request.getParameter("from");
	String tno = request.getParameter("train_no");
	String classType = request.getParameter("train_class");

	Class.forName("org.postgresql.Driver");
	Connection c = DriverManager.getConnection("jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
	CallableStatement cstmt = c.prepareCall("CALL trainFare(?, ?, ?, ?, ?)");
	cstmt.setString(1, a);
	cstmt.setString(2, b);
	cstmt.setInt(3, Integer.parseInt(tno));
	cstmt.setString(4, classType);
	cstmt.setInt(5, 0);
	cstmt.registerOutParameter(1, Types.NUMERIC); // Register output parameter
	cstmt.execute();
	 Object fp = cstmt.getObject(1);
     fare = (fp != null) ? ((Number) fp).doubleValue() : null;

	cstmt.close();
	c.close();
} catch (Exception e) {
	e.printStackTrace();
}
//System.out.print(ticketCost);
System.out.print(fare);
for(int i=1;i<6;i++){
	 //String pname = request.getParameter("pname" + i);
	 Double ticketCost=0.0;
     int age = Integer.parseInt(request.getParameter("age" + i));
     //String gender = request.getParameter("gender" + i);
     
     if (age > 65 )//&& gender.equals("male")) || (age > 58 && gender.equals("female")))
			{ticketCost = fare * 0.75;System.out.print(ticketCost);}
	 else if (age < 12)
	 {			ticketCost = fare * 0.50;System.out.print(ticketCost);}
	 else
			ticketCost = fare;
     
     System.out.print(ticketCost);
     individualFare.add(ticketCost);
     tcost+=ticketCost;
}


%>

<tr><td><b>source</b></td><td><%=request.getParameter("from") %></td></tr>
<tr><td>destination</td><td><%=request.getParameter("to") %></td></tr>
<tr><td>train name</td><td><%=request.getParameter("train") %></td></tr>
<tr><td>train number</td><td><%=request.getParameter("train_no") %></td></tr>
<tr><td>class</td><td><%=request.getParameter("train_class") %></td></tr>
<tr><td>date</td><td><%=request.getParameter("date") %></td></tr>
<tr><td>fare</td><td><%=tcost %></td></tr>
</table>
<h2>Passengers</h2>
<table border = "1">
<tr><td>NAME</td><td>AGE</td><td>GENDER</td><td>fare</td></tr>
<tr><td><%=request.getParameter("name1") %></td><td><%=request.getParameter("age1") %></td><td><%=request.getParameter("gender1") %></td><td><%=individualFare.get(0) %></td></tr>
<tr><td><%=request.getParameter("name2") %></td><td><%=request.getParameter("age2") %></td><td><%=request.getParameter("gender2") %></td><td><%=individualFare.get(1) %></td></tr>
<tr><td><%=request.getParameter("name3") %></td><td><%=request.getParameter("age3") %></td><td><%=request.getParameter("gender3") %></td><td><%=individualFare.get(2) %></td></tr>
<tr><td><%=request.getParameter("name4") %></td><td><%=request.getParameter("age4") %></td><td><%=request.getParameter("gender4") %></td><td><%=individualFare.get(3) %></td></tr>
<tr><td><%=request.getParameter("name5") %></td><td><%=request.getParameter("age5") %></td><td><%=request.getParameter("gender5") %></td><td><%=individualFare.get(4) %></td></tr>
</table>
<br>
<button onclick="window.history.back()">edit</button>
<button onclick="BOOK()">Book</button>
</body>
</html>