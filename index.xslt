<?xml version="1.0" encoding="UTF-8"?> 

<!-- Nombre del alumno:   Pablo González -->
<!-- Curso del alumno:    1ºASIR (A)     -->
<!-- Fecha modificación:  15/05/2021     -->
<!-- Version:             v3.5           -->
<!--NOTAS
		Página principal y modelo 
		
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:output method="html" encoding="UTF-8" indent="yes"/> 

<xsl:template match="inmuebles">
	<html>
		<head>
			<title>Página Principal VILLABLANCA</title>
			<link
        href="https://fonts.googleapis.com/css?family=Google+Sans:400,500,700|Roboto:100,300,400,500,700,900&amp;lang=es"
        rel="stylesheet" nonce=""/>
			<style>
				img {width: 100%}
				body {
					font-family: 'Google Sans',sans-serif,Arial, Helvetica;
				@font-face {
					font-family: 'Google Sans';
					font-style: normal;
					font-weight: 500;
					src: url(https://fonts.gstatic.com/s/googlesans/v27/4UabrENHsxJlGDuGo1OIlLU94Yt9CwZ-Pw.woff2) format('woff2');
					unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
				  }
				 p { padding: 20px 10px;}
				 
				 table, h1, h2 {padding: 5% 1%;}
			</style>
		</head>
		<body>
			<div> <p style="color: grey; text-align: center">NOTA: Para ver el documento XSLT que ha generado esta página cambie la extensión desde ".html" a ".xslt" en la barra de su navegador o haz clic <a style="color: grey;" href="./index.xslt">aquí</a>.<br/>Puedes acceder a los datos de origen desde <a  style="color: grey;" href="./PrácticaGlobal-XML-2PabloGonzález-LM-1ASIR.xml">este enlace</a>.</p></div>
			<hr/>
			<div id="header">
				<img src="./content/logovillablanca.png"/>

				<h1 align="center" style="font-size: xxx-large; margin: 1%;">Bienvenido/a la intranet del grupo <xsl:value-of select="@inmobiliaria"/></h1>
			</div>
			<div id="resumen inmuebles">
			<br/>
				<h2 style="margin: 1%;">Resumen de inmuebles en stock (ordenado por ID)</h2>
				
				<table border="1" style="text-align: center; margin: 1%;">
					<tr>
						<th>ID Inmueble</th>
						<th>Forma adquisición</th>
						<th>Precio</th>
						<th>ID Propi</th>
						<th>Propietario/a</th>
						<th>ID Gestor/a</th>
						<th>Contacto Gestor/a</th>
						<th>¿Subastas?</th>
					</tr>
					<xsl:apply-templates select="inmueble">
						<xsl:sort select="datos_inmueble/@id_inmueble" order="ascending"/>
					</xsl:apply-templates>
				</table>
				<br/>
				<h2 style="margin: 1%;">Lista de acciones disponibles para trabajadores/as</h2>
				<ul>
					<li>Sobre los inmuebles:</li>
					<ul>
						<li>Obtener inmuebles a la venta -  <a style="color: black;" href="./zz_inmuebles_venta.html">Enlace</a>.</li>
						<li>Obtener inmuebles en régimen de alquiler - <a style="color: black;" href="./zz_inmuebles_alquiler.html">Enlace</a>.</li>
					</ul>
					<li>Base de datos de propietarios</li>
						<ul>
							<li>Visualizar en el navegador - <a style="color: black;" href="./zz_propi.html">Enlace</a>.</li>
							<li>Exportar a XML - <a style="color: black;" href="./zz_propi.xml">Enlace</a>.</li>
						</ul>
					<li>Base de datos de pujas</li>
						<ul>
							<li>Visualizar en el navegador  - <a style="color: black;" href="./zz_pujas.html">Enlace</a>.</li>
							<li>Exportar a XML  - <a style="color: black;" href="./zz_pujas.xml">Enlace</a>.</li>
						</ul>
					<li>Base de datos sobre los empleados/as (solo para Dirección)</li>
						<ul>
							<li>Visualizar en el navegador - <a style="color: black;" href="./zz_emple.html">Enlace</a>.</li>
							<li>Exportar a XML - <a style="color: black;" href="./zz_emple.xml">Enlace</a>.</li>
						</ul>
				</ul>
			</div>
			
		</body>
	
	</html>
</xsl:template>

<xsl:template match="inmueble">
	<tr>
		<td><p style="padding: 1px 20px;"><xsl:value-of select="datos_inmueble/@id_inmueble"/></p></td>
		<td><p style="padding: 1px 20px;"><xsl:value-of select="datos_inmueble/forma_adquisicion"/></p></td>
		<td><p style="padding: 1px 20px;"><xsl:value-of select="datos_inmueble/precio"/></p></td>
		<td><p style="padding: 1px 20px;"><xsl:value-of select="datos_propi/@id_propi"/></p></td>
		<td><p style="padding: 1px 20px;"><xsl:value-of select="datos_propi/nombre"/> <br/> <xsl:value-of select="datos_propi/apellidos"/></p></td>
		<td><p style="padding: 1px 20px;"><xsl:value-of select="datos_gestor/@id_emple"/></p></td>
		<td><p style="padding: 1px 20px;"><xsl:value-of select="datos_gestor/datos_emple/telefono"/> <br/> <xsl:value-of select="datos_gestor/datos_emple/email"/></p></td>
		<td><p style="padding: 1px 20px;"><xsl:value-of select="count(datos_subasta/puja)"/></p></td>
	</tr>
</xsl:template>

</xsl:stylesheet>