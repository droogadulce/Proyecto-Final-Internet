<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<h1>¡Ya tienes tus boletos!</h1>
		<h2>Detalle de la Compra</h2>
		<hr>
		<p>
			<b class="text-info">Nombre Usuario: </b> ${usuario.nombre}
		</p>
		<p>
			<b class="text-info">Correo: </b>${usuario.correo}
		</p>
		<p>
			<b class="text-info">No. de Tarjeta: </b>${usuario.numTarjeta}
		</p>
		<p>
			<b class="text-info">Película: </b> ${nombrePelicula}
		</p>
		<p>
			<b class="text-info">Cine: </b>${cine}
		</p>
		<p>
			<b class="text-info">Sala: </b>${sala}</p>
		<p>
			<b class="text-info">Asientos: </b>${asientos}
		</p>
		<p>
			<b class="text-info">Fecha: </b>${fecha}
		</p>
		<p>
			<b class="text-info">Hora: </b>${horario}
		</p>
		<p>
			<b class="text-info">Código de confirmación: </b>ABCD-1234
		</p>
		<p>
			<b class="text-info">#Boletos: </b>${cantidadBoletos}
		</p>
		<p>
			<b class="text-info">Precio: </b>$${total}
		</p>
	</div>
</body>
</html>