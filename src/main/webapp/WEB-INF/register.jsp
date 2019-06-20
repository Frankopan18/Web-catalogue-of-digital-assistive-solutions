<!DOCTYPE html>
<html>
<head>
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
	max-height: 150px;
	text-align: center;
	/* align the inline(-block) elements horizontally */
	font: 0/0 a;
	text-align: center;
	/* remove the gap between inline(-block) elements */
}

.jumbotron{
	max-height : 180px;
	font-family: Arial;
}


.vertical-center:before {
	/* create a full-height inline block pseudo=element */
	content: " ";
	display: inline-block;
	vertical-align: middle; /* vertical alignment of the inline element */
	height: 100%;
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
	<div class="jumbotron vertical-center">
		<h1>Web katalog digitalnih asistivnih rješenja</h1>
	</div>

	<div class="headlinecontainer">
		<h1>
			<b>Novi korisnik</b>
		</h1>
	</div>
	<form action="/onlinecatalogue/register.jsp" method="post">
		<input type="username" name="username" placeholder="Username"
			class="form-control" /><br /> <input type="email" name="email"
			placeholder="E-Mail" class="form-control" /> <br /> <input
			type="password" name="pass" placeholder="Password"
			class="form-control" /> <br /> <br />
		<button type="submit" id="login-button" class="btn btn-primary">Potvrdi registraciju</button>
	</form>

	<br />
	<form action="/onlinecatalogue/index.jsp" method="get">
		<button type="Submit" class="btn btn-primary"><i class="fa fa-home"></i>Početna stranica</button>
	</form>
</body>
</html>
