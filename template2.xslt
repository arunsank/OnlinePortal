<?xml version="1.0" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- match= "/" defines the whole document-->

  <xsl:template match="/">
  <!-- Open HTML -->
  <html>
	<head><title>Music and Video Store</title>
	<!-- Include CSS stylesheet -->
	<link rel="stylesheet" type="text/css" href="stylinginfo.css" />
	</head>
	<body>
	<div class="header1">Music and Video Store - Online Portal</div>
	<h3>Album Labels and Studio list</h3>
	<xsl:apply-templates select="store" />
	</body>
	</html>	  
	</xsl:template>

	<xsl:template match="store">
	<h4>Studios information </h4>
	<table class="movietable">
	<!-- Include column names -->
	<thead><th>Studio</th><th>Count</th></thead>
		<xsl:apply-templates select="video/movie">
			<xsl:sort select="studio" order="ascending" />
		</xsl:apply-templates>
	</table>
	<h4>Company Labels</h4>
	<table class="movietable">
	<!-- Include column names -->
	<thead><th>Labels</th><th>Count</th></thead>
		<xsl:apply-templates select="music/album" >
			<xsl:sort select="label" order="ascending" />
		</xsl:apply-templates>
	</table>
	</xsl:template>
<!--Count the studios using preceding-sibling to make sure the same movie is not counted again -->
	<xsl:template match="movie">
		<xsl:variable name="thisStudio" select="studio" />
		<xsl:if test="not(preceding-sibling::*[./studio=$thisStudio])">
		<tr><td><xsl:value-of select="studio" />
		</td><td><xsl:value-of select="count(/store/video/movie[studio=$thisStudio])" />
		</td></tr>
		</xsl:if>
	</xsl:template>


<!--Count the albums using preceding-sibling to make sure the same album is not counted again -->
	<xsl:template match="album">
		<xsl:variable name="thisLabel" select="label" />
		<xsl:if test="not(preceding-sibling::*[./label=$thisLabel])">
		<tr><td><xsl:value-of select="label" />
		</td><td><xsl:value-of select="count(/store/music/album[label=$thisLabel])" />
		</td></tr>
		</xsl:if>
	</xsl:template>

  
</xsl:stylesheet>