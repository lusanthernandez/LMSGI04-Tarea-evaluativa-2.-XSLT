<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
    
    <xsl:template match="/gestionParque">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Eventos 2024" />
                <title>Eventos 2024</title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="gastrobar.xml">Gastrobar</a>
                    <a href="atracciones.xml">Atracciones</a>
                    <a href="eventos.xml">Eventos</a>
                </header>
                
                <main>
                    <xsl:variable name="anioEvent" select="'2024'"/>
                    <h1>Eventos del 2024</h1>
                    <xsl:apply-templates select="eventos/evento[substring(fechaHora, 1, 4) = $anioEvent]">
                        <xsl:sort select="fechaHora" order="descending"/>
                    </xsl:apply-templates>
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="evento">
        <article class="eventos">
            <h4><xsl:value-of select="descripcion"/> - <xsl:value-of select="count(comentarios/comentario)"/> COMENTARIOS </h4> 
            <ul>
                <xsl:apply-templates select="comentarios/comentario"/>
            </ul>
        </article>
    </xsl:template>
    
    <xsl:template match="comentario">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
</xsl:stylesheet>
