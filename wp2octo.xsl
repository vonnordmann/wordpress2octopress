<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:content="http://purl.org/rss/1.0/modules/content/"
	xmlns:wp="http://wordpress.org/export/1.2/">

	<xsl:output method="text" />

	<xsl:template match="/rss/channel">
		<xsl:apply-templates select="item[wp:post_type/text()='post' and wp:status/text()='publish']" />
	</xsl:template>

	<xsl:template match="item">
		<xsl:variable name="postDate" select="substring(wp:post_date, 0, 11)" />
		<xsl:variable name="filename" select="concat('_posts/', $postDate, '-', wp:post_name,  '.markdown')" />
		<xsl:result-document href="{$filename}">---
layout: post
title: "<xsl:value-of select="title" />"
date: <xsl:value-of select="wp:post_date" />
comments: true
categories: [<xsl:apply-templates select="category[@domain='category']" />]
---
<xsl:apply-templates select="content:encoded" />
		</xsl:result-document>
	</xsl:template>	

	<xsl:template match="category">
		<xsl:value-of select="." />
		<xsl:if test="position() &lt; last()">, </xsl:if>
	</xsl:template>

</xsl:stylesheet>
