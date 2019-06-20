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
<sql:setDataSource var="myDatabase" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://127.0.0.1/mydb?useUnicode=true&characterEncoding=utf8&useTimezone=True&serverTimezone=UTC"
		user="Fran" password="fran123" />
	<sql:query var="listCatalogs" dataSource="${myDatabase}">
        SELECT * FROM Katalog where id=${param.id};
    </sql:query>
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
				<b><u>Novo rješenje</u></b><br /> <br>
			</h1>
		</div>
		<c:forEach var="itemCatalog" items="${listCatalogs.rows}">
			<form action="/onlinecatalogue/modificirajTech?id=${param.id}"
				method="post" class="main" enctype="multipart/form-data">
				<b><i>Naziv:*</i></b>&emsp;&emsp;<input type="text" name="nameField"
					placeholder="Naziv rješenja.." value="${itemCatalog.Naziv}"
					style="color: black;" /> <br /> <br /> <b><i>Proizvođač:*</i></b>&emsp;&emsp;<input
					type="text" name="manufacterField"
					value="${itemCatalog.Proizvodjac}" style="color: black;" /> <br />
				<br /> <font color="yellow"><b><i>Vrsta poteškoće:*</i></b></font>&emsp;
				Kognitivne <input type="radio" name="difficulty" id="radio_1"
					value="Kognitivne poteškoće"> Motoričke <input type="radio"
					name="difficulty" id="radio_2" value="Motoričke poteškoće">
				<br> <br> Teškoće vida <input type="radio"
					name="difficulty" id="radio_3" value="Poteškoće vida">
				Teškoće sluha <input type="radio" name="difficulty" id="radio_4"
					value="Poteškoće sluha"> Višestruke teškoće <input
					type="radio" name="difficulty" id="radio_5"
					value="Višestruke poteškoće">
				<c:set var="disability" value="${itemCatalog.VrstaPoteskoce}" />
				<c:choose>
					<c:when test="${fn:contains(disability, 'Višestruke')}">
						<script>
							$("#radio_5").prop("checked", true);
						</script>
					</c:when>
					<c:when test="${fn:contains(disability, 'Kognitivne')}">
						<script>
							$("#radio_1").prop("checked", true);
						</script>
					</c:when>
					<c:when test="${fn:contains(disability, 'Motoričke')}">
						<script>
							$("#radio_2").prop("checked", true);
						</script>
					</c:when>
					<c:when test="${fn:contains(disability, 'vida')}">
						<script>
							$("#radio_3").prop("checked", true);
						</script>
					</c:when>
					<c:when test="${fn:contains(disability, 'sluha')}">
						<script>
							$("#radio_4").prop("checked", true);
						</script>
					</c:when>
				</c:choose>
				<br> <br> <b><i>Link:*</i></b>&emsp;&emsp;<input
					type="text" name="linkField" value="${itemCatalog.Link}"
					style="color: black; width: 550px" /> <br /> <br /> <b><i>Dostupnost:</i></b>
				Široka upotreba <input type="radio" name="availability" id="radio_6"
					value="U upotrebi"> Inovativno <input type="radio"
					name="availability" id="radio_7" value="Inovativno"><br />
				<c:set var="available" value="${itemCatalog.Dostupnost}" />
				<c:choose>
					<c:when test="${fn:contains(available, 'Široka')}">
						<script>
							$("#radio_6").prop("checked", true);
						</script>
					</c:when>
					<c:when test="${fn:contains(available, 'Inovativno')}">
						<script>
							$("#radio_7").prop("checked", true);
						</script>
					</c:when>
				</c:choose>
				<br /> <b><i>Cijena:</i></b>&emsp;&emsp;<input type="text"
					name="price" value="${itemCatalog.Cijena}"
					style="color: black; width: 350px" /><br /> <br /> <b><i>Asistivna
						tehnologija: </i></b>Sklopovska <input type="radio" name="tech"
					id="radio_8" value="Hardverska"> &nbsp;Softverska <input
					type="radio" name="tech" id="radio_9" value="Softverska"><br />
				Sklopovska i softverska <input type="radio" name="tech"
					id="radio_10" value="Hardverska i softverska">
				&nbsp;&nbsp;Ništa od navedenog <input type="radio" class="tech"
					id="radio_11" value="-">
				<c:set var="assist" value="${itemCatalog.AsistivnaTehnologija}" />
				<c:choose>
					<c:when test="${fn:contains(assist, 'Hardverska, softverska')}">
						<script>
							$("#radio_10").prop("checked", true);
						</script>
					</c:when>
					<c:when test="${fn:contains(assist, 'Hardverska')}">
						<script>
							$("#radio_8").prop("checked", true);
						</script>
					</c:when>
					<c:when test="${fn:contains(assist, 'Softverska')}">
						<script>
							$("#radio_9").prop("checked", true);
						</script>
					</c:when>
					<c:otherwise>
						<script>
							$("#radio_11").prop("checked", true);
						</script>
					</c:otherwise>
				</c:choose>
				<br /> <br /> <b><i>ICT uređaj:</i></b><br /> <br /> Pametni
				telefon <input type="checkbox" name="device1" id="check_1"
					class="deviceCheckBox" value="Pametni telefon"> Pametni sat
				<input type="checkbox" name="device2" id="check_2"
					class="deviceCheckBox" value="Pametni sat"><br />Tablet <input
					type="checkbox" name="device3" id="check_3" class="deviceCheckBox"
					value="Tablet"> Računalo <input type="checkbox"
					name="device4" id="check_4" class="deviceCheckBox" value="Računalo">
				<c:set var="dev" value="${itemCatalog.ICTUredjaj}" />
				<c:set var="dev1" value="${fn:toLowerCase(dev)}" />
				<c:if test="${fn:contains(dev1, 'pametni telefon')}">
					<script>
						$('#check_1').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(dev1, 'pametni sat')}">
					<script>
						$('#check_2').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(dev1, 'tablet')}">
					<script>
						$('#check_3').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(dev1, 'računalo')}">
					<script>
						$('#check_4').prop('checked', true);
					</script>
				</c:if>
				<br> <br> <b><i>Platforma: </i></b>Web <input
					type="checkbox" name="platform1" id="check_5"
					class="platformCheckBox" value="Web"> Android <input
					type="checkbox" name="platform2" id="check_6"
					class="platformCheckBox" value="Android"> Windows <input
					type="checkbox" name="platform3" id="check_7"
					class="platformCheckBox" value="Windows"><br /> iOS <input
					type="checkbox" name="platform4" id="check_8"
					class="platformCheckBox" value="iOS"> Tizen <input
					type="checkbox" name="platform5" id="check_9"
					class="platformCheckBox" value="Tizen"> Linux <input
					type="checkbox" name="platform6" id="check_10"
					class="platformCheckBox" value="Linux">
				<c:set var="plat" value="${itemCatalog.Platforma}" />
				<c:set var="plat1" value="${fn:toLowerCase(plat)}" />
				<c:if test="${fn:contains(plat1, 'web')}">
					<script>
						$('#check_5').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(plat1, 'android')}">
					<script>
						$('#check_6').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(plat1, 'windows')}">
					<script>
						$('#check_7').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(plat1, 'ios')}">
					<script>
						$('#check_8').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(plat1, 'tizen')}">
					<script>
						$('#check_9').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(plat1, 'linux')}">
					<script>
						$('#check_10').prop('checked', true);
					</script>
				</c:if>
				<br> <br> <b><i>Vrsta primjene: </i></b>Edukacija <input
					type="checkbox" name="tip1" id="check_11" class="typeCheckBox"
					value="Edukacija"> Komunikacija <input type="checkbox"
					name="tip2" id="check_12" class="typeCheckBox" value="Komunikacija"><br />
				Rehabilitacija <input type="checkbox" name="tip3" id="check_13"
					class="typeCheckBox" value="Rehabilitacija"> Druge primjene
				<input type="checkbox" name="tip4" id="check_14"
					class="typeCheckBox" value="Druge primjene">
				<c:set var="typeUse" value="${itemCatalog.VrstaPrimjene}" />
				<c:set var="typeUse1" value="${fn:toLowerCase(typeUse)}" />
				<c:if test="${fn:contains(typeUse1, 'edukacija')}">
					<script>
						$('#check_11').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(typeUse1, 'komunikacija')}">
					<script>
						$('#check_12').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(typeUse1, 'rehabilitacija')}">
					<script>
						$('#check_13').prop('checked', true);
					</script>
				</c:if>
				<c:if test="${fn:contains(typeUse1, 'druge primjene')}">
					<script>
						$('#check_14').prop('checked', true);
					</script>
				</c:if>
				<br> <br> <b><i>Opis:</b></i><br>
				<textarea cols="40" rows="5" name="myname5" style="color: black;">${itemCatalog.Opis}
			</textarea>
				<br> <br> <b><i>Jezici:</i></b><br>
				<textarea cols="40" rows="3" name="myname4" style="color: black;">${itemCatalog.Jezici}
			</textarea>
				<br> <br> <b><i>Mjesto primjene: (Dom, kuća,
						vrtić... itd.)</b></i><br>
				<textarea cols="40" rows="3" name="myname3" style="color: black;">${itemCatalog.MjestoPrimjene}
			</textarea>
				<br> <br> <b><i>Recenzije(Promotivne/korisničke):</b></i><br>
				<br>
				<textarea cols="40" rows="5" name="myname1" style="color: black;">${itemCatalog.Recenzije}
			</textarea>
				<br> <br> <b><i>Uporabljivost:</b><i>&nbsp;U
					upotrebi <input type="radio" name="usage" id="radio_14"
					value="U upotrebi"> Trenutno van uporabe <input
					type="radio" name="usage" id="radio_15" value="-"> <c:set
						var="toUse" value="${itemCatalog.Uporabljivost}" /> <c:choose>
						<c:when test="${fn:contains(toUse, 'U upotrebi')}">
							<script>
								$("#radio_14").prop("checked", true);
							</script>
						</c:when>
						<c:otherwise>
							<script>
								$("#radio_15").prop("checked", true);
							</script>
						</c:otherwise>
					</c:choose><br> <br> <b><i>Slika: </i></b><br> <input
					type="file" name="file" value="${itemCatalog.Prikaz}" size="50" />
					<br /> <input type="submit" value="Modificiraj"
					style="color: yellow;" class="btn btn-primary" /><br> <br>
		</c:forEach>
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
<script>
	function moveCaretToStart(el) {
		if (typeof el.selectionStart == "number") {
			el.selectionStart = el.selectionEnd = 0;
		} else if (typeof el.createTextRange != "undefined") {
			el.focus();
			var range = el.createTextRange();
			range.collapse(true);
			range.select();
		}
	}

	var textBox1 = document.getElementById("myname1");
	var textBox2 = document.getElementById("myname2");
	var textBox3 = document.getElementById("myname3");
	var textBox4 = document.getElementById("myname4");
	var textBox5 = document.getElementById("myname5");

	textBox.onfocus = function() {
		moveCaretToStart(textBox1);
		moveCaretToStart(textBox2);
		moveCaretToStart(textBox3);
		moveCaretToStart(textBox4);
		moveCaretToStart(textBox5);

		// Work around Chrome's little problem
		window.setTimeout(function() {
			moveCaretToStart(textBox1);
			moveCaretToStart(textBox2);
			moveCaretToStart(textBox3);
			moveCaretToStart(textBox4);
			moveCaretToStart(textBox5);
		}, 2);
	};
</script>

<script>
	$("input[name='filterStatus'], select.filter").change(
			function() {
				var classes = [];
				var stateClass = ""

				$("input[name='filterStatus']").each(function() {
					if ($(this).is(":checked")) {
						classes.push('.' + $(this).val());
					}
				});

				$("select.filter").each(function() {
					if ($(this).val() != 'ZZ') {
						stateClass += "." + $(this).val();
					}
				});

				if (classes == "" && stateClass == "") {
					// if no filters selected, show all items
					$("#StatusTable tbody tr").show();
				} else {
					// otherwise, hide everything...
					$("#StatusTable tbody tr").hide();

					// then show only the matching items
					rows = $("#StatusTable tr" + stateClass).filter(
							classes.length ? classes.join(',') : '*');
					if (rows.size() > 0) {
						rows.show();
					}
				}

			});
</script>
</html>