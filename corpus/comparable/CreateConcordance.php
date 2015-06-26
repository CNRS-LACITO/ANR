<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Corpus</title>
<link href="../../styles.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
a:link {
	text-decoration: none;
	color: #630;
}
a:visited {
	text-decoration: none;
	color: #630;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
</style>
</head>

<body>
<!-- Banner -->
<table width="1200" height="40" align="center">
  <tr>
    <td width="1200" height="40" align="center" colspan="2"><img src="../../images/HimalCo/baniere.jpg" width="1200" height="40" /></td>
  </tr>
  <tr>
    <td align="left"><img src="../../images/logos/cnrs.jpg" width="60" height="60" /></td>
    <td align="right"><img src="../../images/logos/ANR.gif" width="80" height="60" /></td>
  </tr>
</table>
<!-- Menu -->
<table width="1200" height="30" align="center">
  <tr>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../../index.htm">Présentation</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="mythologie.htm">Mythologie kiranti</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../../dictionaries/index.htm">Dictionnaires</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="index.htm">Corpus comparables</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../../links.htm">Liens</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../../contact.htm">Contact</a></td>
  </tr>
</table>
<!-- Body -->
<table width="1200" height="700" align="center" class="fond">
  <tr>
    <td width="1200" height="700" align="left" valign="top" bgcolor="#FFFFFF"><p> <a href="ViewAllSimilarities.php?similarity=SIMILARITIES.xml"><span style="color:#30F"><b>Retour à l'affichage du corpus complet</b></span></a> </p>
      <?php
		
		set_time_limit(0); 
		
	  $concordance=  isset($_GET["concordance"])    ? $_GET["concordance"]    : "*";
	  $tri=  isset($_GET["tri"])    ? $_GET["tri"]    : "*";
	 
				
		CreateConcordance($concordance, $tri);
					
	


function CreateConcordance($concordance, $tri) {
	
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  $xsl->load("Concordance_xml.xsl");
			 
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML data
			  $xml_doc = new DomDocument;
			  //$xml_doc->load('http://lacito.vjf.cnrs.fr/archivage/tools/metadata_lacito.xml');
			  $xml_doc->load($concordance);

			  
			  if ( strpos( $_SERVER['HTTP_USER_AGENT'], 'Firefox' ) !== FALSE ) { $navigator="Firefox"; }
					/*elseif ( strpos( $_SERVER['HTTP_USER_AGENT'], 'Opera' ) !== FALSE ) { echo " Opera"; }
					elseif ( strpos( $_SERVER['HTTP_USER_AGENT'], 'Safari' ) !== FALSE ) { echo "Safari"; }
					elseif ( strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE' ) !== FALSE ) { echo "IE"; }*/
					else { $navigator="Other"; }
			  
			   if ($doc_res = $xp->transformToDoc($xml_doc)) {
					
			  
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  if (strcmp ($tri , "" )===0){
			 
			   $xp->setParameter('', 'tri_demande', "texte");
			 $xsl->load("Concordance_tri.xsl");
			 }
			 else{
			
			 $xp->setParameter('', 'tri_demande', $tri);
			 $xsl->load("Concordance_tri.xsl");
			 }
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);

			  
			  // transform the XML into HTML using the XSL file
			  if ($html = $xp->transformToXML($doc_res)) {
				  echo $html;
			  } else {
				  trigger_error('XSL transformation failed.', E_USER_ERROR);
			  }
			  }
	}	


	?></td>
  </tr>
</table>
<!-- Footer -->
<table width="1200" height="30" align="center">
  <tr>
    <td width="1200" height="30" align="center"><b>Les corpus et dictionnaires ont &eacute;t&eacute; compil&eacute;s avec l'aide financi&egrave;re de l'ANR.</b></td>
  </tr>
  <tr>
    <td width="1200" align="center"><img src="../../images/logos/ANR.gif"></td>
  </tr>
</table>
</body>
</html>
