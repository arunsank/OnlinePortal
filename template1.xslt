<?xml version="1.0" ?> 
<!-- Start of XSLT template for xml data -->
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
		<h2>Movie Inventory</h2>
		
		<!-- Use count and <xsl:value-of> to get a count of the number of movie nodes and to display the value respectively -->
        <h3>Total Movie Count: <xsl:value-of select="count(/store/video/movie)" /> </h3>
		<!-- Movie Information: Apply template to display video elements that contain the movies -->
         <xsl:apply-templates select="/store/video" />
		 
		 <!-- Objective : Get counts of all album nodes which have their qyuantity to be atleast 1 --> 
		 
		 <h2>Album Inventory</h2>
		 <!-- &gt -xslt reference for the '>' symbol -->
		 <h3>Album Count: <xsl:value-of select="count(/store/music/album[quantity &gt; 0])" /></h3>
		 
		 <!-- Objective : Get information about albumns , use music node -->
		 
		 <xsl:apply-templates select="/store/music" />
		 
		 <!-- Close HTML for music-->
	   </body>
    </html>
  </xsl:template>

<!-- Create templates for the nodes used above. -->
<xsl:template match="video">
	
	<!-- create Table -->
	<table class="movietable">
	<!-- Include column names -->
	<thead><th>Title</th><th>Year</th><th>Media</th><th>Quantity</th></thead>
	
	<!--Apply movie template to all child nodes of video-->
	<xsl:apply-templates>
	
		<!--Sort movie nodes in ascending for better view-->
		<xsl:sort select="title" order="ascending" />
	</xsl:apply-templates>
	
	<!-- Using sum() to display the total DvDs in stock.This is useful to see what is in stock -->
	
	<tr><td class="total" colspan="3">In Stock</td>
	 <td class="total"><xsl:value-of select="sum(movie/quantity)" /></td></tr>
	</table>
	
<!--Return to document root template -->
</xsl:template>


<!--Movie Nodes Template-->
<xsl:template match="movie">
    <tr>
	  <td class="tdtitle">
      <xsl:value-of select="title" />
	  </td><td>
	  <xsl:value-of select="year" />
	  </td><td>
	  <!--Dvd has different types. dvd/@type selects the types -->
	  <xsl:value-of select="dvd/@type" />
	  </td><td>
	  
	  <!-- <xsl:choose> to navigate between various constraints -->
	  <xsl:choose>
	  	<!-- case 1: If quantity== 0. highlight as red -->
	  	<xsl:when test="quantity=0">
			<span class="alert">
			<xsl:value-of select="quantity" />
			</span>
		</xsl:when>
		<!--case 2: For quantity >0 print normally -->
		<xsl:when test="quantity &gt; 0">
			<xsl:value-of select="quantity" />
		</xsl:when>
	  </xsl:choose>
	</td>
    </tr>
<!-- Return to video template -->
</xsl:template>
  
<!-- Create music templates -->
  
  <xsl:template match="music">
	<table class="movietable">
	<thead><th>Title</th><th>Artist</th><th>Media</th><th>Quantity</th></thead>
	<xsl:apply-templates>
		<xsl:sort select="title" />
	</xsl:apply-templates>
	 <tr><td class="total" colspan="3">Total In Stock</td>
	 <td class="total"><xsl:value-of select="sum(/store/music/album/quantity)" /></td></tr>
	</table>
</xsl:template>
  
  <xsl:template match="album">
   <xsl:if test="quantity &gt; 0" >
    <tr>
	  <td class="tdtitle">
      <xsl:value-of select="title" />
	  </td><td>
	  <xsl:value-of select="artist" />
	  </td><td>
	  <xsl:choose>
	  	<xsl:when test="@type='cd'">
			<img src="cd.gif" height="15" width="15" alt="CD" />
		</xsl:when>
		<xsl:when test="@type='cassette'">
			<img src="cassette.gif" height="15" width="15" alt="cassette" />
		</xsl:when>
		<xsl:when test="@type='vinyl'">
			<img src="vinyl.gif" height="15" width="15" alt="vinyl" />
		</xsl:when>
	  </xsl:choose>
	  </td><td>
	  <xsl:value-of select="quantity" />
	  </td>
    </tr>
   </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>