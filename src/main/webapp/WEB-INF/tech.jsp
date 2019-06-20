<!DOCTYPE html>
<html>
<head>
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

.main {
	margin-left: 160px; /* Same as the width of the sidenav */
	font-size: 16px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}
</style>
<body>
	<sql:setDataSource var="myDatabase" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://127.0.0.1/mydb?useUnicode=true&characterEncoding=utf8&useTimezone=True&serverTimezone=UTC"
		user="Fran" password="fran123" />

	<sql:query var="listCatalogs" dataSource="${myDatabase}">
        SELECT * FROM Katalog where id=${param.id};
    </sql:query>
	<br />
	<br />
	<div align="left" class="main">
		<div>
			<c:forEach var="itemCatalog" items="${listCatalogs.rows}">
				<b>Naziv digitalnog asistivnog rješenja : </b>${itemCatalog.Naziv}<br />
				<b> Cijena : </b>${itemCatalog.Cijena}<br />
				<b> Proizvođač :</b> ${itemCatalog.Proizvodjac}<br />
				<b>Link :</b>
				<a href="${itemCatalog.Link}" target="_blank">${itemCatalog.Link}</a>
				<br />
				<b>Jezici : </b> ${itemCatalog.Jezici}<br />
				<b>Mjesto primjene : </b> ${itemCatalog.MjestoPrimjene}<br />
				<c:set var="string1" value="${itemCatalog.VrstaPoteskoce }" />
				<c:set var="string2" value="${fn:replace(string1, 'poteškoće', '')}" />
				<b>Vrsta teškoće : </b> ${string2}<br />
				<b>Vrsta primjene : </b> ${itemCatalog.VrstaPrimjene}<br />
				<b>ICT uređaji : </b> ${itemCatalog.ICTUredjaj}<br />
				<c:set var="string3" value="${itemCatalog.AsistivnaTehnologija}" />
				<c:set var="string4" value="${fn:replace(string3, '-', 'Nema ih')}" />
				<b>Asistivne tehnologije : </b> ${string4}<br />
				<b>Dostupnost : </b>${itemCatalog.Dostupnost}<br />
				<b>Platforma:</b>  ${itemCatalog.Platforma}<br />
				<c:set value="${itemCatalog.Recenzije}" var="rec" />
				<div id="recenzije"></div>
				<script>
					var message = (function(name) {
						var div = document.getElementById("recenzije");
						var message = "<b>Recenzije:</b> " + '${rec}';
						//div.innerHTML = message;
						var text = message;
						var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
						var text1 = text.replace(exp,
								'<a target="_blank" href="$1">$1</a>');
						var exp2 = /(^|[^\/])(www\.[\S]+(\b|$))/gim;
						document.getElementById("recenzije").innerHTML = text1
								.replace(exp2,
										'$1<a target="_blank" href="http://$2">$2</a>');
					})();
				</script>
				<b>Uporabljivost :</b> ${itemCatalog.Uporabljivost}<br />
				<br />
				<br />
				<br />
				<div style="text-align: center";>
					<b>Kratki opis :</b>${itemCatalog.Opis}<br />
				</div>
			</c:forEach>
		</div>
		<form action="/onlinecatalogue/logout" method="get" align="right">
			<label class="logoutLblPos">
				<button type="Submit"
					style="float: right; background-color: transparent; border-color: transparent; top: 0px; right: 0px">Logout</button>
			</label>
		</form>
</body>
</html>