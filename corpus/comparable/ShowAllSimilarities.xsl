<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  	xmlns:php="http://php.net/xsl" 
    xmlns:xi="http://www.w3.org/2001/XInclude"
	xmlns:xalan="http://xml.apache.org/xalan"
    xmlns:str="http://exslt.org/strings"
	exclude-result-prefixes="xi xalan"
	version="1.0">

<xsl:output method="html"
doctype-system="about:legacy-compat" indent="yes"/>


<xsl:param name="similarity" select="'*'"/>
<!--<xsl:param name="file" select="similarities/files/file[1]/@xml"/>
<xsl:param name="f2_xml" select="similarities/files/file[2]/@xml"/>
<xsl:param name="f3_xml" select="similarities/files/file[3]/@xml"/>
<xsl:param name="lang" select="similarities/files/file[1]/@lang"/>
<xsl:param name="f2_lang" select="similarities/files/file[2]/@lang"/>
<xsl:param name="f3_lang" select="similarities/files/file[3]/@lang"/>
<xsl:param name="f1_sound" select="similarities/files/file[1]/@sound"/>
<xsl:param name="f2_sound" select="similarities/files/file[2]/@sound"/>
<xsl:param name="f3_sound" select="similarities/files/file[3]/@sound"/>-->
<!-- ******************************************************** -->


<xsl:template match="/">

<div style="margin-left: 5px;">
 
					
</div>
<p><br /><br/></p>
<div>
					<table align="center" height="100%" width="100%">
                    <tr align="center">
                    <td></td>
                     <td valign="top">
                   <!-- <a href="CreateConcordance.php?"><span style="color:#30F"><b>Concordance sur tout le corpus</b></span></a>-->
					<span style="font-size:20px"><a href=""><b>View table of similarities    </b></a></span> <a href="#" onClick="window.open('info_similarity.htm','popupLink','toolbar=no,status=no,width=700px ,height=100px,resizable=yes',1).focus();return false"><img src="../../images/icones/info1.png" height="20px" width="20px"/></a>
                    <!-- A similarity is considered to be made up of a number of equivalent sentences across different languages, equivalent being defined as sharing narrative, lexical or grammatical content. Similarities can also be viewed individually by clicking on a similarity label within a text. Similarities are identified by cells with coloured backgrounding, each similarity sharing a color. -->
                    </td>
                    <td valign="top">
                 <span style="font-size:20px"> <b> Concordance    </b></span> <a href="#" onClick="window.open('info_concordance.htm','popupLink','toolbar=no,status=no,width=700px ,height=50px,resizable=yes',1).focus();return false"><img src="../../images/icones/info1.png" height="20px" width="20px"/></a>
                  <!-- Search term can be gloss (lexical or grammatical) or word in source language -->
				
					<form id="form" name="form" action="CreateConcordanceOneWord.php"  method="post">
						<input name="mot" type="text" title="mot"  />
                        <input name="text0" type="hidden" value="text0" />
                        <input name="text1" type="hidden" value="text1" />
                        <input name="text2" type="hidden" value="text2" />
                        
						
						<input type="submit" value="Search" />
					</form>
                    </td>
     
                   
                    </tr>
                    </table>
				</div>
				
<p> <br/><br/></p>

<!--<xsl:value-of select="$url_similarities"/>-->
<table width="100%" border="0" cellpadding="5" cellspacing="0" bordercolor="#993300" class="it">
<tbody>
<tr>

<!--<xsl:variable name="file"><xsl:value-of select="@xml"/></xsl:variable>-->

<xsl:variable name="nb_text"><xsl:value-of select="count(//similarities/files/file)"/></xsl:variable>
<!--<xsl:value-of select="$nb_text"/>-->

<!--<xsl:for-each select="//similarities/files/file">-->
<td valign="top">
<table>

<xsl:choose>
    <xsl:when test="$nb_text=2">
    <tr>
   <td valign="top">
   		<div style="width:500px; height:800px; overflow:auto;">
            <xsl:call-template name="sim">
                    <xsl:with-param name="file" select="//similarities/files/file[1]/@xml"/>
                    <xsl:with-param name="lang" select="//similarities/files/file[1]/@lang"/>
            </xsl:call-template>
   	 	</div>
    </td>
    <td valign="top">
    	<div style="width:500px; height:800px; overflow:auto;">
            <xsl:call-template name="sim">
                    <xsl:with-param name="file" select="//similarities/files/file[2]/@xml"/>
                    <xsl:with-param name="lang" select="//similarities/files/file[2]/@lang"/>
            </xsl:call-template>
        </div>
    </td>
 </tr>
    </xsl:when>
    
    
    <xsl:when test="$nb_text=3">
    <tr>
    	<td valign="top">
         <div style="width:400px; height:700px; overflow:auto;">
        <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[1]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[1]/@lang"/>
        </xsl:call-template>
    </div>
    	</td>   
        <td valign="top">
    <div style="width:400px; height:700px; overflow:auto;">
        <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[2]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[2]/@lang"/>
         </xsl:call-template>
    </div>
    	</td>
        <td valign="top">
     <div style="width:400px; height:700px; overflow:auto;">
        <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[3]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[3]/@lang"/>
         </xsl:call-template>
    </div>
    </td>
    </tr>
    </xsl:when>
    
    
    
    
    
    <!--<xsl:when test="$nb_text=3">
    	<td valign="top">
         <div style="width:330px; height:500px; overflow:auto;">
        <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[1]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[1]/@lang"/>
        </xsl:call-template>
    </div>
    	</td>   
        <td valign="top">
    <div style="width:330px; height:500px; overflow:auto;">
        <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[2]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[2]/@lang"/>
         </xsl:call-template>
    </div>
    	</td>
        <td valign="top">
     <div style="width:330px; height:500px; overflow:auto;">
        <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[3]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[3]/@lang"/>
         </xsl:call-template>
    </div>
    </td>
    </xsl:when>-->
    
    
    
    
    
    
    
    
    
    
    <xsl:when test="$nb_text=4">
    <tr>
     <td valign="top">
   	 	<div style="width:500px; height:500px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[1]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[1]/@lang"/>
        </xsl:call-template>  
        </div>
     </td>  
     <td valign="top">
   	 	<div style="width:500px; height:500px; overflow:auto;">  
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[2]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[2]/@lang"/>
        </xsl:call-template> 
        </div>
     </td> 
     </tr>
     <tr>   
     <td valign="top">
   	 	<div style="width:500px; height:500px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[3]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[3]/@lang"/>
        </xsl:call-template>
      </div>
     </td>
     <td valign="top">
   	 	<div style="width:500px; height:500px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[4]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[4]/@lang"/>
        </xsl:call-template>
     </div>
     </td>
     </tr>
    </xsl:when>
    
    
    <xsl:when test="$nb_text=5">
    <tr>
    <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
        <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[1]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[1]/@lang"/>
        </xsl:call-template>
    	</div>
    </td>
    <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[2]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[2]/@lang"/>
        </xsl:call-template>
        </div>
    </td>
    <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[3]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[3]/@lang"/>
        </xsl:call-template>
        </div>
    </td>
    </tr>
    <tr>
    <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[4]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[4]/@lang"/>
        </xsl:call-template>
        </div>
    </td>
    <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[5]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[5]/@lang"/>
        </xsl:call-template>
        </div>
    </td>
    </tr>
    </xsl:when>
    
    <xsl:when test="$nb_text=6">
    <tr>
     <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[1]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[1]/@lang"/>
        </xsl:call-template>
        </div>
        </td>
        <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[2]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[2]/@lang"/>
        </xsl:call-template>
        </div>
        </td>
        <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[3]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[3]/@lang"/>
        </xsl:call-template>
        </div>
        </td>
        </tr>
        <tr>
        <td>
        <br/>
        <br/>
        </td>
        </tr>
        <tr>
        <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[4]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[4]/@lang"/>
        </xsl:call-template>
        </div>
        </td>
        <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[5]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[5]/@lang"/>
        </xsl:call-template>
        </div>
        </td>
        <td valign="top">
   	 	<div style="width:330px; height:330px; overflow:auto;">
                <xsl:call-template name="sim">
        		<xsl:with-param name="file" select="//similarities/files/file[6]/@xml"/>
            	<xsl:with-param name="lang" select="//similarities/files/file[6]/@lang"/>
        </xsl:call-template>
        </div>
        </td>
        </tr>
    </xsl:when>
</xsl:choose>

</table>
</td>
<!--</xsl:for-each>-->




</tr>
</tbody>
</table>

</xsl:template>

<xsl:template name="sim">

<xsl:param name="file" select="''"/>
<xsl:param name="lang" select="''"/>

<table border="0">
<tr><th align="center"><xsl:value-of select="$lang"/></th></tr>
<tr><th align="center"><xsl:value-of select="$file"/></th></tr>
<!--<xsl:call-template name="player-audio_wav_file1">
<xsl:with-param name="f1_sound" select="$f1_sound"/>
<xsl:with-param name="file" select="$file"/>
</xsl:call-template>-->
<!--PARTIE TRAITEMENT ET AFFICHAGE FILE1-->
<xsl:for-each select="document($file)//TEXT/S">
<xsl:variable name="num_s" select="position()" />
<xsl:variable name="id_s" select="@id" />
<tr>
<xsl:choose>
<xsl:when test="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$file]/sentence[@id=$id_s]">
<xsl:variable name="num_sim" select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$file]/sentence[@id=$id_s]/parent::node()/parent::node()/@id"/>
<xsl:variable name="similarity" select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$file]/sentence[@id=$id_s]/parent::node()/parent::node()/@id"/>
<xsl:variable name="color" select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$file]/sentence[@id=$id_s]/parent::node()/parent::node()/color"/>
<td class="segmentContent" width="600px" bgcolor="{$color}">
<!--<a href="listen.php?similarity={$similarity}&amp;file={$f1_sound}"><img src="../outils/play.gif" alt="écouter"/></a>-->
<!--<a href="#" onClick="window.open('http://crdo.risc.cnrs.fr/media-cut.php?start=11.7067&amp;end=19.6529&amp;file=DEPOT_HAYUB_22km.wav','Fiche','toolbar=no,status=no,width=200 ,height=120,scrollbars=yes,location=no,resize=yes,menubar=yes')">
<p><b>Similarity <xsl:value-of select="$num_sim"/></b><br/></p>
</a>-->
<a href="#" onClick="window.open('ViewOneSimilarity.php?similarity={$similarity}&amp;color={$color}','Fiche','toolbar=no,status=no,width=900 ,height=600,scrollbars=yes,location=no,resize=yes,menubar=yes')">
<p><b>Similarity <xsl:value-of select="$num_sim"/></b><br/></p>
</a>
Sentence <xsl:value-of select="$num_s"/><br/>
<!-- <a href="javascript:boutonStop()">
<img src="../outils/stop.gif" alt="stop"/>
</a>-->
<!--<a href="javascript:playFrom('{position()}')">-->
<!--<a href="media-cut.php?start=25.9921&amp;end=35.2007&amp;file=$f1_sound">
<img src="../outils/play.gif" alt="écouter"/>
</a>-->
<!-- affiche le nom du locuteur si il y en a -->
<xsl:if test="((@who) and (not(@who='')) and (not(@who=ancestor::TEXT/S[number(position())-1]/@who)))">
<span class="speaker">
<xsl:value-of select="@who"/><xsl:text>: </xsl:text>
</span>
</xsl:if>
<!-- cas ou S contient la balise FORM -->
<xsl:if test="FORM">
<div class="word_sentence">
<!-- Recuperation de la phrase -->
<xsl:for-each select="FORM">
<xsl:choose>
<xsl:when test="@kindOf">
<xsl:if test="@kindOf='phono'">
<div class="transcription_phono">
<xsl:value-of select="."/>
</div>
</xsl:if>
<xsl:if test="@kindOf='ortho'">
<div class="transcription_ortho">
<xsl:value-of select="."/>
</div>
</xsl:if>
<xsl:if test="@kindOf='phone'">
<div class="transcription_phone">
<xsl:value-of select="."/>
</div>
</xsl:if>
<xsl:if test="@kindOf='transliter'">
<div class="transcription_translit">
<xsl:value-of select="."/>
</div>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<div class="transcription">
<xsl:value-of select="."/>
</div>
</xsl:otherwise>
</xsl:choose>
<br />
</xsl:for-each>
</div>
</xsl:if>
<!-- Cas ou W ou M contiennent la balise FORM et ou S ne contient pas la balise FORM -->
<xsl:if test="not(FORM) and (W/FORM or W/M/FORM)">
<!-- Recuperation des mots ou morphemes puis concatenation pour former une phrase -->
<xsl:for-each select="W">
<div class="word_sentence" >
<xsl:choose>
<xsl:when test="FORM">
<xsl:value-of select="FORM"/>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="M/@class='i'">
<i>
<xsl:for-each select="M/FORM">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</i>
</xsl:when>
<xsl:otherwise> <xsl:value-of select="M/FORM"/> </xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</div>
</xsl:for-each>
</xsl:if>
<br />
<!-- Recupere les mots avec leur glose -->
<xsl:if test="(W/FORM and W/TRANSL) or (W/M/FORM and W/M/TRANSL) ">
<xsl:for-each select="W">
<table class="word">
<tbody>
<tr>
<td class="word_form">
<xsl:choose>
<xsl:when test="FORM">
<xsl:value-of select="FORM"/>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="M/@class='i'">
<i>
<xsl:for-each select="M/FORM">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</i>
</xsl:when>
<xsl:otherwise>
<xsl:for-each select="M/FORM">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</td>
</tr>
<tr>
<td class="word_transl">
<xsl:choose>
<xsl:when test="M/TRANSL[@xml:lang or @lang] or TRANSL[@xml:lang or @lang]">
<xsl:if test="M/TRANSL[@xml:lang='en' or @lang='en']">
<xsl:for-each select="M/TRANSL[@xml:lang='en' or @lang='en']">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
<xsl:if test="M/TRANSL[@xml:lang='fr']">
<xsl:for-each select="M/TRANSL[@xml:lang='fr' or @lang='fr']">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
<xsl:if test="not(M/TRANSL[@xml:lang='en' or @lang='en']) and not(M/TRANSL[@xml:lang='fr' or @lang='fr'])">
<xsl:for-each select="M/TRANSL">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
<xsl:if test="TRANSL[@xml:lang='en' or @lang='en']">
<xsl:value-of select="TRANSL[@xml:lang='en' or @lang='en']"/>
</xsl:if>
<xsl:if test="TRANSL[@xml:lang='fr' or @lang='fr']">
<xsl:value-of select="TRANSL[@xml:lang='fr' or @lang='fr']"/>
</xsl:if>
<xsl:if test="not(TRANSL[@xml:lang='en' or @lang='en']) and not(TRANSL[@xml:lang='fr' or @lang='fr'])">
<xsl:for-each select="TRANSL">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:if test="M/TRANSL">
<xsl:for-each select="M/TRANSL[1]">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
<xsl:if test="TRANSL">
<xsl:value-of select="TRANSL[1]"/>
</xsl:if>
</xsl:otherwise>
</xsl:choose>
</td>
</tr>
</tbody>
</table>
</xsl:for-each>
</xsl:if>
<br/>
<br/>
<xsl:if test="TRANSL">
<!-- Recupere la traduction si il en existe une -->
<xsl:for-each select="TRANSL[@xml:lang='en' or @lang='en']">
<div class="translation_en">
<xsl:value-of select="."/><br />
</div>
</xsl:for-each>
<xsl:for-each select="TRANSL[@xml:lang='fr' or @lang='fr']">
<div class="translation_fr">
<xsl:value-of select="."/><br />
</div>
</xsl:for-each>
<xsl:for-each select="TRANSL[(@xml:lang!='fr' or @lang!='fr') and (@xml:lang!='en' or @lang!='fr')]">
<div class="translation_other">
<xsl:value-of select="."/><br />
</div>
</xsl:for-each>
</xsl:if>
<br />
</td>
</xsl:when>
<xsl:otherwise>
<td class="segmentContent" width="600px">
Sentence <xsl:value-of select="$num_s"/><br/>
<!--<a href="javascript:boutonStop()">
<img src="../outils/stop.gif" alt="stop"/>
</a>
<a href="javascript:playFrom('{position()}')">
<img src="../outils/play.gif" alt="écouter"/>
</a>-->
<!-- affiche le nom du locuteur si il y en a -->
<xsl:if test="((@who) and (not(@who='')) and (not(@who=ancestor::TEXT/S[number(position())-1]/@who)))">
<span class="speaker">
<xsl:value-of select="@who"/><xsl:text>: </xsl:text>
</span>
</xsl:if>
<!-- cas ou S contient la balise FORM -->
<xsl:if test="FORM">
<div class="word_sentence">
<!-- Recuperation de la phrase -->
<xsl:for-each select="FORM">
<xsl:choose>
<xsl:when test="@kindOf">
<xsl:if test="@kindOf='phono'">
<div class="transcription_phono">
<xsl:value-of select="."/>
</div>
</xsl:if>
<xsl:if test="@kindOf='ortho'">
<div class="transcription_ortho">
<xsl:value-of select="."/>
</div>
</xsl:if>
<xsl:if test="@kindOf='phone'">
<div class="transcription_phone">
<xsl:value-of select="."/>
</div>
</xsl:if>
<xsl:if test="@kindOf='transliter'">
<div class="transcription_translit">
<xsl:value-of select="."/>
</div>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<div class="transcription">
<xsl:value-of select="."/>
</div>
</xsl:otherwise>
</xsl:choose>
<br />
</xsl:for-each>
</div>
</xsl:if>
<!-- Cas ou W ou M contiennent la balise FORM et ou S ne contient pas la balise FORM -->
<xsl:if test="not(FORM) and (W/FORM or W/M/FORM)">
<!-- Recuperation des mots ou morphemes puis concatenation pour former une phrase -->
<xsl:for-each select="W">
<div class="word_sentence" >
<xsl:choose>
<xsl:when test="FORM">
<xsl:value-of select="FORM"/>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="M/@class='i'">
<i>
<xsl:for-each select="M/FORM">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</i>
</xsl:when>
<xsl:otherwise> <xsl:value-of select="M/FORM"/> </xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</div>
</xsl:for-each>
</xsl:if>
<br />
<!-- Recupere les mots avec leur glose -->
<xsl:if test="(W/FORM and W/TRANSL) or (W/M/FORM and W/M/TRANSL) ">
<xsl:for-each select="W">
<table class="word">
<tbody>
<tr>
<td class="word_form">
<xsl:choose>
<xsl:when test="FORM">
<xsl:value-of select="FORM"/>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="M/@class='i'">
<i>
<xsl:for-each select="M/FORM">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</i>
</xsl:when>
<xsl:otherwise>
<xsl:for-each select="M/FORM">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</td>
</tr>
<tr>
<td class="word_transl">
<xsl:choose>
<xsl:when test="M/TRANSL[@xml:lang or @lang] or TRANSL[@xml:lang or @lang]">
<xsl:if test="M/TRANSL[@xml:lang='en' or @lang='en']">
<xsl:for-each select="M/TRANSL[@xml:lang='en' or @lang='en']">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
<xsl:if test="M/TRANSL[@xml:lang='fr']">
<xsl:for-each select="M/TRANSL[@xml:lang='fr' or @lang='fr']">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
<xsl:if test="not(M/TRANSL[@xml:lang='en' or @lang='en']) and not(M/TRANSL[@xml:lang='fr' or @lang='fr'])">
<xsl:for-each select="M/TRANSL">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
<xsl:if test="TRANSL[@xml:lang='en' or @lang='en']">
<xsl:value-of select="TRANSL[@xml:lang='en' or @lang='en']"/>
</xsl:if>
<xsl:if test="TRANSL[@xml:lang='fr' or @lang='fr']">
<xsl:value-of select="TRANSL[@xml:lang='fr' or @lang='fr']"/>
</xsl:if>
<xsl:if test="not(TRANSL[@xml:lang='en' or @lang='en']) and not(TRANSL[@xml:lang='fr' or @lang='fr'])">
<xsl:for-each select="TRANSL">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:if test="M/TRANSL">
<xsl:for-each select="M/TRANSL[1]">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">-</xsl:if>
</xsl:for-each>
</xsl:if>
<xsl:if test="TRANSL">
<xsl:value-of select="TRANSL[1]"/>
</xsl:if>
</xsl:otherwise>
</xsl:choose>
</td>
</tr>
</tbody>
</table>
</xsl:for-each>
</xsl:if>
<br/>
<br/>
<xsl:if test="TRANSL">
<!-- Recupere la traduction si il en existe une -->
<xsl:for-each select="TRANSL[@xml:lang='en' or @lang='en']">
<div class="translation_en">
<xsl:value-of select="."/><br />
</div>
</xsl:for-each>
<xsl:for-each select="TRANSL[@xml:lang='fr' or @lang='fr']">
<div class="translation_fr">
<xsl:value-of select="."/><br />
</div>
</xsl:for-each>
<xsl:for-each select="TRANSL[(@xml:lang!='fr' or @lang!='fr') and (@xml:lang!='en' or @lang!='fr')]">
<div class="translation_other">
<xsl:value-of select="."/><br />
</div>
</xsl:for-each>
</xsl:if>
<br />
</td>
</xsl:otherwise>
</xsl:choose>
</tr>
</xsl:for-each>
</table>


</xsl:template>






<xsl:template name="player-audio_wav_file1">
<xsl:param name="f1_sound" select="$f1_sound"/>
<xsl:param name="file" select="$file"/>
<script language="Javascript">
<xsl:text>var IDS = new Array(</xsl:text>
<xsl:for-each select="document($file)//TEXT/S">
"<xsl:value-of select="position()"/>"
<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
</xsl:for-each>
<xsl:text>);</xsl:text>
<xsl:text>var STARTS = new Array(</xsl:text>
<xsl:for-each select="document($file)//TEXT/S/AUDIO">
"<xsl:value-of select="@start"/>"
<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
</xsl:for-each>
<xsl:text>);</xsl:text>
<xsl:text>var ENDS = new Array(</xsl:text>
<xsl:for-each select="document($file)//TEXT/S/AUDIO">
"<xsl:value-of select="@end"/>"
<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
</xsl:for-each>
<xsl:text>);</xsl:text>
</script>
<object id="player" width="350" height="16" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
<param name="AUTOPLAY" value="false"/>
<param name="CONTROLLER" value="true"/>
<embed width="350pt" height="16px" pluginspace="http://www.apple.com/quicktime/download/" controller="true" src="{$f1_sound}" name="player" autostart="false" enablejavascript="true">
</embed>
</object>
<!--<span style="margin-left:10px"> Lecture en continu: </span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>-->
<script type="text/javascript" src="../outils/showhide.js">.</script>
<script type="text/javascript" src="../outils/qtPlayerManager.js">.</script>
</xsl:template>

</xsl:stylesheet>


