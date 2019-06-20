<!DOCTYPE html>
<html>
<head>

<%@ page contentType="text/html; charset=UTF-8"%>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #404040;
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
		<div class="box">
			<div class="headlinecontainer">
				<b>Novi korisnik</b>
			</div>
			<form action="/ednevnik/register.jsp" method="post">
				<input type="username" name="username" placeholder="Username" /><br />
				<input type="email" name="email" placeholder="E-Mail" />
				<br />
				<input type="password" name="pass" placeholder="Password" />
				<br/> <br/>
				<button type="submit" id="login-button">Register</button>
			</form>
		</div>
</body>
</html>
