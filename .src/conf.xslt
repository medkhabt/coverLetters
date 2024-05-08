<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding='ISO-8859-1' indent="yes"/>
    <xsl:template match="/*">
	<xsl:copy> 
	    <xsl:apply-templates select="node()"/>
	</xsl:copy> 
    </xsl:template>
    <xsl:template match="/configs/*">
	<xsl:variable name='override' select="document('shared_configs.xml')/configs/*[name()=name(current())]"/>
	<xsl:choose> 
	    <xsl:when test="$override">
		<xsl:copy-of select="$override"/>
	    </xsl:when> 
	    <xsl:otherwise>
		<xsl:copy>
		    <!-- incase i have attributes <xsl:apply-templates select="@* | node()"/>-->
		    <xsl:apply-templates select="node()"/>
		</xsl:copy>
	    </xsl:otherwise>
	</xsl:choose>
    </xsl:template>
<!--
    <xsl:template>
	    <xsl:copy-of select="*"/> 
	    <xsl:copy-of select="document('../configs/shared_configs.xml')/configs/*"/>  
    <xsl:template> -->
    <!--<xsl:template match="/configs/child::*"> 
    	<xsl:if test="following-sibling::*[name()=name(current())]"> 
    </xsl:if>
    </xsl:template>-->

</xsl:stylesheet>
