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
	<propietariosas>
		<xsl:copy-of select="//datos_propi"/>
	</propietariosas>
</xsl:template>

</xsl:stylesheet>