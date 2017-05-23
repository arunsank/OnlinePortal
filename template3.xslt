<?xml version="1.0" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


  <xsl:template match="/">
  <html>
	<head><title>Music and Video Store</title>
	<link rel="stylesheet" type="text/css" href="stylinginfo.css" />
	</head>
	<body>
	<div class="header1">Music and Video Store - Online Portal</div>
	<h3>Checking availability for requester</h3>
	<table class="movietable">
		<thead><th>Genre</th><th>Title</th><th>Year</th><th>Price</th></thead>
	<xsl:apply-templates select="/store/video/movie">
	<!-- Sort ascending by genre -->
		<xsl:sort select="genre" order="ascending" />
	</xsl:apply-templates>	

	</table>

	</body>
	</html>	  
  </xsl:template>

  <xsl:template match="movie">

	<xsl:choose>
	<!--Display available stock -->
	<xsl:when test="quantity &gt; 0">
	<tr>
		<td><xsl:value-of select="genre" /></td>
		<td><xsl:value-of select="title" /></td>
		<td><xsl:value-of select="year" /></td>
		<td><xsl:value-of select="price" /></td>
	</tr>
	</xsl:when>
	<!--Display unavailable quantity in red-->
	<xsl:when test="quantity = 0">
	<tr style="color:red">
		<td><xsl:value-of select="genre" /></td>
		<td><xsl:value-of select="title" /></td>
		<td><xsl:value-of select="year" /></td>
		<td><xsl:value-of select="price" /></td>
	</tr>
	</xsl:when>
	</xsl:choose>

  </xsl:template>

  
</xsl:stylesheet>