<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Web katalog digitalnih asistivnih rješenja</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;background-color: #404040;}
input[type=text], input[type=password] {
    display: block;
    margin: auto;
    max-width: 20em;
    width: 50%; 
    border: 1px solid #818181;
    padding: 5px;
    
}

button {
    background-color: #4CAF50;
    color: white;
    display: block;
    margin: auto;
    max-width: 20em;
    width: 50%; 
    border: 1px solid #818181;
    padding: 5px;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.headlinecontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    color:yellow;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
</head>
<body>
		<form method="post" action="/onlinecatalogue/index.jsp">
	
			  <div class="headlinecontainer">
				<b>Web katalog digitalnih asistivnih rješenja</b>
  			</div>
			<input type="text" name="mail" placeholder="E-Mail" required autofocus="" value="${mail }" /> 
			<c:if test="${not empty poruka }">
					<span>${poruka}</span>
				</c:if><br/>
			<input type="password" name="lozinka" placeholder="Lozinka" required />
			<br/>
			<button name="Submit" value="Login" type="Submit">Login</button>
		</form>
		
		<form action="/onlinecatalogue/register.jsp" method="get">
    		<button type="Submit">Register</button>
		</form>
</body>
</html>

