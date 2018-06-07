<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Selección de Boletos</title>
<script>
            var EMPTY = 0; // Still available for reservation and purchase.
            var RESERVED = 1; // reserved but not yet paid for.
            var BOUGHT = 2; // bought and paid for.
            var asientos = 0;
            var tabla;

            function Point(x,y) {
                return { X: x, Y: y }
            }
            function Size(w,h) {
                return {Width: w, Height: h}
            }
            function Rectangle(left,top,width,height) {
                return {TopLeft: Point(left,top), Size: Size(width,height)}
            }
            function seatColorFromSeatStatus(seatStatus) {
                switch(seatStatus) {
                    case EMPTY: return "white";
                    case RESERVED: return "green";
                    case BOUGHT: return "red";
                    default: return "black"; // Invalid value...
                }
            }
            function mapSeatStatusToSeatColor(seats)
            {
                var result = {};
                for(seat in seats) {
                    result[seat] = seatColorFromSeatStatus(seats[seat])
                }
                return result;
            }
            function seatKeyFromPosition(row,col) {
                return JSON.stringify([row,col]);
            }
            function seatRowFromKey(key) {
                return (JSON.parse(key))[0];
            }
            function seatColFromKey(key) {
                return (JSON.parse(key)[1]);
            }
            function getSeatInfo(nrows,ncolumns) {
                var result = { NRows: nrows, NColumns: ncolumns, Seats : {} };
                for(row = 0; row < nrows; row++) {
                    for( col = 0; col < ncolumns; col++ ) {
                        result.Seats[seatKeyFromPosition(row,col)] = EMPTY;
                    }
                }
                result.Seats[seatKeyFromPosition(1,3)] = BOUGHT;
                result.Seats[seatKeyFromPosition(1,4)] = BOUGHT;
                result.Seats[seatKeyFromPosition(1,5)] = BOUGHT;
                result.Seats[seatKeyFromPosition(4,8)] = BOUGHT;
                result.Seats[seatKeyFromPosition(4,9)] = BOUGHT;
                result.Seats[seatKeyFromPosition(5,8)] = BOUGHT;
                tabla = result;
                return result;
            }
            function renderSeat(ctx,r,fillColor) {
                var backup = ctx.fillStyle;
                ctx.strokeStyle = "blue";
                ctx.rect(r.TopLeft.X+2,r.TopLeft.Y+2,r.Size.Width-4,r.Size.Height-4);
                ctx.stroke();
                ctx.fillStyle = fillColor;
                ctx.fillRect(r.TopLeft.X+3,r.TopLeft.Y+3,r.Size.Width-5,r.Size.Height-5);
                ctx.fillStyle = backup;
            }
            function sumarAsientos(idSelect) {
            		var adulto = parseInt(document.getElementById("adulto").value);
            		var mayor = parseInt(document.getElementById("mayor").value);
            		var menor = parseInt(document.getElementById("menor").value);
            		asientos = adulto + mayor + menor;
            		for (i = 0; i < asientos; i++) {
            			tabla.Seats[seatKeyFromPosition(0,i)] = RESERVED;
            		}
            		renderSeatplan(tabla);
            		document.getElementById("numAsientos").innerHTML = asientos;
            		if (asientos == 1) {
            			document.getElementById("asientosSeleccionados").innerHTML = "A1";
            		} else {
            			document.getElementById("asientosSeleccionados").innerHTML = "A1-A"+asientos;
            		}
            		var total = (adulto*73)+(mayor*64)+(menor*64);
            		document.getElementById("total").innerHTML = "$"+total;
            		
            }
            function renderSeatplan(seatInfo) {
                var nrows = seatInfo.NRows;
                var ncolumns = seatInfo.NColumns;
                var seatColors = mapSeatStatusToSeatColor(seatInfo.Seats)
                var canvas = document.getElementById("seatplan");
                var ctx = canvas.getContext("2d");

                var borderWidth = 10;
                var rcContent = Rectangle(
                    borderWidth
                    , borderWidth
                    , canvas.width - 2 * borderWidth
                    , canvas.height - 2 * borderWidth
                );
                var szCell = Size(
                    Math.floor(rcContent.Size.Width / (ncolumns + 1))
                    , Math.floor(rcContent.Size.Height / (nrows + 1))
                );
                ctx.font = "30px Arial";

                for(row = -1; row < nrows; row++) {
                    for(col = -1; col < ncolumns; col++ ) {
                        var r = Rectangle(
                            rcContent.TopLeft.X + szCell.Width * (col+1)
                            ,rcContent.TopLeft.Y + szCell.Height * (row+1)
                            ,szCell.Width
                            ,szCell.Height
                            );
                        var center = Point(szCell.Width / 2, szCell.Height / 2);
                        if (row == -1 && col == -1) {
                            // nothing to render.
                        }
                        else if(row == -1){
                            // render column headers as numbers...
                            ctx.fillStyle = "black";
                            ctx.textAlign = "center";
                            ctx.fillText(col.toString(),r.TopLeft.X+center.X,r.TopLeft.Y+center.Y+6);
                        }
                        else if(col == -1){
                            // render row header
                            ctx.fillStyle = "black";
                            ctx.textAlign = "center";
                            ctx.fillText(String.fromCharCode(65 + row),r.TopLeft.X+center.X+4,r.TopLeft.Y+center.Y+6);
                        }
                        else
                        {
                            // render seat
                            renderSeat(ctx,r,seatColors[seatKeyFromPosition(row,col)]);
                        }
                    }
                }
            }
        </script>
</head>
<body onload="renderSeatplan(getSeatInfo(12,16));">
	<div class="container">
		<h1><spring:message code="label.seleccionasiento" /></h1>
		<canvas id="seatplan" width="640" height="480"></canvas>
		<br> <b class="text-info"><spring:message code="label.selnumboletos" /></b> <br>
		<form method="POST" action="peticion.html">
			<p class="text-info"><spring:message code="label.adulto" /></p>
			<select id="adulto" name="adulto" onchange="sumarAsientos('adulto')" >
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select> <br>
			<p class="text-info"><spring:message code="label.mayor" /></p>
			<select id="mayor" name="mayor" onchange="sumarAsientos('mayor')">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select> <br>
			<p class="text-info"><spring:message code="label.menor" /></p>
			<select id="menor" name="menor" onchange="sumarAsientos('menor')">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select> <br> <b class="text-info"><spring:message code="label.numeroboletos" /></b>
			<p id="numAsientos" name="numAsientos"></p>
			<b class="text-info"><spring:message code="label.asientossugeridos" /></b><br>
			<p id="asientosSeleccionados" name="asientosSeleccionados"></p>
			<b class="text-info"><spring:message code="label.total" /></b> <br>
			<p id="total" name="total">$0</p>
			<input class="btn btn-primary" type="submit" value="Continuar">
		</form>
	</div>
</body>
</html>