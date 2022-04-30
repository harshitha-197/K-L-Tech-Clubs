<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, javax.sql.*, java.util.*, java.io.*"%>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/jpeg" sizes="60x60" href="download1.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="bootstrap-4.css">
	<link rel="stylesheet" href="home-styles.css"">
	<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
</head>
<style>
body{
background: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url('stdclbbg.jpg') no-repeat center center fixed;
    -moz-background-size: cover;
    -webkit-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
</style>
<body>
<br>
   <div class="navbar" align="center">
               <div class="menu" align="center">
                <a href="adminhome.jsp">Home</a>
                <a href="adminclub.jsp">Clubs</a>
                <a href="addtechclubs.jsp">Add Tech Club</a>
                <a href="logout">Logout</a>
               </div>
            </div>	
<section class="gallery">
		<h1>Technical Clubs We have</h1>
		<div class="container">
			<div class="row">
				<%
				String Classname = "oracle.jdbc.driver.OracleDriver";
				String url = "jdbc:oracle:thin:@localhost:1521:XE";
				String username = "ep";
				String password = "ep";
				response.setContentType("text/html");
				Connection con = null;
			    try {
			    
			      Class.forName(Classname);
			      con = DriverManager.getConnection(url, username, password);
			      
			      PreparedStatement pstmt = con.prepareStatement("select * from techclubs");
			      ResultSet rs = pstmt.executeQuery();
			      
			      while(rs.next()) {
			    	  String path = "techclubinfo.jsp?name="+rs.getString(2);
			    	  String imgPath = "displayimg.jsp?name="+rs.getString(2);
			    	  %>
			    	  <div class="col-md-4">
						<div class="gallery-box">
							<div class="feature-img">
								<a href="<%=path %>"> 
									<img src=<%=imgPath %>> 
								</a> 
							</div>

							<div class="feature-details">
								<p><h3><%=rs.getString(2) %></h3><br></p>
							</div>
							
						</div>
					</div>
					<%
			      }
			      
			    }
			    catch(Exception e) {
			    	System.out.println(e);
			    }
			   
			      %>
				

		</div>
	</section>
</body>
</html>