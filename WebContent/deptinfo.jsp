<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, javax.sql.*, java.util.*, java.io.*"%>
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
		  String imgPath = "displayimg.jsp?name="+rs.getString(2);
		  String delPath = "deletedept?name="+rs.getString(2);
		  %>
		  <h1> Name: <%=rs.getString(2) %></h1>
		  <img src=<%=imgPath %>>
		  <h3>Description:</h3>
		  <p><%=rs.getString(3) %></p>
		  <button class="button"><a href=<%=delPath %> class="button a">Delete</a></button>
		  <%
	  	}
	}
	catch(Exception e) {
		
	}
%>

</center>


