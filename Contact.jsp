<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Contact Us</title>
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
	<link href="stylesheets/common.css" rel="stylesheet" type="text/css" />
	<!-- Link CSS File -->
</head>
<body>

<style>
body {
  background-image: url('images/back.PNG');
}
	
/*Navigation Bar CSS */
.navbtn {
	background-color:#0d0d0d;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
  }
  
  .navbtn:hover, .navbtn:focus {
	background-color:#8c8c8c;
  }
  
  .ContactNav {
	position: absolute;
	display: inline-block;
	left : 0.5%;
	top : 4%;
  }
  
  .Nav-Content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 140px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 1;
  }
  
  .Nav-Content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-size: 15px;
  }
  
  .ContactNav a:hover {background-color: #ddd;}
  
  .show {display: block;}
</style>
	
<!--Navigation Bar-->
      <div class="ContactNav">
      <button onclick="nav()" class="navbtn">&#9776; MENU</button>
      <div id="NavContents" class="Nav-Content">
        <a href="Index.html">HOME</a>
        <a href="Accounts.html">LOGIN</a>
        <a href="AboutUs.html">ABOUT US</a>
        <a href="products.html">PRODUCTS</a>
      </div>
      </div>

	<div class="container">
  <div style="text-align:center">
    <h2 style="padding-bottom: 50px;">Contact Us</h2>
    <p style="font-size: medium;">We would love to hear from you, please leave your contact details below:</p>
  </div>
  <div class="row">
    <div class="column">
      <img src="images/logo2.PNG" style="width:100%">
    </div>
    <div class="column">
      <form action="ContactServlet" method="post">
        <label for="fname">Full Name</label>
        <input type="text" id="fname" name="fullname" placeholder="Your name..">
        <label for="email">Email</label>
        <input type="text" id="email" name="email" placeholder="Your email..">
        <label for="country">Country</label>
        <select id="country" name="country">
          <option value="Ireland">Ireland</option>
          <option value="Germany">Germany</option>
          <option value="France">France</option>
        </select>
        <label for="subject">Subject</label>
        <textarea id="subject" name="subject" placeholder="Write something.." style="height:170px"></textarea>
        <input type="submit" value="Submit">
      </form>
    </div>
  </div>

</div>
<!-- Assigning the datasource by providing the link for database with username and password -->
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://database-1.cdh305awjour.eu-west-1.rds.amazonaws.com:3306/shoedata"
  		  user = "admin"  password = "ee417web"/>
 <% 		  
String name=(String)request.getAttribute("fname");
String email=(String)request.getAttribute("email");
String country=(String)request.getAttribute("country");
String subject=(String)request.getAttribute("subject");
%>

</div>

	<script>
            //Navigaton Bar Script
            function nav() {
            document.getElementById("NavContents").classList.toggle("show");
            }

            window.onclick = function(event) {
            if (!event.target.matches('.navbtn')) {
            var dropdowns = document.getElementsByClassName("Nav-Content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
            openDropdown.classList.remove('show');
            }
            }
            }
            }
        </script>
</body>
</html>