<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
		<body>
		<h1>List of Student GPA</h1>
		<h2>Students with GPA better than 1.2 are highlited with green color, others with red</h2>
		<table border="1">
			<tr style="background-color:gray">
				<th>Sur Name</th>
				<th>First Name</th>
				<th>Gender</th>
				<th>Date of Birth</th>
				<th>GPA</th>
				<th>Email Address</th>
				<th>Faculty</th>
			</tr>
			<xsl:for-each select="informatics_cource/athlete">
				<xsl:sort select="surname" />
				<tr>
					<td>
						<xsl:value-of select="surname" />
					</td>
					<td>
						<xsl:value-of select="firstname" />
					</td>
					<td>
						<xsl:value-of select="gender" />
					</td>
					<td>
						<xsl:value-of select="dateOfbirth" />
					</td>
					<xsl:choose>
						<xsl:when test="studyProgram/GPA&lt; 1.2">
							<td style="background-color:green">
								<xsl:value-of select="studyProgram/GPA" />
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td style="background-color:red">
								<xsl:value-of select="studyProgram/GPA" />
							</td>
						</xsl:otherwise>
					</xsl:choose>
					<td>
						<xsl:value-of select="contactInfo/email" />
					</td>
					<td>
						<xsl:value-of select="faculty" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>