<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
body {
	font-family: Arial;
	background-color: #0e1111;
	font-size: 16px;
	color: yellow;
}

.logout {
	font-size: 14px;
	color: yellow;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	grid-area: logout;
	-webkit-text-fill-color: white;
	-webkit-text-stroke-color: grey;
	-webkit-text-stroke-width: .2px;
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
	border: 1px solid #818181 color: yellow;
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

.myButton {
	padding: 10px;
	display: block;
	text-align: center;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 15px;
}

.vertical-center:before {
	/* create a full-height inline block pseudo=element */
	content: " ";
	display: inline-block;
	vertical-align: middle; /* vertical alignment of the inline element */
	height: 100%;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-height: 450px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

.logoutLblPos {
	position: fixed;
	right: 50px;
	top: 5px;
}

.main {
	font-size: 16px; /* Increased text to enable scrolling */
	padding: 0px 10px;
	margin: 0 auto;
	width: 500px;
}

.headlinecontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	color: yellow;
}
</style>
<body>
	<br />
	<br />
	<div align="left" class="main">
		<button onclick="goBack()" class="myButton"
			style="float: right; background-color: transparent; border-color: transparent; top: 0px; leftt: 0px; position: fixed;">
			<b>Povratak</b>
		</button>
		<br /> <br />

		<div class="headlinecontainer">
			<h1>
				<b>Novi administrator</b>
			</h1>
		</div>

		<form action="/onlinecatalogue/dodajAdministrator.jsp" method="post">
			<input type="username" name="username" placeholder="Username"
				class="form-control" /><br /> <input type="email" name="email"
				placeholder="E-Mail" class="form-control" /> <br /> <input
				type="password" name="pass" placeholder="Password"
				class="form-control" /> <br /> <br />
			<button type="submit" id="login-button" class="btn btn-primary">Potvrdi</button>
		</form>

		<form action="/onlinecatalogue/logout" method="get" align="right">
			<label class="logoutLblPos">
				<button type="Submit"
					style="float: right; background-color: transparent; border-color: transparent; top: 5px; right: 0px">Logout</button>
			</label>
		</form>
</body>
<script>
	function goBack() {
		window.history.back();
	}
</script>
</html>