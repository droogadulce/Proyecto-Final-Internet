<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cine Ciencias</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	//Datepicker
	$(function() {
		$("#datepicker").datepicker();
	});

	//Autocomplete
	$(function() {
		var availableTags = [ "Cinemex Parque Delta", "Cinemex WTC",
				"Cinemex Cuauhtémoc", "Cinemex La Viga", "Cinemex San Antonio",
				"Cinemex Insurgentes", "Cinemex Félix Cuevas",
				"Cinemex Reforma Casa de Arte", "Cinemex Plaza las Estrellas",
				"Cinemex Altavista", "Cinemex CNA", "Cinemex Clavería",
				"Cinemex Legaria", "Cinemex Iztapalapa",
				"Cinemex Plaza Loreto", "Cinemex Parque Lindavista",
				"Cinemex Misterios", "Cinemex Tezontle",
				"Cinemex Patio Revolución", "Cinemex Portal Lomas Estrella",
				"Cinemex Duraznos", "Cinemex Portal Centro" ];
		$("#tags").autocomplete({
			source : availableTags
		});
	});
</script>
<style>
.error {
	color: #ff0000;
	font-style: italic;
}
.resize {
	width:30%;
  	height:30%;
  	float: right;
}
</style>


</head>
<body>
	<div class="container">
		<h1><spring:message code="label.detalle" /></h1>
		<hr>
		<img src="${pageContext.request.contextPath}/img/${pelicula.idPelicula}.jpg" class="img-thumbnail resize" alt="${pelicula.nombre}" />
		<p>
			<b class="text-info"><spring:message code="label.namemovie" /> </b> ${pelicula.nombre}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.clasification" /> </b>${pelicula.clasificacion}</p>
		<p>
			<b class="text-info"><spring:message code="label.version" /> </b>${pelicula.version}</p>
		<p>
			<b class="text-info"><spring:message code="label.room" />  </b>${pelicula.sala}</p>
		<p>
			<b class="text-info"><spring:message code="label.place" /> </b>${pelicula.lugar}</p>
		<div class="ui-widget">
			<b class="text-info"><spring:message code="label.selectplace" /> </b> <input type="text" id="tags">
		</div>
		<p>
			<b class="text-info"><spring:message code="label.hour" />  </b>${pelicula.horario}</p>
		<p>
			<b class="text-info"><spring:message code="label.price" /> </b>${pelicula.precio}</p>
		<p>
			<b class="text-info"><spring:message code="label.date" /> </b>${pelicula.fecha}</p>
		<p>
			<b class="text-info"><spring:message code="label.otherdate" /> </b> <input type="text"
				id="datepicker">
		</p>
		<p>
			<b class="text-info"><spring:message code="label.ubicacioncine" /> </b>
		</p>
		<div id="googleMap" style="width: 100%; height: 400px;"></div>

		<form:form method="POST" action="asientos.html">
			<input class="btn btn-primary" type="submit" value="Continuar" />
		</form:form>
	</div>

	<script type="text/javascript">
		//Google Maps
		function myMap() {
			var mapProp = {
				center : new google.maps.LatLng(19.373169, -99.162807),
				zoom : 20,
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);
		}
	</script>
	<!-- Llave para usar Google Maps -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEwgqDcKto6dBtSL0A8nK9shgaJoAJ_ds&callback=myMap"></script>
</body>
</html>