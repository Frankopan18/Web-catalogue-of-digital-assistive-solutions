<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
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

.jumbotron {
	max-height: 180px;
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
@media screen and (max-height: 450px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 16px;
	}
}

.logoutLblPos {
	position: fixed;
	right: 50px;
	top: 5px;
}

.column {
	float: left;
	width: 50%;
	padding: 10px;
}

/* Clear floats after the columns */
.row:after {
	clear: both;
}

table {
	border-spacing: 0;
	width: 100%;
}

td.border {
	outline: thin solid #FF67CD;
}

.sidenav {
	height: 100%;
	width: 240px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 20px;
	text-align: center;
	border-right: 1px solid #ddd;
}

.sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
}

.sidenav a:hover {
	color: #f1f1f1;
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
        SELECT * FROM Katalog;
    </sql:query>
	<br />
	<!Here later on instead of blank action you will provide /onlinecatalogue/search where you will maybe need JSTL coz other parameters will be
	also categories(you will definitely need JSTL) to see what all things user wants to filter,you will need servlet which does a get method,that's it
	,same page as this one,only filtered,now it works if you put end of form tag before input tag--->
	<div class="sidenav">
		<br /> <b style="font-size: 20px;">Prikaži rezultate za</b>
		<hr color="white">
		<u>Vrsta teškoće</u><br /> <br /> Kognitivne <input type="checkbox"
			rel="difficultycheckBox" value="Kognitivne poteškoće">
		Motoričke <input type="checkbox" rel="difficultycheckBox"
			value="Motoričke poteškoće"><br /> Teškoća sluha <input
			type="checkbox" value="Poteškoće sluha" rel="difficultycheckBox">
		Teškoća vida <input type="checkbox" value="Poteškoće vida"
			rel="difficultycheckBox"> <font text-align="center">Višestruke
			&nbsp;</font><input type="checkbox" value="Višestruke poteškoće"
			rel="difficultycheckBox">
		<!-- <u>ICT uređaj</u><br /> <br /> Pametni telefon <input
			type="checkbox" class="deviceCheckBox" value="Pametni telefon"
			data-type="deviceCheckBox"> Pametni sat <input
			type="checkbox" class="deviceCheckBox" value="Pametni sat"
			data-type="deviceCheckBox"><br /> <br /> Tablet <input
			type="checkbox" class="deviceCheckBox" value="Tablet"
			data-type="deviceCheckBox"> Računalo <input type="checkbox"
			class="deviceCheckBox" value="Računalo" data-type="deviceCheckBox">
		<hr color="white">
		<u>Asistivna tehnologija</u><br /> <br /> Hardverska <input
			type="checkbox" class="deviceCheckBox" value="Hardverska"
			data-type="deviceCheckBox"> Softverska <input type="checkbox"
			class="deviceCheckBox" value="Softverska"><br /> Hardverska
		i softverska <input type="checkbox" class="deviceCheckBox"
			value="Hardverska i softverska" data-type="deviceCheckBox"> -->
		<hr color="white">
		<u>Vrsta primjene</u><br /> <br /> Edukacija <input type="checkbox"
			rel="typeCheckBox" value="Edukacija"> Komunikacija <input
			type="checkbox" rel="typeCheckBox" value="Komunikacija"><br />
		Rehabilitacija <input type="checkbox" rel="typeCheckBox"
			value="Rehabilitacija"> Druge primjene <input type="checkbox"
			rel="typeCheckBox" value="Druge primjene">
		<hr color="white">
		<u>Platforma</u><br /> <br /> Specifične platforme <input
			type="checkbox" rel="platformCheckBox" value="Specifične platforme">
		Android <input type="checkbox" rel="platformCheckBox" value="Android">
		Windows <input type="checkbox" rel="platformCheckBox" value="Windows">
		iOS <input type="checkbox" rel="platformCheckBox" value="iOS"><br />
		Tizen <input type="checkbox" rel="platformCheckBox" value="Tizen">
		Linux <input type="checkbox" rel="platformCheckBox" value="Linux">
		<!-- <hr color="white">
		<u>Dostupnost</u><br /> <br /> Široka upotreba <input
			type="checkbox" class="availabilityCheckBox" value="U upotrebi"
			data-type="availabilityCheckBox"> Inovativno <input
			type="checkbox" class="availabilityCheckBox" value="Inovativno"
			data-type="availabilityCheckBox"> -->
		<hr color="white">
		<u>Jezici</u><br /> <br /> Hrvatski <input type="checkbox"
			rel="langCheckBox" value="Hrvatski"> Engleski <input
			type="checkbox" rel="langCheckBox" value="Engleski">
		<hr color="white">
		<u>Cijena</u><br /> <br /> Besplatno <input type="checkbox"
			rel="priceCheckBox" value="Besplatno"> Nije besplatno <input
			type="checkbox" rel="priceCheckBox" value="Nije besplatno"
			data-type="priceCheckBox">
		<hr color="white">
		<form action="/onlinecatalogue/statistike" method="get">
			<button type="Submit" class="btn btn-primary">Statistika</button>
		</form>
	</div>
	<div align="center" class="main">
		<form action="/onlinecatalogue/katalog.jsp" method="get"
			style="width: 700px; margin: 0 auto;">
			<input type="text" name="searchbox" id="myInput"
				onkeyup="myFunction()"
				Placeholder="Pretraga po proizvođaču/imenu..."
				style="display: inline; max-width: 300px; color: #941E3C; font-weight: bold">
			<input type="submit" value="Traži"
				style="display: inline; color: #FFFF00; background-color: #4B0082; max-width: 180px"
				class="btn btn-primary">
		</form>
		<br />
		<table cellpadding="5" id="myTable" class="table" name="StatusTable">
			<thead>
				<tr id="catalogID" class="first">
					<th></th>
					<th></th>
					<th>Cijena</th>
					<th>Jezici</th>
					<th>Vrsta Teškoće</th>
					<th>Platforma</th>
					<th>Vrsta primjene</th>
				</tr>
			</thead>
			<c:forEach var="itemCatalog" items="${listCatalogs.rows}">
				<tr style="outline: thin solid #DCDCDC;">
					<td class="column"><img src="image/Tech${itemCatalog.ID}"
						height="150px" width="250px" /></td>
					<td rel="" style="width: 200px"><u><i
							style="font-size: 16px;">${itemCatalog.Naziv}</i></u><br />Link: <a
						href="${itemCatalog.Link}" target="_blank">${itemCatalog.Link}</a></font></b>
						<br />Proizvođač: ${itemCatalog.Proizvodjac}<br />
						<form action="/onlinecatalogue/tech?id=${itemCatalog.ID}"
							method="post" target="_blank" align="left">
							<button type="Submit"
								style="background-color: transparent; border-color: transparent; float: left; left: 0px; width: 10px;">
								<b><font size="4px">Detalji</font></b>
							</button>
						</form></td>
					<c:set var="priceTag" value="${itemCatalog.Cijena}" />
					<c:set var="priceTag1"
						value="${fn:replace(priceTag, 'besplatno', 'Besplatno')}" />
					<c:choose>
						<c:when test="${fn:contains(priceTag1, 'Besplatno')}">
							<c:set var="priceTag1" value="Besplatno" />
						</c:when>
						<c:otherwise>
							<c:set var="priceTag1" value="Nije besplatno" />
						</c:otherwise>
					</c:choose>
					<td rel="${priceTag1}" class="priceCheckBox" style="width: 10%"><font
						size="4px"> ${itemCatalog.Cijena}</font></td>
					<c:set var="lang" value="${itemCatalog.Jezici}" />
					<c:set var="lang1"
						value="${fn:replace(lang, 'engleski', 'Engleski')}" />
					<c:set var="lang2"
						value="${fn:replace(lang, 'hrvatski', 'Hrvatski')}" />
					<c:choose>
						<c:when test="${fn:contains(lang2, 'Engleski')}">
							<c:set var="lang2" value="Engleski" />
						</c:when>
						<c:when test="${fn:contains(lang2, 'Hrvatski')}">
							<c:set var="lang2" value="Hrvatski" />
						</c:when>
					</c:choose>
					<td rel="${lang2}" class="langCheckBox"><b><font
							color="#DDA0DD"></font></b> ${itemCatalog.Jezici}</td>

					<c:set var="theDiff" value="${itemCatalog.VrstaPoteskoce}" />
					<c:if test="${fn:contains(theDiff, 'Višestruke poteškoće')}">
						<c:set var="theDiff" value="Višestruke poteškoće" />
					</c:if>
					<td rel="${theDiff}" class="difficultycheckBox">
						${itemCatalog.VrstaPoteskoce}</td>
					<c:set var="platforma" value="${itemCatalog.Platforma}" />

					<c:if test="${fn:contains(platforma, 'Windows')}">
						<c:set var="platforma" value="Windows" />
					</c:if>
					<c:if test="${fn:contains(platforma, 'Linux')}">
						<c:set var="platforma" value="Linux" />
					</c:if>
					<c:if test="${fn:contains(platforma, 'iOS')}">
						<c:set var="platforma" value="iOS" />
					</c:if>
					<c:if test="${fn:contains(platforma, 'Android')}">
						<c:set var="platforma" value="Android" />
					</c:if>

					<td rel="${platforma}" class="platformCheckBox">${itemCatalog.Platforma}</td>
					<c:set var="typeUsage" value="${itemCatalog.VrstaPrimjene}" />
					<c:set var="typeUsage1"
						value="${fn:replace(typeUsage, 'edukacija', 'Edukacija')}" />
					<c:set var="typeUsage2"
						value="${fn:replace(typeUsage1, 'rehabilitacija', 'Rehabilitacija')}" />
					<c:set var="typeUsage3"
						value="${fn:replace(typeUsage2, 'druge primjene', 'Druge primjene')}" />
					<c:if test="${fn:contains(typeUsage3, 'Rehabilitacija')}">
						<c:set var="typeUsage3" value="Rehabilitacija" />
					</c:if>
					<c:if test="${fn:contains(typeUsage3, 'Edukacija')}">
						<c:set var="typeUsage3" value="Edukacija" />
					</c:if>
					<c:if test="${fn:contains(typeUsage3, 'Druge primjene')}">
						<c:set var="typeUsage3" value="Druge primjene" />
					</c:if>
					<c:if test="${fn:contains(typeUsage3, 'Komunikacija')}">
						<c:set var="typeUsage3" value="Komunikacija" />
					</c:if>
					<td rel="${typeUsage3}" class="typeCheckBox">${itemCatalog.VrstaPrimjene}</td>
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
	<script>
		function myFunction() {
			var input, filter, table, tr, td, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
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
	<script>
		function sortTable(n) {
			var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			table = document.getElementById("myTable");
			switching = true;
			// Set the sorting direction to ascending:
			dir = "asc";
			/* Make a loop that will continue until
			no switching has been done: */
			while (switching) {
				// Start by saying: no switching is done:
				switching = false;
				rows = table.getElementsByTagName("TR");
				/* Loop through all table rows (except the
				first, which contains table headers): */
				for (i = 1; i < (rows.length - 1); i++) {
					// Start by saying there should be no switching:
					shouldSwitch = false;
					/* Get the two elements you want to compare,
					one from current row and one from the next: */
					x = rows[i].getElementsByTagName("TD")[n];
					y = rows[i + 1].getElementsByTagName("TD")[n];
					/* Check if the two rows should switch place,
					based on the direction, asc or desc: */
					if (dir == "asc") {
						if (x.innerHTML.toLowerCase() > y.innerHTML
								.toLowerCase()) {
							// If so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					} else if (dir == "desc") {
						if (x.innerHTML.toLowerCase() < y.innerHTML
								.toLowerCase()) {
							// If so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					}
				}
				if (shouldSwitch) {
					/* If a switch has been marked, make the switch
					and mark that a switch has been done: */
					rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
					switching = true;
					// Each time a switch is done, increase this count by 1:
					switchcount++;
				} else {
					/* If no switching has been done AND the direction is "asc",
					set the direction to "desc" and run the while loop again. */
					if (switchcount == 0 && dir == "asc") {
						dir = "desc";
						switching = true;
					}
				}
			}
		}
	</script>
	<script>
		//backend for filtering,works on everything,hopefully

		$("input:checkbox").click(
				function() {
					var showAll = true;
					$('tr').not('.first').hide();
					$('input[type=checkbox]').each(
							function() {
								if ($(this)[0].checked) {
									showAll = false;
									var status = $(this).attr('rel');
									var value = $(this).val();
									$('td.' + status + '[rel="' + value + '"]')
											.parent('tr').show();
								}
							});
					if (showAll) {
						$('tr').show();
					}
				});
	</script>
</body>
</html>