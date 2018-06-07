<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
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
<style type="text/css">
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup,
	tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label,
	legend, table, caption, tbody, tfoot, thead, tr, th, td, input {
	font-size: 100%;
}

body {
	font-family: sans-serif;
	font-size: 12px;
}

.data, .data td {
	border-collapse: collapse;
	width: 550px;
	border: 1px solid #aaa;
	padding: 2px;
}

.data th {
	background-color: #9ECFFF;
	color: black;
	font-weight: bold;
}

h1, h2, h3 {
	font-family: Trebuchet MS, Liberation Sans, DejaVu Sans, sans-serif;
	font-weight: bold;
}

h1 {
	font-size: 170%;
}

h2 {
	font-size: 200%;
}

h3 {
	font-size: 150%;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 50%;
	height: 90%;
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
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<h3>Lista de películas</h3>

<div>
	<c:if test="${!empty listaPeliculas}">
		<table class="table table-hover">
			<tr>
				<th scope="col">Película</th>
				<th scope="col">Nombre</th>
			</tr>
			<!-- lista de documentos que esta abajo 
se mando como documentList
cada uno de los elementos del documentList es un document
-->
			<c:forEach items="${listaPeliculas}" var="peli">
				<tr>
					<td width="250px" scope="row">${peli.idPelicula}</td>
					<td width="100px"><a
						href="${pageContext.request.contextPath}/indexFilm/${peli.idPelicula}.html">
							${peli.nombre}</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div class="jumbotron">	
		<!-- code es lo de internacionalizacion -->
	<h2 class="display-4">
		<spring:message code="label.title" />
	</h2>

	<h3>
		<spring:message code="label.objetivo" />
	</h3>
	<!-- commandname es el bean que se va a enviar 
	multipart/form-data se usa con el upload-->
	<form:form method="post" action="save.html" commandName="document"
		enctype="multipart/form-data">
		<!-- errores que se van a aplicar -->
		<form:errors path="*" cssClass="error" />
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td><form:label path="name">
									<spring:message code="label.name" />
								</form:label></td>
							<td><form:input path="name" /></td>
						</tr>
						<tr>
							<td><form:label path="description">
									<spring:message code="label.description" />
								</form:label></td>
							<td><form:textarea path="description" /></td>
						</tr>
						<tr>
							<td><form:label path="content">
									<spring:message code="label.document" />
								</form:label></td>
							<!-- tipo file para hacer el upload
		size 40 para la ventana
		solo se puede subir un archivo a la vez
		name file es como se llama en el 
		 -->
							<td><input type="file" name="file" id="file" size="40"></input></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><br> <input
								type="submit" value="<spring:message code="label.adddocument"/>" />
							</td>
						</tr>
					</table>
				</td>
				<td>
					<!-- se hace referencia a partir del directorio webcontent --> <img
					src="${pageContext.request.contextPath}/img/documentos.jpg"
					border="0" title="Documentos" />
				</td>
			</tr>
		</table>
	</form:form>

	<br />
	<h3>
		<spring:message code="label.subtitulo" />
	</h3>
	<c:if test="${!empty peliculasList}">
		<table class="data">
			<tr>
				<th><spring:message code="label.name" /></th>
				<th><spring:message code="label.description" /></th>
				<th>&nbsp;</th>
			</tr>
			<!-- lista de documentos que esta abajo 
se mando como documentList
cada uno de los elementos del documentList es un document
-->
			<c:forEach items="${peliculasList}" var="pelicula">
				<tr>
					<td width="100px">${pelicula.name}</td>
					<td width="250px">${pelicula.description}</td>
					<td width="20px">
						<!-- se llama al control con un parametro --> <a
						href="${pageContext.request.contextPath}/download/${pelicula.id}.html">
							<img src="${pageContext.request.contextPath}/img/save_icon.gif"
							border="0" title="Download this document" />
					</a> <!-- se llama al control --> <a
						href="${pageContext.request.contextPath}/remove/${pelicula.id}.html"
						onclick="return confirm('¿Estás seguro de que quieres borrar este documento?')">
							<!-- onclick en el link regresa una ventana de confirmacion --> <img
							src="${pageContext.request.contextPath}/img/delete_icon.gif"
							border="0" title="Delete this document" />
					</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<script type="text/javascript">
		$(document).ready(function() {
			// Activate Carousel
			$("#myCarousel").carousel();

			// Enable Carousel Indicators
			$(".item1").click(function() {
				$("#myCarousel").carousel(0);
			});
			$(".item2").click(function() {
				$("#myCarousel").carousel(1);
			});
			$(".item3").click(function() {
				$("#myCarousel").carousel(2);
			});
			$(".item4").click(function() {
				$("#myCarousel").carousel(3);
			});

			// Enable Carousel Controls
			$(".left").click(function() {
				$("#myCarousel").carousel("prev");
			});
			$(".right").click(function() {
				$("#myCarousel").carousel("next");
			});
		});
	</script>

</body>
</html>
