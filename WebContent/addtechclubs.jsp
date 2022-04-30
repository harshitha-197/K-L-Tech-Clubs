<!DOCTYPE html>
<html>
<head> 
<title>Add Technical CLub</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	             <div class="navbar" align="center">
               <div class="menu" align="center">
                <a href="adminhome.jsp">Home</a>
                <a href="adminclub.jsp">Club Monitoring</a>
                <a href="adminevent.jsp">Add Events</a>
                <a href="logout">Logout</a>
               </div>
            </div>
<h1 align="center">Add Club</h1><br><br>
<div class="reg-box">
<form name="f" action="addTechClub" class="reg" method="post">
<table align="center" cellspacing = "2" cellpadding = "2">
  <tr>
  <th><h4>Enter Club Name</h4></th>
    <th><input type="text" name="name" placeholder="Enter Club Name" required></th>
  </tr>
  <tr>
    <th><h4>Enter Description<br></h4></th>
    <th><input type="text-box" name="des" placeholder="Enter Description" required></th>
  </tr>
    <tr>
  <th><h4>Enter Category</h4></th>
    <th><input type="text" name="cat" placeholder="Enter Category" required></th>
  </tr>
  <tr  >
 <th>  <label for="img">Select image:</label></th>
  <th><input type="file" id="img" name="img" accept="image/*"></th>
  <!--  <th><input type="submit">-->
  </tr>

  <tr align="center">
    <td colspan=2><button type = "submit">ADD</button></td>
  </tr>
</table>
</form>
</div>
</body>
</html>