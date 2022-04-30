<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, javax.sql.*, java.util.*, java.io.*"%>
	<link rel="stylesheet" href="bootstrap-4.css">
	<link rel="stylesheet" href="home-styles.css">
	<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
	    <link rel="stylesheet" href="add.css">
<center class="bg">
<%
	String Classname = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "ep";
	String password = "ep";
	response.setContentType("text/html");
	String name = request.getParameter("name");
	Connection con = null;
	try {
	
	  Class.forName(Classname);
	  con = DriverManager.getConnection(url, username, password);
	  
	  PreparedStatement pstmt = con.prepareStatement("select * from deptbodies where name=?");
	  pstmt.setString(1, name);
	  ResultSet rs = pstmt.executeQuery();
	  
	  if(rs.next()) {
		  String imgPath = "displayimgdept.jsp?name="+rs.getString(2);
		  %>
		  <h1> Name: <%=rs.getString(2) %></h1>
		  <img src=<%=imgPath %>>
		  <h3>Description:</h3>
		  <p><%=rs.getString(3) %></p>
		  <%
	  	}
	}
	catch(Exception e) {
		
	}
%>
<button class="button"><a href="registration.html" class="button a">Register</a></button>	
</center>