<html>
    <head>
        <title>Login Form</title>
        <link rel="stylesheet" href="styless.css">
    </head>
    <body  style=" background-image: url('download1.jpg');background-size: cover;">
 
        <div class="hero">
                     <div class="navbar" align="center">
               <div class="menu" align="center">
                <a href="home.jsp">Home</a>
                <a href="about.html">About</a>
                <a href="login.html">Register</a>
                <a href="login.html">Login</a>
               </div>
            </div>
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="signin()">Sign In</button>
                </div>    
             <div class="social-icons">
                    <img src="facebook.png">
               
                    <img src="github.png">
                </div>
                <form id="signin" class="input-group" onsubmit="insignin()" method="POST" action="checklogin1">
                     <input type="email" class = "input-field" id="myEmail" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Email" required>
                    <input type="password" class="input-field" id="in-password" name="pwd" placeholder="Password" required>
                    <input type="checkbox" class="check-box"><span>Remember Password</span>
                    <button type="submit" class="submit-btn" >Sign In</button>
          
                </form>

            </div>
        </div>
        <script>
            var x = document.getElementById("signin");
            var y = document.getElementById("signup");
            var z = document.getElementById("btn");
            function signup(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            function signin(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }
            function insignin(){
                var emailId = document.getElementById("in-emailId").value;
                var password = document.getElementById("in-password").value;
                var e=0,p=0;
                if(emailId == "pharshitha019@gmail.com"){
                    e=1;
                }
                if(password == "harshi19") {
                    p=1;
                }
                if(p == 0 && e == 0) {
                    alert("Missing Credentials");
                } else if(e == 0) {
                    alert("Wrong EmailId");
                } else if(p == 0) {
                    alert("Wrong Password");
                } else {
                    window.location = "href=home.html";
                }
            }
            function upsignup(){
                var name = document.getElementById("name").value;
                var emailId = document.getElementById("up-emailId").value;
                var password = document.getElementById("up-password").value;
                var e = false,p = false,n = false;
                if(name != "") {
                    n = true;
                } if(emailId != "") {
                    e = true;
                } if(password != "") {
                    p = true;
                }
                if(!(n && e && p)) {
                    alert("Missing The Credentials");
                } else if(document.getElementById("up-checkbox").checked == false){
                    alert("Please Agree To The Terms And Conditions");
                } 
            }
        </script>
    </body>
</html>