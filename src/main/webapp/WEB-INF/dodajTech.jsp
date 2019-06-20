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
				<b><u>Novo rješenje</u></b><br /> <br>
			</h1>
		</div>
		<form action="/onlinecatalogue/dodajTech" method="post" class="main"
			enctype="multipart/form-data">
			<b><i>Naziv:*</i></b>&emsp;&emsp;<input type="text" name="nameField"
				placeholder="Naziv rješenja.." style="color: black;" /> <br /> <br />
			<b><i>Proizvođač:*</i></b>&emsp;&emsp;<input type="text"
				name="manufacterField" placeholder="Naziv proizvođača.."
				style="color: black;" /> <br /> <br /> <font color="yellow"><b><i>Vrsta
						poteškoće:*</i></b></font>&emsp; Kognitivne <input type="radio" name="difficulty"
				value="Kognitivne poteškoće" checked> Motoričke <input
				type="radio" name="difficulty" value="Motoričke poteškoće">
			<br> <br> Teškoće vida <input type="radio"
				name="difficulty" value="Poteškoće vida"> Teškoće sluha <input
				type="radio" name="difficulty" value="Poteškoće sluha">
			Višestruke teškoće <input type="radio" name="difficulty"
				value="Višestruke poteškoće"> <br> <br> <b><i>Link:*</i></b>&emsp;&emsp;<input
				type="text" name="linkField" placeholder="Link na stranicu.."
				style="color: black; width: 550px" /> <br /> <br /> <b><i>Dostupnost:</i></b>
			Široka upotreba <input type="radio" name="availability"
				value="U upotrebi"> Inovativno <input type="radio"
				name="availability" value="Inovativno"><br /> <br />
			<b><i>Cijena:</i></b>&emsp;&emsp;<input type="text" name="price"
				placeholder="Unesite cijene.." style="color: black;width:350px" /><br /> <br />
			<b><i>Asistivna tehnologija: </i></b>Sklopovska <input type="radio"
				name="tech" value="Hardverska"> &nbsp;Softverska <input
				type="radio" name="tech" value="Softverska"><br />
			Sklopovska i softverska <input type="radio" name="tech"
				value="Hardverska i softverska"> &nbsp;&nbsp;Ništa od
			navedenog <input type="radio" class="tech" value="-"><br />
			<br /> <b><i>ICT uređaj:</i></b><br /> <br /> Pametni telefon <input
				type="checkbox" name="device1" class="deviceCheckBox"
				value="Pametni telefon"> Pametni sat <input type="checkbox"
				name="device2" class="deviceCheckBox" value="Pametni sat"><br />Tablet
			<input type="checkbox" name="device3" class="deviceCheckBox"
				value="Tablet"> Računalo <input type="checkbox"
				name="device4" class="deviceCheckBox" value="Računalo"><br>
			<br> <b><i>Platforma: </i></b>Web <input type="checkbox"
				name="platform1" class="platformCheckBox" value="Web"> Android <input
				type="checkbox" name="platform2" class="platformCheckBox" value="Android">
			Windows <input type="checkbox" name="platform3" class="platformCheckBox"
				value="Windows"><br /> iOS <input type="checkbox"
				name="platform4" class="platformCheckBox" value="iOS"> Tizen <input
				type="checkbox" name="platform5" class="platformCheckBox" value="Tizen">
			Linux <input type="checkbox" name="platform6" class="platformCheckBox" value="Linux"><br>
			<br> <b><i>Vrsta primjene: </i></b>Edukacija <input
				type="checkbox" name="tip1" class="typeCheckBox" value="Edukacija">
			Komunikacija <input type="checkbox" name="tip2" class="typeCheckBox"
				value="Komunikacija"><br /> Rehabilitacija <input
				type="checkbox" name="tip3" class="typeCheckBox" value="Rehabilitacija">
			Druge primjene <input type="checkbox" name="tip4" class="typeCheckBox"
				value="Druge primjene"><br> <br> <b><i>Opis:</b></i><br>
			<textarea cols="40" rows="5" name="myname5" style="color: black;">
			</textarea>
			<br> <br> <b><i>Jezici:</i></b><br>
			<textarea cols="40" rows="3" name="myname4" style="color: black;">
			</textarea>
			<br> <br> <b><i>Mjesto primjene: (Dom, kuća, vrtić... itd.)</b></i><br>
			<textarea cols="40" rows="3" name="myname3" style="color: black;">
			</textarea>
			<br> <br> <u><b>Recenzije</b></u><br> <b><i>Promotivne:</i></b><br>
			<textarea cols="40" rows="5" name="myname1" style="color: black;">
			</textarea>
			<br> <b><i>Korisničke:</i></b><br>
			<textarea cols="40" rows="5" name="myname2" style="color: black;">
			</textarea>
			<br> <br> <b><i>Uporabljivost:</b><i>U upotrebi <input
				type="radio" name="usage" value="U upotrebi"> Trenutno van
				uporabe <input type="radio" name="usage" value="-"><br>
				<br> <b><i>Slika: </i></b><br> <input type="file"
				name="file" value="Uploadaj sliku.." size="50" /> <br /> <input
				type="submit" value="Kreiraj" style="color: yellow;"
				class="btn btn-primary" /><br>
			<br>
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
$("input[name='filterStatus'], select.filter").change(function () {
    var classes = [];
    var stateClass = ""
    
    $("input[name='filterStatus']").each(function() {
        if ($(this).is(":checked")) {
            classes.push('.'+$(this).val());
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
        rows = $("#StatusTable tr" + stateClass).filter(classes.length ? classes.join(',') : '*');
        if (rows.size() > 0) {
            rows.show();
        }
    }
    
});

</script>
</html>