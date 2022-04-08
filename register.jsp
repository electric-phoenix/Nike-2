<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Accounts Page</title>
  <link rel="stylesheet" href="accounts.css">
</head>
<body>

  <div id="myNav" class="AccountNav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div class="overlay-content">
      <a href="Index.html">HOME</a>
      <a href="products.html">PRODUCTS</a>
      <a href="Contact.html">CONTACT</a>
      <a href="AboutUs.html">ABOUT US</a>
    </div>
  </div>
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; MENU</span>

<div class="center">
<div class="container">
<form action="register" method="post" action="register">
    <h1>Login</h1>
    <p>Please fill in this form to register!</p>
    <hr>
     <label for="email"><b>Name</b></label>
    <input type="text" placeholder="Enter name" name="name" id="name" required>
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required>


    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

    <hr>

    <button onclick="checkPassword()" type="submit" class="loginbtn">Login</button>

   
</form>
</div>
<%
String name=(String)request.getAttribute("name");
String password=(String)request.getAttribute("password");
String email=(String)request.getAttribute("email");  
if((name!=null)&&(password!=null)&&(email!=null))
{
	
out.println("<font color=black size=8px>" +" Welcome to our website: "+name+"</font>");
out.println("<font color=black size=8px>" +" Your email: "+email+"</font>");
out.println("<font color=black size=8px>" +" Your password: "+password+"</font>");
   
} else{ 
%>
     
     <h2>  Register our website to be exclusive member of the society  </h2>
   <%
    }
  %>
  <h2>    <a href="products">Click here to see our products</a>  </h2>
</div>

<script>
  function openNav() {
    document.getElementById("myNav").style.height = "100%";
  }
  
    function closeNav() {
    document.getElementById("myNav").style.height = "0%";
  }
  function checkPassword(){
    var x = document.getElementById("psw").value;
    var y = document.getElementById("email").value;
    var numbers = /[0-9]/;
    if (x == "" || y == "") {
    alert("Both email and password must be filled out.");
    }
    else if(!numbers.test(x) && (x != "")){
      alert("Your password is weak.You may want to add a number to your password.")
    }
  }
  </script>

</body>
</html>


</body>
</html>