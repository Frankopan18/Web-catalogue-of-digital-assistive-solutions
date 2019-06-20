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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
body {
	font-family: Arial;
	background-color: #0e1111;
	font-size: 14px;
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

hr {
	border: 0;
	clear: both;
	display: block;
	width: 96%;
	color: white;
	height: 1px;
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

table {
	border-spacing: 0;
	width: 100%;
}

.main {
	margin-left: 240px; /* Same as the width of the sidenav */
	font-size: 14px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}
</style>
<body>
	<sql:setDataSource var="myDatabase" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://127.0.0.1/mydb?useUnicode=true&characterEncoding=utf8&useTimezone=True&serverTimezone=UTC"
		user="Fran" password="fran123" />

	<sql:query var="listCatalogs" dataSource="${myDatabase}">
        SELECT * FROM Administrator where username<>'topuser';
    </sql:query>
	<div align="center">
		<input type="button" value="Povratak" onclick="history.back(-1)"
			class="btn btn-primary" style="float: left; width: 150px;" />
		<form action="" method="put" style="width: 700px; margin: 0 auto;">
			<input type="text" name="searchbox" id="myInput"
				onkeyup="myFunction()" Placeholder="Unesi ime/mail korisnika..."
				style="display: inline; max-width: 300px; color: #941E3C; font-weight: bold">
			<input type="submit" value="Traži"
				style="display: inline; color: #FFFF00; background-color: #4B0082; max-width: 180px"
				class="btn btn-primary">
		</form>

		<br/>
		<form action="/onlinecatalogue/dodajAdministrator.jsp" method="get">
			<button type="Submit">Dodaj administratora</button>
		</form>

		<br /> <br /> <br />
		<table cellpadding="5" id="myTable" class="table table-bordered">
			<th>Email</th>
			<th>Lozinka</th>
			<th>Korisničko ime</th>
			<c:forEach var="itemCatalog" items="${listCatalogs.rows}">

				<tr>
					<td>${itemCatalog.Email}</td>
					<td>${itemCatalog.Password}</td>
					<td>${itemCatalog.Username}</td>
					<td>
						<form action="/onlinecatalogue/izbrisiAdmin?id=${itemCatalog.Email}"
							method="post">
							<button type="Submit"
								style="background-color: transparent; border-color: transparent; float: left; left: 0px; width: 10px;">
								<font color="blue">Obriši</font>
							</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<form action="/onlinecatalogue/logout" method="get" align="right">
		<label class="logoutLblPos">
			<button type="Submit"
				style="float: right; background-color: transparent; border-color: transparent"top:"0px";right:"0px">Logout</button>
		</label>
	</form>
</body>
<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>
</html>