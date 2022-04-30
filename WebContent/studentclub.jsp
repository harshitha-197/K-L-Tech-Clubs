<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                <a href="home1.jsp">Home</a>
                <a href="studentclub.jsp">Clubs</a>
                <a href="about.html">About</a>
                <a href="logout">Logout</a>
               </div>
            </div>
<section class="gallery">
		<h1>Clubs We have</h1>
		<div class="container">
			<div class="row">
				<!-- container 1 -->
				<div class="col-md-4">
					<div class="gallery-box">
						<div class="feature-img">
						<a href="deptbodiesstu.jsp" target="_blank"> 
<img src=" student.jpg"> 
</a> 
						</div>

						<div class="feature-details">
							
							<p><h3>Department bodies</h3> <br>  </p>
						</div>
						
					</div>
				</div>
				<!--  container 2 -->
				<div class="col-md-4">
					<div class="gallery-box">
						<div class="feature-img">
							<a href="techclubsstu.jsp"> 
<img src=" technical.png"> 
</a> 
						
						</div>

						<div class="feature-details">
							
							<p><h3> Technical clubs</h3> <br></p>
						</div>
						
					</div>
				</div>
				<!-- container 3 -->
				<div class="col-md-4">
					<div class="gallery-box">
						<div class="feature-img">
						<a href="hobbyclubsstu.jsp"> 
<img src="hobby.png"> 
</a> 	
					
						</div>

						<div class="feature-details">
							<p><h3>Hobby Clubs</h3></p>
						</div>
					</div>
				</div>
			
		</div>
	</section>
</body>
</html>