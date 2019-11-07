<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY ac     "http://atomgraph.com/ns/client#">
    <!ENTITY rdf    "http://www.w3.org/1999/02/22-rdf-syntax-ns#">
    <!ENTITY xsd    "http://www.w3.org/2001/XMLSchema#">
    <!ENTITY void   "http://rdfs.org/ns/void#">
]>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xhtml="http://www.w3.org/1999/xhtml"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:ac="&ac;"
xmlns:rdf="&rdf;"
xmlns:void="&void;"
xmlns:bs2="http://graphity.org/xsl/bootstrap/2.3.2"
xmlns:uuid="java:java.util.UUID"
exclude-result-prefixes="#all">

    <xsl:template match="void:inDataset" mode="bs2:PropertyList"/>

    <xsl:template match="void:inDataset" mode="ac:TablePredicateMode"/>

    <xsl:template match="void:inDataset" mode="bs2:FormControl">
        <xsl:apply-templates select="." mode="xhtml:Input">
            <xsl:with-param name="type" select="'hidden'"/>
        </xsl:apply-templates>
        <xsl:apply-templates select="node() | @rdf:resource | @rdf:nodeID" mode="#current">
            <xsl:with-param name="type" select="'hidden'"/>
        </xsl:apply-templates>
        <xsl:apply-templates select="@xml:lang | @rdf:datatype" mode="#current">
            <xsl:with-param name="type" select="'hidden'"/>
        </xsl:apply-templates>
    </xsl:template>

</xsl:stylesheet>