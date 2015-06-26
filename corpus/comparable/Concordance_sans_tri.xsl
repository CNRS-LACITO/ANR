<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">




	<xsl:param name="tri_demande" select="''"/>
	
	<xsl:param name="f1_xml" select="similarities/files/file[1]/@xml"/>
	<xsl:param name="f2_xml" select="similarities/files/file[2]/@xml"/>
	<xsl:param name="f3_xml" select="similarities/files/file[3]/@xml"/>
	
	<xsl:param name="f1_lang" select="similarities/files/file[1]/@lang"/>
	<xsl:param name="f2_lang" select="similarities/files/file[2]/@lang"/>
	<xsl:param name="f3_lang" select="similarities/files/file[3]/@lang"/>
	
	<xsl:param name="f1_sound" select="similarities/files/file[1]/@sound"/>
	<xsl:param name="f2_sound" select="similarities/files/file[2]/@sound"/>
	<xsl:param name="f3_sound" select="similarities/files/file[3]/@sound"/>
	
	<!-- ******************************************************** -->
	<xsl:template match="/">
		
		<html>
			<head>
				<script src="../outils/showhide.js" type="text/javascript">.</script>
			
				
				
				
				<style>
					/*****************************************************************************/     
					/* pour presenter un texte interlineaire                                    **/
					/*****************************************************************************/  
					
					
					table.it {
					border-collapse: separate;
					}
					
					.transcriptTable { 
					border-collapse:collapse;
					vertical-align:middle;
					/*background-color:#D3E8FA;*/
					/*  background-color:#CBE2FE;*/
					background-color:#EEF8FF;
					}
					
					.segmentInfo {
					background-color:#0E3263;
					color:White;
					vertical-align:top;
					/**
					width:60px;
					**/
					}
					
					.segmentContent {	
					width:600px;
					}
					
					.sentence {			
					border-collapse: separate ;
					display: inline;
					vertical-align:middle;
					text-align:left;	
					}
					
					/*Couleur de la phrase de transcription*/
					.word_sentence {				
					font-family:'charis SIL','caslon','Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					border-collapse: separate ;
					display: inline;
					/*	color:#000066;*/
					color:#0E3263;
					font-size:15px;
					text-align:left;
					font-weight: bold;				
					}
					
					/*Couleur de la phrase de traduction*/
					.translation_en {
					font-family:'Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					/*color:#ff9900;*/
					/*color:#3366FF;*/
					color:#2E6398;
					text-align:left;
					font-weight: bold; 
					font-size:12px;
					display:inline;			
					}
					
					.translation_fr {				
					font-family:'Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					/*color:#ff9900;*/
					/*color:#3366FF;*/
					/*color:#566772;*/
					/*color:#474B69;*/
					color:#5A78AF;
					text-align:left;
					font-weight: bold; 
					font-size:12px;
					display:inline;		
					}
					
					.translation_other {				
					font-family:'Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					/*color:#ff9900;*/
					/*color:#3366FF;*/
					color:#187C96;
					text-align:left;
					font-weight: bold;
					font-size:12px; 
					display:inline;
					}
					
					.word                     { 
					border-collapse: separate ;
					display: inline;
					vertical-align:middle;
					text-align:left;
					}
					
					.word_tab                     { 
					vertical-align:middle;
					text-align:left;
					display:inline;
					}
					
					.word_form {
					/*background-color:#FEF1D4;*/
					font-family:'charis SIL','caslon','Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					font-weight: bold; 
					text-align:left;
					font-size:15px;
					}
					
					.word_transl {
					font-family:'caslon','Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					/*background-color:#FEF1D4;*/
					color:#5F5F5F;	
					text-align:left;
					}
					
					.transcription {
					font-family:'charis SIL','caslon','Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					text-align:left;
					display:inline;
					font-weight: bold; 
					font-size:15px;
					color:#0E3263;
					}
					
					.transcription_phono {
					font-family:'charis SIL','caslon','Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					text-align:left;
					display:inline;
					font-weight: bold; 
					font-size:15px;
					color:#0E3263;
					}
					
					.transcription_ortho {
					font-family:'charis SIL','caslon','Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					text-align:left;
					display:inline;
					font-weight: bold; 
					font-size:15px;
					color:#0E3263;
					}
					
					.transcription_phone {
					font-family:'charis SIL','caslon','Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					text-align:left;
					display:inline;
					font-weight: bold; 
					font-size:15px;
					color:#0E3263;
					}
					
					.transcription_translit {
					font-family:'charis SIL','caslon','Arial Unicode MS','Lucida sans unicode','Code2000',sans-serif;
					text-align:left;
					display:inline;
					font-weight: bold; 
					font-size:15px;
					color:#0E3263;
					}
					
					.note_info {
					font-family:sans-serif,'caslon','Arial Unicode MS','Lucida sans unicode','Code2000';
					text-align:left;
					font-weight:bold; 
					font-size:11px;
					color:#000;
					display:none;
					}
					
				</style>
			</head>
			<body>
  
				
				
				
				
				<div style="margin-left: 5px;">
					
					
					
				
					<div>
						Rechercher un terme :
						<br/>
						<form id="form" name="form" action="CreateConcordanceOneWord.php"  method="post">
						<input name="mot" type="text" title="mot"  />
						
							<input type="submit" value="OK" />
						</form>
					</div>
					
					
					
					</div>
				<!--<xsl:value-of select="$url_similarities"/>-->
				
				
				
				<table width="100%" border="0" cellpadding="5" cellspacing="0" bordercolor="#993300" class="it">
					<tbody>
						<!--<tr>
							<td>
								phrase :
								<xsl:if test="document($txt)//TEXT/S[@id=$phr]">
									<xsl:for-each select="document($txt)//TEXT/S[@id=$phr]/W">
										<xsl:for-each select="M">
										<xsl:value-of select="FORM"/>
										<xsl:if test="position()!=last()">-</xsl:if>
										</xsl:for-each>
										
									<xsl:for-each select="M">
									<xsl:value-of select="TRANSL"/>
									<xsl:if test="position()!=last()">-</xsl:if>
									</xsl:for-each>
										</xsl:for-each>
								</xsl:if>
							</td>
						</tr>-->
						<tr>
							<td valign="top">
								
								<table border="1">
									<!--<tr><th align="center"><xsl:value-of select="$f1_lang"/></th></tr>
									<tr><th align="center"><xsl:value-of select="$f1_xml"/></th></tr>-->
								<!--<xsl:call-template name="player-audio_wav_file1">
									<xsl:with-param name="f1_sound" select="$f1_sound"/>
									<xsl:with-param name="f1_xml" select="$f1_xml"/>
								</xsl:call-template>-->
								<!--PARTIE TRAITEMENT ET AFFICHAGE FILE1-->
									<tr>
										
										<table border="1">
											<tr>
												<th align="center"><a href="CreateConcordance.php?tri=texte">No</a></th>
												<th align="center"><a href="CreateConcordance.php?tri=texte">Texte</a></th>
												<th align="center"><a href="CreateConcordance.php?tri=num_phrase">Phrase</a></th>
												<th align="center"><a href="CreateConcordance.php?tri=mot_gauche">Contexte gauche</a></th>
												<th align="center"><a href="CreateConcordance.php?tri=mot_cours">Mot</a></th>
												<th align="center"><a href="CreateConcordance.php?tri=mot_droite">Contexte droit</a></th>
												<th align="center"><a href="CreateConcordance.php?tri=trad_mot">Gloses</a></th>
											</tr>
											
											
											
											<xsl:for-each select="document('SIMILARITIES.xml')//similarities/files/file/@xml">
												
										
												
												<xsl:variable name="fi" select="." />
												<xsl:for-each select="document($fi)//TEXT/S">
													
													<xsl:variable name="num_s" select="position()" />
													<xsl:variable name="id_s" select="@id" />
													
													
													<!-- Recupere les mots avec leur glose -->
													<xsl:variable name="i" select="0"/>
													<xsl:choose>
														
														
														
														<xsl:when test="W/M/FORM and W/M/TRANSL">
															
															<xsl:for-each select="W/M">
																<xsl:variable name="mot" select="FORM"/>
																<tr>
																	<td><xsl:value-of select="position()"/></td>
																	
																	<td>
																		<xsl:value-of select="$fi"/>
																	</td>
																	<td>
																		<xsl:value-of select="$id_s"/>
																	</td>
																	
																	<td>
																		
																		
																		<xsl:for-each select=".">
																			<xsl:value-of select="preceding::M[8]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::M[7]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::M[6]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::M[5]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::M[4]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::M[3]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::M[2]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::M[1]/FORM"/>
																			<!--<xsl:if test="position()!=last()">-</xsl:if>-->
																		</xsl:for-each>
																		
																		
																		
																	</td>
																	<xsl:value-of select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$fi]/sentence[@id=$id_s]"/>
																	
																	<xsl:variable name="similarity" select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$fi]/sentence[@id=$id_s]/parent::node()/parent::node()/@id"/>
																	<xsl:variable name="color" select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$fi]/sentence[@id=$id_s]/parent::node()/parent::node()/color"/>				
																	
																	
																	<td bgcolor="grey"><a href="#" onClick="window.open('ViewOneSimilarity.php?similarity={$similarity}&amp;color={$color}&amp;file={$fi}&amp;sentence={$id_s}&amp;mot={$mot}','Fiche','toolbar=no,status=no,width=900 ,height=600,scrollbars=yes,location=no,resize=yes,menubar=yes')">
																		
																		<!--<xsl:for-each select="FORM">-->
																		<xsl:value-of select="FORM"/>
																		<!--<xsl:if test="position()!=last()">-</xsl:if>-->
																		<!--</xsl:for-each>-->
																	</a>
																	</td>
																	<td>
																		<xsl:for-each select=".">
																			<xsl:value-of select="following::M[1]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::M[2]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::M[3]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::M[4]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::M[5]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::M[6]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::M[7]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::M[8]/FORM"/>
																		</xsl:for-each>
																	</td>
																	<td>
																		
																		
																		<xsl:value-of select="TRANSL"/>
																		
																		
																		
																	</td>
																</tr>
															</xsl:for-each>
														</xsl:when>
														<xsl:when test="W/FORM and W/TRANSL">
															
															<xsl:for-each select="W">
																
																<xsl:variable name="mot" select="FORM"/>
																
																<tr>
																
																	<td>
																		<xsl:value-of select="$fi"/>
																	</td>
																	<td>
																		<xsl:value-of select="$id_s"/>
																	</td>
																	
																	<td>
																		
																		
																		<xsl:for-each select=".">
																			<xsl:value-of select="preceding::W[8]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::W[7]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::W[6]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::W[5]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::W[4]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::W[3]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::W[2]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="preceding::W[1]/FORM"/>
																			<!--<xsl:if test="position()!=last()">-</xsl:if>-->
																		</xsl:for-each>
																		
																		
																		
																	</td>
																	
																	<xsl:value-of select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$fi]/sentence[@id=$id_s]"/>
																	
																	<xsl:variable name="similarity" select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$fi]/sentence[@id=$id_s]/parent::node()/parent::node()/@id"/>
																	<xsl:variable name="color" select="document('SIMILARITIES.xml')//similarities/similarity/file[@id=$fi]/sentence[@id=$id_s]/parent::node()/parent::node()/color"/>				
																	
																	
																	<td bgcolor="grey"><a href="#" onClick="window.open('ViewOneSimilarity.php?similarity={$similarity}&amp;color={$color}&amp;file={$fi}&amp;sentence={$id_s}&amp;mot={$mot}','Fiche','toolbar=no,status=no,width=900 ,height=600,scrollbars=yes,location=no,resize=yes,menubar=yes')">
																		
																		<!--<xsl:for-each select="FORM">-->
																			<xsl:value-of select="."/>
																			<!--<xsl:if test="position()!=last()">-</xsl:if>-->
																		<!--</xsl:for-each>-->
																		</a>
																	</td>
																	<td>
																		<xsl:for-each select=".">
																			<xsl:value-of select="following::W[1]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::W[2]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::W[3]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::W[4]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::W[5]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::W[6]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::W[7]/FORM"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="following::W[8]/FORM"/>
																			
																		</xsl:for-each>
																	</td>
																	<td>
																		
																		
																		<xsl:value-of select="TRANSL"/>
																		
																		
																		
																	</td>
																</tr>
															</xsl:for-each>
															
															
														</xsl:when>
														
														
														
													</xsl:choose>
												</xsl:for-each>
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
