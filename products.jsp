<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Products</title>
  <link rel="stylesheet" href="accounts.css">
  <script>
  function submitForm() {
	     document.getElementById("shoe").submit();
	}
	</script>
</head>
<body>

<div class="navbar" id="navbar">
  <a href="Index.html">Home</a>
  <a href="Accounts.html">Account Login</a>
</div>

<div class = "row">

  <h2 style = "padding-left: 3%">Select Your Shoe Type</h2>
  <div class = "leftcolumn">
    <div class = "container">
      <div class = "card" style="text-align: left; margin-left: 10px">
        <div style = "margin-left: 5%">
    <form id="shoe" action="ResponseServlet" onclick=submitForm()>
      <br>

      <p>Select Shoe Type</p>
       <input type="radio" id="men" name="type" value="men">
       <label for="men">Men</label><br>
       <input type="radio" id="women" name="type" value="women">
       <label for="women">Women</label><br>
       <input type="radio" id="kids" name="type" value="kids">
       <label for="kids">Kids</label>

      <br>

      <p>Select Shoe Brand</p>
      <input type="radio" id="nike" name="brand" value="nike">
      <label for="nike">Nike</label><br>
      <input type="radio" id="puma" name="brand" value="puma">
      <label for="puma">Puma</label><br>
      <input type="radio" id="newbalance" name="brand" value="new balance">
      <label for="newbalance">New Balance</label>

      <br>

      <p>Select Shoe Category</p>
      <input type="radio" id="tennis" name="category" value="tennis">
      <label for="tennis">Tennis</label><br>
      <input type="radio" id="running" name="category" value="running">
      <label for="running">Running</label><br>
      <input type="radio" id="basketball" name="category" value="basketball">
      <label for="basketball">Basketball</label><br>

      <br>

    </form>
        </div>
    </div>
  </div>
  </div>
  
  <!-- Assigning the datasource by providing the link for database with username and password -->
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://database-1.cdh305awjour.eu-west-1.rds.amazonaws.com:3306/shoedata"
  		  user = "admin"  password = "ee417web"/>
  		  
  <!-- Writing an SQL query for selecting columns from the table from mydatabase.customers -->
     <sql:query dataSource = "${snapshot}" var = "result">
	SELECT name, brand, picture, price FROM shoedata.shoes
	WHERE type = "<%=request.getAttribute("type")%>" OR brand="<%=request.getAttribute("brand")%>" OR category="<%=request.getAttribute("category")%>" </sql:query>
<div class="rightcolumn">

	<c:forEach var = "row" items = "${result.rows}">
	<div class="cardcolumn">
    <div class="card">
      <h3 class = "product"><c:out value = "${row.brand}"/></h3>
      <img src="images/${row.picture}" alt="<c:out value = "${row.name}"/>" style="width:100%; height:150px"/>
      <p class="price">$<c:out value = "${row.price}"/></p>
      <p class = "info"><c:out value = "${row.name}"/></p>
      <p><button class ="AddToCart">Add to Cart</button></p>
    </div>
  </div>
  </c:forEach>
</div>
</div>
</body>
</html>