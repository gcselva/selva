<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:foo="http://www.foo.org/" xmlns:bar="http://www.bar.org">
<xsl:template match="/">
  <html>
  <body>
  <h2>App Store</h2>
  <h3>Sorted by name, games and applications from App Store are presented in this table. Apps with big number of downloads (more than 20000) are shown in green color, apps with high price are shown in yellow color (greater than 3).</h3>
    <table border="1">
      <tr bgcolor="white">
        <th>Title</th>
        <th>Category</th>
        <th>Developer</th>
        <th>Size (Mb)</th>
        <th>In-App purchases</th>
        <th>In-App Ads</th>
        <th>Current version</th>
        <th>Price (EUR)</th>
        <th>Number of downloads</th>
      </tr>
      <xsl:for-each select="appStore/application">
        <xsl:sort select="title" />
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="genre"/></td>
        <td><xsl:value-of select="developer"/></td>
        <td><xsl:value-of select="size"/></td>
        <td><xsl:value-of select="in-appPurchases"/></td>
        <td><xsl:value-of select="in-appAds"/></td>
        <td><xsl:value-of select="currentVersion"/></td>
        <xsl:choose>
            <xsl:when test="price>3">
                <td style="background-color:yellow">
                    <xsl:value-of select="price" />
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:value-of select="price" />
                </td>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="numberOfDownloads>20000">
                <td style="background-color:green"> 
                    <xsl:value-of select="numberOfDownloads" />
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:value-of select="numberOfDownloads" />
                </td>
            </xsl:otherwise>
        </xsl:choose>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>