<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:param name="tri_demande" select="''"/>
	
    <xsl:param name="filesim" select="'*'"/>
<xsl:param name="nbsim" select="'*'"/>
<xsl:param name="file1" select="'*'"/>
<xsl:param name="file2" select="'*'"/>
<xsl:param name="file3" select="'*'"/>
<xsl:param name="file4" select="'*'"/>
<xsl:param name="file5" select="'*'"/>
<xsl:param name="file6" select="'*'"/>

	
	<!-- ******************************************************** -->
	<xsl:template match="/">
		
		<html>
			<head>
				<script src="../outils/showhide.js" type="text/javascript">.</script>
			
				
			</head>
			<body>
  
		
				
				
				
				<div style="margin-left: 5px;">
					
					
					

					<br/><br/>
				
					
					</div>
				<!--<xsl:value-of select="$url_similarities"/>-->
				
				
				
				<table width="100%" border="0" cellpadding="5" cellspacing="0" bordercolor="#993300" class="it">
					<tbody>
						
						<tr>
							<td valign="top">
								
								<table border="1">
									
								<!--PARTIE TRAITEMENT ET AFFICHAGE-->
									<tr>
										
										<table border="1">
											<tr>
												<th align="center">No</th>
												<th align="center">Histoire</th>
												<th align="center">Phrase</th>
												<th align="center">Contexte gauche</th>
												<th align="center">Mot</th>
												<th align="center">Contexte droit</th>
												<th align="center">Gloses</th>
											</tr>
											
											<xsl:for-each select="liste/mot">
												<xsl:sort select="trad_mot" order="ascending"/>
												<!--<xsl:sort select="number(java:mysort.mysortvalue(string(./morph), string('1')))" data-type="number"/>
												<xsl:sort select="number(java:mysort.mysortvalue(string(./morph), string('2')))" data-type="number"/>--> 
												
												<xsl:variable name="nom_s" select="num_phrase"/>
												<xsl:variable name="nom_t" select="texte"/>
												<!--<xsl:variable name="nom_t" select="document($filesim)//similarities/files/file[@id=$texte]/@title"/>-->
												
												<tr>
													<!--<td><xsl:value-of select="$no+1"/></td>-->
													<td><xsl:value-of select="position()"/></td>
													<td><!--<a href="CreateConcordance.php?tri=trad_mot&amp;phrase={$nom_s}&amp;texte={$nom_t}">--><xsl:value-of select="document($filesim)//similarities/files/file[@xml=$nom_t]/@title"/><!--</a>--></td>	
													<td><xsl:value-of select="num_phrase"/></td>	
													<td align="right" class="all_form"><xsl:value-of select="mot_gauche"/></td>
					
													<xsl:value-of select="document($filesim)//similarities/similarity/file[@id=$nom_t]/sentence[@id=$nom_s]"/>
														<xsl:variable name="num_sim" select="document($filesim)//similarities/similarity/file[@id=$nom_t]/sentence[@id=$nom_s]/parent::node()/parent::node()/@id"/>
														<xsl:variable name="similarity" select="document($filesim)//similarities/similarity/file[@id=$nom_t]/sentence[@id=$nom_s]/parent::node()/parent::node()/@id"/>
														<xsl:variable name="color" select="document($filesim)//similarities/similarity/file[@id=$nom_t]/sentence[@id=$nom_s]/parent::node()/parent::node()/color"/>				
													<xsl:variable name="mot" select="mot_cours"/>
													
													
													<td bgcolor="grey" class="all_form"><a href="#" onClick="window.open('ViewOneSimilarity.php?filesim={$filesim}&amp;color={$color}&amp;file={$nom_t}&amp;sentence={$nom_s}&amp;mot={$mot}','Fiche','toolbar=no,status=no,width=900 ,height=600,scrollbars=yes,location=no,resize=yes,menubar=yes')"><xsl:value-of select="mot_cours"/></a></td>	
													<td align="left" class="all_form"><xsl:value-of select="mot_droite"/></td>	
													<td><xsl:value-of select="trad_mot"/></td>														
												</tr>
											
									
											</xsl:for-each>
										</table>	
						</tr>
								</table>
							</td>
							
											
										
							
						</tr>		
					</tbody>
				</table>
				
			</body>
			</html>
	</xsl:template>	
	

	<xsl:template name="player-audio_wav_file1">
		<xsl:param name="f1_sound" select="$f1_sound"/>
		<xsl:param name="f1_xml" select="$f1_xml"/>
		<script language="Javascript">
			<xsl:text>var IDS    = new Array(</xsl:text>
			<xsl:for-each select="document($f1_xml)//TEXT/S">
	   			"<xsl:value-of select="position()"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var STARTS = new Array(</xsl:text>
			<xsl:for-each select="document($f1_xml)//TEXT/S/AUDIO">
	   			"<xsl:value-of select="@start"/>"
	   			<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var ENDS   = new Array(</xsl:text>
			<xsl:for-each select="document($f1_xml)//TEXT/S/AUDIO">
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
	
	
	
	<xsl:template name="player-audio_wav_file2">
		<xsl:param name="f2_sound" select="$f2_sound"/>
		<xsl:param name="f2_xml" select="$f2_xml"/>
		<script language="Javascript">
			<xsl:text>var IDS    = new Array(</xsl:text>
			<xsl:for-each select="document($f2_xml)//TEXT/S">
	   			"<xsl:value-of select="position()"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var STARTS = new Array(</xsl:text>
			<xsl:for-each select="document($f2_xml)//TEXT/S/AUDIO">
	   			"<xsl:value-of select="@start"/>"
	   			<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var ENDS   = new Array(</xsl:text>
			<xsl:for-each select="document($f2_xml)//TEXT/S/AUDIO">
	  	 		"<xsl:value-of select="@end"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
		</script>
		
		<object id="player" width="350" height="16" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
			<param name="AUTOPLAY" value="false"/>
			<param name="CONTROLLER" value="true"/>
			<embed width="350pt" height="16px" pluginspace="http://www.apple.com/quicktime/download/" controller="true" src="{$f2_sound}" name="player" autostart="false" enablejavascript="true">
			</embed>
		</object>
		
		
		<!--<span style="margin-left:10px"> Lecture en continu: </span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>-->
		<script type="text/javascript" src="../outils/showhide.js">.</script>
		
		<script type="text/javascript" src="../outils/qtPlayerManager.js">.</script>
		
	</xsl:template>
	
	
	
	<xsl:template name="player-audio_wav_file3">
		<xsl:param name="f3_sound" select="$f3_sound"/>
		<xsl:param name="f3_xml" select="$f3_xml"/>
		<script language="Javascript">
			<xsl:text>var IDS    = new Array(</xsl:text>
			<xsl:for-each select="document($f3_xml)//TEXT/S">
	   			"<xsl:value-of select="position()"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var STARTS = new Array(</xsl:text>
			<xsl:for-each select="document($f3_xml)//TEXT/S/AUDIO">
	   			"<xsl:value-of select="@start"/>"
	   			<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
			
			<xsl:text>var ENDS   = new Array(</xsl:text>
			<xsl:for-each select="document($f3_xml)//TEXT/S/AUDIO">
	  	 		"<xsl:value-of select="@end"/>"
	  	 		<xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if>
			</xsl:for-each>
			<xsl:text>);</xsl:text>
		</script>
		
		<object id="player" width="350" height="16" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
			<param name="AUTOPLAY" value="false"/>
			<param name="CONTROLLER" value="true"/>
			<embed width="350pt" height="16px" pluginspace="http://www.apple.com/quicktime/download/" controller="true" src="{$f3_sound}" name="player3" autostart="false" enablejavascript="true">
			</embed>
		</object>
		
		
		<!--<span style="margin-left:10px"> Lecture en continu: </span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>-->
		<script type="text/javascript" src="../outils/showhide.js">.</script>
		
		<script type="text/javascript" src="../outils/qtPlayerManager.js">.</script>
		
	</xsl:template>
        
  
   
    
</xsl:stylesheet>
