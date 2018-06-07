<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagina correcta</title>
</head>
<body>
	<div class="container">
		<h1><spring:message code="label.tienesboletos" /></h1>
		<h2><spring:message code="label.detallecompra" /></h2>
		<hr>
		<p>
			<b class="text-info"><spring:message code="label.nombreusuario" /></b> ${usuario.nombre}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.correo" /></b>${usuario.correo}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.numtarjeta" /> </b>${usuario.numTarjeta}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.pelicula" /></b> ${nombrePelicula}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.cine" /></b>${cine}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.room" /></b>${sala}</p>
		<p>
			<b class="text-info"><spring:message code="label.asientos" /></b>${asientos}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.date" /></b>${fecha}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.hour" /></b>${horario}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.confirmacion" /></b>ABCD-1234
		</p>
		<p>
			<b class="text-info"><spring:message code="label.numeroboletos" /></b>${cantidadBoletos}
		</p>
		<p>
			<b class="text-info"><spring:message code="label.price" /></b>$${total}
		</p>
	</div>
</body>
</html>