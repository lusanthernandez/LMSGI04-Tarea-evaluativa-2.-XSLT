<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
    
    <xsl:template match="/gestionParque">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Página de Atracciones" />
                <title>Atracciones</title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="gastrobar.html">Gastrobar</a>
                    <a href="atracciones.html">Atracciones</a>
                    <a href="eventos.html">Eventos</a>
                </header>
                
                <main>
                    <h1>ATRACCIONES</h1>
                    <table>
                        <tr>
                            <th>ATRACCION</th>
                            <th>EDAD MINIMA</th>
                            <th>PESO MAXIMO</th>
                        </tr>
                        
                        <!-- Recorremos todas las atracciones -->
                        <xsl:for-each select="atracciones/atraccion">
                            <tr>
                                <td>
                                    <!-- Creamos una variable para generar el enlace a Wikipedia -->
                                    <xsl:variable name="nombre_wiki" select="translate(nombre, ' ', '_')" />
                                    <a target="_blank">
                                        <xsl:attribute name="href">
                                            <xsl:text>https://es.wikipedia.org/wiki/</xsl:text>
                                            <xsl:value-of select="$nombre_wiki"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="nombre" />
                                    </a>
                                </td>
                                <td>
                                    <xsl:value-of select="restricciones/edadMinima" /> 
                                </td>
                                <td>
                                    <xsl:value-of select="restricciones/pesoMaximo" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
