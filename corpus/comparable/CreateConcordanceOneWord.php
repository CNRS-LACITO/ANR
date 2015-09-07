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
    <td width="1200" height="700" align="left" valign="top" bgcolor="#FFFFFF">
      <?php
		
		
		$file1=  isset($_POST["file1"])    ? $_POST["file1"]    : "*";
	$file2=  isset($_POST["file2"])    ? $_POST["file2"]    : "*";
	$file3=  isset($_POST["file3"])    ? $_POST["file3"]    : "*";
	$file4=  isset($_POST["file4"])    ? $_POST["file4"]    : "*";
	$file5=  isset($_POST["file5"])    ? $_POST["file5"]    : "*";
	$file6=  isset($_POST["file6"])    ? $_POST["file6"]    : "*";
	
	$filesim=  isset($_POST["filesim"])    ? $_POST["filesim"]    : "*";
	
	$nbsim=  isset($_POST["nbsim"])    ? $_POST["nbsim"]    : "*";
	
	

    
    
    echo "<a href=\"BackViewAllSimilarities.php?similarity=$filesim&amp;file1=$file1&amp;file2=$file2&amp;file3=$file3&amp;file4=$file4&amp;file5=$file5&amp;file6=$file6&amp;nbsim=$nbsim\"><span style=\"color:#30F\"><b>Back to selected corpus</b></span></a> </p>";
		
	  set_time_limit(0); 
	  
	  
		$mot=htmlspecialchars($_POST['mot']);
		
		CreateConcordanceOneWord($mot, $filesim, $file1, $file2, $file3, $file4, $file5, $file6);
	 


	 
function CreateConcordanceOneWord($mot, $filesim, $file1, $file2, $file3, $file4, $file5, $file6) {
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			
			
			  $xsl->load('ConcordanceOneWord_xml.xsl');
			 
			  $xp->setParameter('', 'mot', $mot);
			  
			  $xp->setParameter('', 'filesim', $filesim);
			  $xp->setParameter('', 'file1', $file1);
			  $xp->setParameter('', 'file2', $file2);
			  $xp->setParameter('', 'file3', $file3);
			  $xp->setParameter('', 'file4', $file4);
			  $xp->setParameter('', 'file5', $file5);
			  $xp->setParameter('', 'file6', $file6);
			 
			  $xp->setParameter('', 'mot', $mot);
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML data
			  $xml_doc = new DomDocument;
			  //$xml_doc->load('http://lacito.vjf.cnrs.fr/archivage/tools/metadata_lacito.xml');
			 $xml_doc->load($filesim);

			  
			  if ( strpos( $_SERVER['HTTP_USER_AGENT'], 'Firefox' ) !== FALSE ) { $navigator="Firefox"; }
					/*elseif ( strpos( $_SERVER['HTTP_USER_AGENT'], 'Opera' ) !== FALSE ) { echo " Opera"; }
					elseif ( strpos( $_SERVER['HTTP_USER_AGENT'], 'Safari' ) !== FALSE ) { echo "Safari"; }
					elseif ( strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE' ) !== FALSE ) { echo "IE"; }*/
					else { $navigator="Other"; }
			  
			   if ($doc_res = $xp->transformToDoc($xml_doc)) {
					
			  
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			
			 
			 $xsl->load("ConcordanceOneWord_tri.xsl");
			
			$xp->setParameter('', 'mot', $mot);
			  
			  $xp->setParameter('', 'filesim', $filesim);
			  $xp->setParameter('', 'file1', $file1);
			  $xp->setParameter('', 'file2', $file2);
			  $xp->setParameter('', 'file3', $file3);
			  $xp->setParameter('', 'file4', $file4);
			  $xp->setParameter('', 'file5', $file5);
			  $xp->setParameter('', 'file6', $file6);
			  
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
    <td width="1200" height="30" align="center"><b>Corpus and dictionaries compiled thanks to funding by the ANR.</b></td>
  </tr>
  <tr>
    <td width="1200" align="center"><img src="../../images/logos/ANR.gif"></td>
  </tr>
</table>
</body>
</html>