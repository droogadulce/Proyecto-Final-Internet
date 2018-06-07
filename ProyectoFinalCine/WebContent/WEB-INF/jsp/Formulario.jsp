<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registro</title>
<style>
     .error {
        color: #ff0000;
        font-style: italic;
      }
   </style>
</head>
<body>
	<div class="container">
		<form:form method="POST" commandName="usuario">
			<h1><spring:message code="label.registro" /></h1>
			<div class="form-group">
				<form:label path="nombre"><spring:message code="label.nombreusuario" /></form:label>
				<form:input path="nombre" />
				<form:errors path="nombre" cssClass="error" />
			</div>
			<div class="form-group">
				<form:label path="correo"><spring:message code="label.correo" /></form:label>
				<form:input path="correo" />
				<form:errors path="correo" cssClass="error" />
			</div>
			<div class="form-group">
				<form:label path="numTarjeta"><spring:message code="label.numtarjeta" /></form:label>
				<form:input path="numTarjeta" />
				<form:errors path="numTarjeta" cssClass="error" />
			</div>
			<input class="btn btn-primary" type="submit" value="Registrar">
		</form:form>
	</div>
</body>
</html>