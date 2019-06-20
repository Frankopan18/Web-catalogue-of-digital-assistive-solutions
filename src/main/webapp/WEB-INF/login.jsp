<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Web katalog digitalnih asistivnih rješenja</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ page contentType="text/html; charset=UTF-8"%>
<style>
body {
	font-family: Arial;
	background-color: #0e1111;
	font-size: 14px;
}

input[type=text], input[type=password], input[type=username], input[type=email]
	{
	display: block;
	margin: auto;
	max-width: 20em;
	width: 50%;
	border: 1px solid #818181;
	padding: 5px;
}

button {
	background-color: #4B0082;
	color: yellow;
	display: block;
	margin: auto;
	max-width: 20em;
	width: 50%;
	border: 1px solid #818181;
	padding: 5px;
	border: 1px solid #818181
}

.btn-primary {
	background-color: #4B0082;
	color: yellow;
	display: block;
	margin: auto;
	max-width: 20em;
	width: 50%;
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
	color: yellow;
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

.vertical-center {
	height: 100%;
	width: 100%;
	max-height: 50px;
	/* align the inline(-block) elements horizontally */
	font: 0/0 a;
	text-align: center;
	/* remove the gap between inline(-block) elements */
}

.vertical-center:before {
	/* create a full-height inline block pseudo=element */
	content: " ";
	display: inline-block;
	vertical-align: middle; /* vertical alignment of the inline element */
	height: 100%;
}

.jumbotron {
	max-height: 180px;
	font-family: Arial;
}

.footer{ 
       position: fixed;     
       text-align: center;    
       bottom: 0px; 
       width: 100%;
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

	<div class="container text-center">
		<h1>
			<font color="yellow" style="font-family: URW Chancery L, cursive;">
				Web katalog digitalnih asistivnih rješenja</font>
		</h1>
		<font color="yellow" style="font-family: URW Chancery L, cursive;">
			Digitalno asistivno rješenje je aplikacija dizajnirana za osobe s
			poteškoćama kao oblik postpomognute komunikacije</font>
		<div style="text-align: right;">
			<font color="yellow" style="font-family: URW Chancery L, cursive;">Verzija
				1/2/<b>3</b> : 2016/2017/<b>2019</b>
		</div>
	</div>


	<br />
	<br />
	<form method="post" action="/onlinecatalogue/index.jsp">
		<input type="text" name="email" placeholder="E-Mail"
			class="form-control" required autofocus="" value="${mail }" />
		<c:if test="${not empty poruka }">
			<span>${poruka}</span>
		</c:if>
		<br /> <input type="password" name="lozinka" placeholder="Lozinka"
			required class="form-control" /> <br />
		<button name="Submit" value="Login" type="Submit"
			class="btn btn-primary">Login</button>
	</form>

	<form action="/onlinecatalogue/register.jsp" method="get">
		<button type="Submit" class="btn btn-primary">Registriraj se</button>
	</form>

<div class="footer">
	<font color="yellow" style="font-family: URW Chancery L, cursive;">© Sveučilište
		u Zagrebu, Fakultet Elektrotehnike i Računarstva</font>
</div>
</body>
</html>

