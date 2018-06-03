<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Administrador de Documentos</title>
	<style type="text/css">
		html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, input {
    		font-size: 100%;
		}
		body {
			font-family: sans-serif;
			font-size:12px;
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
	    font-family: Trebuchet MS,Liberation Sans,DejaVu Sans,sans-serif;
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
	
	</style>
</head>
<body>

<!-- code es lo de internacionalizacion -->
<h2><spring:message code="label.title"/></h2>

<h3><spring:message code="label.objetivo"/></h3>
<!-- commandname es el bean que se va a enviar 
	multipart/form-data se usa con el upload
-->
<form:form method="post" action="save.html" commandName="document" enctype="multipart/form-data">
<!-- errores que se van a aplicar -->
	<form:errors path="*" cssClass="error"/>
<table>
 <tr>
  <td>
   <table>
	<tr>
		<td><form:label path="name"><spring:message code="label.name"/></form:label></td>
		<td><form:input path="name" /></td> 
	</tr>
	<tr>
		<td><form:label path="description"><spring:message code="label.description"/></form:label></td>
		<td><form:textarea path="description" /></td>
	</tr>
	<tr>
		<td><form:label path="content"><spring:message code="label.document"/></form:label></td>
		<!-- tipo file para hacer el upload
		size 40 para la ventana
		solo se puede subir un archivo a la vez
		name file es como se llama en el 
		 -->
		<td><input type="file" name="file" id="file" size="40"></input></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		    <br>
			<input type="submit" value="<spring:message code="label.adddocument"/>"/>
		</td>
	</tr>
   </table>
  </td>
  <td>
  <!-- se hace referencia a partir del directorio webcontent -->
     <img src="${pageContext.request.contextPath}/img/documentos.jpg" border="0" title="Documentos"/>   	 
  </td>	
 </tr>
</table>	
</form:form>

<br/>
<h3><spring:message code="label.subtitulo"/></h3>
<c:if  test="${!empty documentList}">
<table class="data">
<tr>
	<th><spring:message code="label.name"/></th>
	<th><spring:message code="label.description"/></th>
	<th>&nbsp;</th>
</tr>
<!-- lista de documentos que esta abajo 
se mando como documentList
cada uno de los elementos del documentList es un document
-->
<c:forEach items="${documentList}" var="document">
	<tr>
		<td width="100px">${document.name}</td>
		<td width="250px">${document.description}</td>
		<td width="20px">
			<!-- se llama al control con un parametro -->
			<a href="${pageContext.request.contextPath}/download/${document.id}.html">
			   <img	src="${pageContext.request.contextPath}/img/save_icon.gif" border="0" 
				title="Download this document"/></a> 
			<!-- se llama al control -->
			<a href="${pageContext.request.contextPath}/remove/${document.id}.html"
				onclick="return confirm('¿Estás seguro de que quieres borrar este documento?')">
				<!-- onclick en el link regresa una ventana de confirmacion -->
				<img src="${pageContext.request.contextPath}/img/delete_icon.gif" border="0" 
				title="Delete this document"/></a> 
		</td>
	</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>
