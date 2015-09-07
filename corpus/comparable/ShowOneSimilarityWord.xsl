<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:param name="color" select="''"/>
    <xsl:param name="similarity" select="''"/>
	
	<xsl:param name="mot" select="''"/>
    
	<xsl:param name="filesim" select="'*'"/>

    <xsl:param name="file1" select="'*'"/>
    <xsl:param name="file2" select="'*'"/>
    <xsl:param name="file3" select="'*'"/>
    <xsl:param name="file4" select="'*'"/>
    <xsl:param name="file5" select="'*'"/>
    <xsl:param name="file6" select="'*'"/>
	
	<!-- ******************************************************** -->
	 <xsl:template match="/">
    
    <!--<xsl:value-of select="$filesim"/>-->
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
			<head>
				<meta http-equiv="Content-Language" content="fr"/>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<script src="../outils/showhide.js" type="text/javascript">.</script>
				<link href="../../styles.css" rel="stylesheet" type="text/css"/>

			</head>
			<body>
				
			
				<!--<xsl:value-of select="$url_similarities"/>-->
				
				
				
				
				<table width="100%" border="0" cellpadding="5" cellspacing="0" bordercolor="#000000">
					<tbody>
						<th align="left" bgcolor="#CCCCCC"><p><b>Similarity <xsl:value-of select="$similarity"/> </b><br/></p></th>
                 
                <xsl:if test="document($filesim)//similarities/similarity[@id=$similarity]/file[@id=$file1]">
                
           			 <xsl:call-template name="onesim">
                   		<xsl:with-param name="file" select="$file1"/>
                        <xsl:with-param name="xml" select="document($filesim)//similarities/files/file[@id=$file1]/@xml"/>
                    	<xsl:with-param name="lang" select="document($filesim)//similarities/files/file[@id=$file1]/@lang"/>
                    	<xsl:with-param name="title" select="document($filesim)//similarities/files/file[@id=$file1]/@title"/>
           			</xsl:call-template>
   	 			
                </xsl:if>
                <xsl:if test="document($filesim)//similarities/similarity[@id=$similarity]/file[@id=$file2]">
               
           			 <xsl:call-template name="onesim">
                   		<xsl:with-param name="file" select="$file2"/>
                        <xsl:with-param name="xml" select="document($filesim)//similarities/files/file[@id=$file2]/@xml"/>
                    	<xsl:with-param name="lang" select="document($filesim)//similarities/files/file[@id=$file2]/@lang"/>
                    	<xsl:with-param name="title" select="document($filesim)//similarities/files/file[@id=$file2]/@title"/>
           			</xsl:call-template>
   	 			
                </xsl:if>
                <xsl:if test="document($filesim)//similarities/similarity[@id=$similarity]/file[@id=$file3]">
                
           			 <xsl:call-template name="onesim">
                   		<xsl:with-param name="file" select="$file3"/>
                        <xsl:with-param name="xml" select="document($filesim)//similarities/files/file[@id=$file3]/@xml"/>
                    	<xsl:with-param name="lang" select="document($filesim)//similarities/files/file[@id=$file3]/@lang"/>
                    	<xsl:with-param name="title" select="document($filesim)//similarities/files/file[@id=$file3]/@title"/>
           			</xsl:call-template>
   	 			
                </xsl:if>
                <xsl:if test="document($filesim)//similarities/similarity[@id=$similarity]/file[@id=$file4]">
               
           			 <xsl:call-template name="onesim">
                   		<xsl:with-param name="file" select="$file4"/>
                        <xsl:with-param name="xml" select="document($filesim)//similarities/files/file[@id=$file4]/@xml"/>
                    	<xsl:with-param name="lang" select="document($filesim)//similarities/files/file[@id=$file4]/@lang"/>
                    	<xsl:with-param name="title" select="document($filesim)//similarities/files/file[@id=$file4]/@title"/>
           			</xsl:call-template>
   	 		
                </xsl:if>
                <xsl:if test="document($filesim)//similarities/similarity[@id=$similarity]/file[@id=$file5]">
               
           			 <xsl:call-template name="onesim">
                   		<xsl:with-param name="file" select="$file5"/>
                        <xsl:with-param name="xml" select="document($filesim)//similarities/files/file[@id=$file5]/@xml"/>
                    	<xsl:with-param name="lang" select="document($filesim)//similarities/files/file[@id=$file5]/@lang"/>
                    	<xsl:with-param name="title" select="document($filesim)//similarities/files/file[@id=$file5]/@title"/>
           			</xsl:call-template>
   	 		
                </xsl:if>
                <xsl:if test="document($filesim)//similarities/similarity[@id=$similarity]/file[@id=$file6]">
               
           			 <xsl:call-template name="onesim">
                   		<xsl:with-param name="file" select="$file6"/>
                        <xsl:with-param name="xml" select="document($filesim)//similarities/files/file[@id=$file6]/@xml"/>
                    	<xsl:with-param name="lang" select="document($filesim)//similarities/files/file[@id=$file6]/@lang"/>
                    	<xsl:with-param name="title" select="document($filesim)//similarities/files/file[@id=$file6]/@title"/>
           			</xsl:call-template>
   	 			
                </xsl:if>
						   
							
					
						
						
					</tbody>
				</table>
				   
			</body>
			</html>
	</xsl:template>	
	
    
      <xsl:template name="onesim">

                                    <xsl:param name="file" select="''"/>
                                    <xsl:param name="xml" select="''"/>
                                    <xsl:param name="lang" select="''"/>
                                    <xsl:param name="title" select="''"/>
								<tr>
                                <td valign="top">
                                <table>
                                
                                <table border="1" cellpadding="5" cellspacing="0" bordercolor="#000000">
									<tr><th align="left" style="font-size:18px"><i> <xsl:value-of select="$title"/></i></th></tr>
									<!--<tr><th align="left" style="font-size:13px">Language: <xsl:value-of select="document($filesim)//similarities/files/file[@id=$file]/@lang"/>  </th></tr>-->
                                </table>
								<!--<xsl:call-template name="player-audio_wav_file1">
									<xsl:with-param name="f1_sound" select="$f1_sound"/>
									<xsl:with-param name="f1_xml" select="$f1_xml"/>
								</xsl:call-template>-->
								<!--PARTIE TRAITEMENT ET AFFICHAGE FILE1-->
								    
							<xsl:for-each select="document($xml)//TEXT/S">
								<xsl:variable name="num_s" select="position()" />
								<xsl:variable name="id_s" select="@id" />
								
								
								
									<xsl:if test="document($filesim)//similarities/similarity[@id=$similarity]/file[@id=$file]/sentence[@id=$id_s]">
										<xsl:variable name="num_sim" select="document($filesim)//similarities/similarity[@id=$similarity]/file[@id=$file]/sentence"/>	
										<tr>
										<td class="segmentContent" width="600px" bgcolor="{$color}">
											<br/>
											<b><span style="background-color:#FDD9AC">Sentence <xsl:value-of select="$num_s"/></span></b>
										
											<br/>
											
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
																	<xsl:otherwise>  <xsl:value-of select="M/FORM"/>  </xsl:otherwise>
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
																		
																		<xsl:when test="not(FORM)">
																			<xsl:choose>
																				<xsl:when test="M/@class='i'">
																					<i>
																						<xsl:for-each select="M">
																							<xsl:if test="FORM=$mot">
																								<span style="background:pink"><xsl:value-of select="FORM"/>
																									<xsl:if test="position()!=last()">-</xsl:if></span>
																							</xsl:if>
																							<xsl:if test="FORM!=$mot"><xsl:value-of select="FORM"/>
																								<xsl:if test="position()!=last()">-</xsl:if></xsl:if>
																							
																						</xsl:for-each>
																						
																					</i>
																				</xsl:when>
																				<xsl:otherwise>  
																					
																					<xsl:for-each select="M">
																						<xsl:if test="FORM = $mot">
																							<span style="background:pink"><xsl:value-of select="FORM"/>
																								<xsl:if test="position()!=last()">-</xsl:if></span>
																						</xsl:if>
																						<xsl:if test="FORM!=$mot"><xsl:value-of select="FORM"/>
																							<xsl:if test="position()!=last()">-</xsl:if></xsl:if>
																						
																					</xsl:for-each>
																					
																				</xsl:otherwise>
																			</xsl:choose>
																		</xsl:when>
																		
																		<xsl:otherwise >
																			<xsl:if test="FORM = $mot">
																				<span style="background:pink"><xsl:value-of select="FORM"/></span>
																			</xsl:if>
																			<xsl:if test="FORM!=$mot"><xsl:value-of select="FORM"/></xsl:if>
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
											
											
											<br/><br/>
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
												<br/>
											</xsl:if>
											
										</td>
										</tr>
										
										
										
										
									</xsl:if>
									
							
								
								
								
							</xsl:for-each>
								</table>
							</td>
                            
                            </tr>
                            
                            
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
		
 
		<span style="margin-left:10px"> Lecture en continu: </span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>
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
		
		
		<span style="margin-left:10px"> Lecture en continu: </span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>
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
		
		
		<span style="margin-left:10px"> Lecture en continu: </span><input id="karaoke" name="karaoke" checked="checked" type="checkbox"/>
		<script type="text/javascript" src="../outils/showhide.js">.</script>
		
		<script type="text/javascript" src="../outils/qtPlayerManager.js">.</script>
		
	</xsl:template>
        
  
   
    
</xsl:stylesheet>
