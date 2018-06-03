<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cine Ciencias</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">
//Datepicker
  $( function() {
      $( "#datepicker" ).datepicker();
    } );
    
    //Autocomplete
    $( function() {
    var availableTags = [
      "Cinemex Parque Delta",
      "Cinemex WTC",
      "Cinemex Cuauhtémoc",
      "Cinemex La Viga",
      "Cinemex San Antonio",
      "Cinemex Insurgentes",
      "Cinemex Félix Cuevas",
      "Cinemex Reforma Casa de Arte",
      "Cinemex Plaza las Estrellas",
      "Cinemex Altavista",
      "Cinemex CNA",
      "Cinemex Clavería",
      "Cinemex Legaria",
      "Cinemex Iztapalapa",
      "Cinemex Plaza Loreto",
      "Cinemex Parque Lindavista",
      "Cinemex Misterios",
      "Cinemex Tezontle",
      "Cinemex Patio Revolución",
      "Cinemex Portal Lomas Estrella",
      "Cinemex Duraznos",
      "Cinemex Portal Centro"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  } );
    
</script>
<style>
.error {
	color: #ff0000;
	font-style: italic;
}

.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
</style>

  
</head>
<body>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
<ol class="carousel-indicators">
  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
  <li data-target="#myCarousel" data-slide-to="1"></li>
  <li data-target="#myCarousel" data-slide-to="2"></li>
  <li data-target="#myCarousel" data-slide-to="3"></li>
</ol>

<!-- Wrapper for slides -->
<div class="carousel-inner" role="listbox">
  <div class="item active">
    <img src="img/forma_agua.jpg" alt="Forma_Agua">
    <div class="carousel-caption">
      <h3>La Forma del Agua</h3>
      <p>Director: Guillermo del Toro</p>
    </div>
  </div>

  <div class="item">
    <img src="img/dunkerque.jpg" alt="Dunkerque">
    <div class="carousel-caption">
      <h3>Dunkerque</h3>
      <p>Director: Christopher Nolan</p>
    </div>
  </div>

  <div class="item">
    <img src="img/ready_player_one.jpg" alt="Ready_Player_One">
    <div class="carousel-caption">
      <h3>Ready Player One</h3>
      <p>Director: Steven Spielberg</p>
    </div>
  </div>

  <div class="item">
    <img src="img/wonder_woman.jpg" alt="Wonder_Woman">
    <div class="carousel-caption">
      <h3>La Mujer Maravilla</h3>
      <p>Director: Patty Jenkins</p>
    </div>
  </div>
</div>

<!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

	<div class="container">
		<h1>Detalle de la Película</h1>
		<hr>
		<p>
			<b class="text-info">Nombre Película: </b> ${pelicula.nombre}
</p>
<p>
	<b class="text-info">Clasificación: </b>${pelicula.clasificacion}</p>
<p>
	<b class="text-info">Versión: </b>${pelicula.version}</p>
<p>
	<b class="text-info">Sala: </b>${pelicula.sala}</p>
<p>
	<b class="text-info">Lugar: </b>${pelicula.lugar}</p>
		<div class="ui-widget">
  <b class="text-info">Selecciona otro lugar: </b>
  <input id="tags">
</div>
		<p>
			<b class="text-info">Horario: </b>${pelicula.horario}</p>
<p>
	<b class="text-info">Precio: </b>${pelicula.precio}</p>
<p>
	<b class="text-info">Fecha: </b>${pelicula.fecha}</p>
	<p>
	<b class="text-info">Selecciona otra fecha:</b> <input type="text" id="datepicker"></p>
	<p>
	<b class="text-info">Ubicación del cine:</b></p>
	<div id="googleMap" style="width:100%;height:400px;"></div>
	
<form:form method="POST" action="asientos.html">
	<input class="btn btn-primary" type="submit" value="Continuar" />
</form:form>
</div>
	
<script type="text/javascript">
$(document).ready(function(){
    // Activate Carousel
    $("#myCarousel").carousel();
    
    // Enable Carousel Indicators
    $(".item1").click(function(){
        $("#myCarousel").carousel(0);
    });
    $(".item2").click(function(){
        $("#myCarousel").carousel(1);
    });
    $(".item3").click(function(){
        $("#myCarousel").carousel(2);
    });
    $(".item4").click(function(){
        $("#myCarousel").carousel(3);
    });
    
    // Enable Carousel Controls
    $(".left").click(function(){
        $("#myCarousel").carousel("prev");
    });
    $(".right").click(function(){
        $("#myCarousel").carousel("next");
    });
});


//Google Maps
function myMap() {
var mapProp= {
    center:new google.maps.LatLng(19.373169, -99.162807),
    zoom:20,
};
var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
</script>
<!-- Llave para usar Google Maps -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEwgqDcKto6dBtSL0A8nK9shgaJoAJ_ds&callback=myMap"></script>
</body>
</html>