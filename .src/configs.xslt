<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>

	<xsl:template match="configs"> 
\ProvidesPackage{mystyle}
\newcommand*{\myname}{<xsl:value-of select="myname"/>}
\newcommand*{\myaddress}{<xsl:value-of select="myaddress"/>}
\newcommand*{\myemail}{<xsl:value-of select="myemail"/>}
\newcommand*{\myphone}{<xsl:value-of select="myphone"/>}
\newcommand*{\firmName}{<xsl:value-of select="firmName"/>}
\newcommand*{\firmResponsible}{<xsl:value-of select="firmResponsible"/>}
\newcommand*{\firmRespJob}{<xsl:value-of select="firmRespJob"/>}
\newcommand*{\firmAddress}{<xsl:value-of select="firmAddress"/>}
\newcommand*{\dateAndPlace}{<xsl:value-of select="dateAndPlace"/>}
\newcommand*{\subjekt}{<xsl:value-of select="subjekt"/>}
\newcommand*{\einleitung}{<xsl:value-of select="einleitung"/>}
\newcommand*{\haupteileins}{<xsl:value-of select="haupteileins"/>}
\newcommand*{\haupteilzwei}{<xsl:value-of select="haupteilzwei"/>}
\newcommand*{\schluss}{<xsl:value-of select="schluss"/>}
\endinput
	</xsl:template> 

</xsl:stylesheet>



