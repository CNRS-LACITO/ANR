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
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../../index.htm">Presentation</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="index.htm">Comparable corpus</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../../dictionaries/index.htm">Dictionaries</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../../links.htm">Read more</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../documentation/index.htm">Technical documentation</a></td>
    <td width="200" height="30" align="center" background="../../images/HimalCo/bouton.png" class="menu"><a href="../../contact.htm">Contact information</a></td>
  </tr>
</table>
<!-- Body -->
<table width="1200" height="700" align="center" class="fond">
  <tr>
  <td width="100" height="700" align="left" valign="top"><p class="menu"><a href="index.htm">Presentation</a></p>
      <p class="menu"><a href="mythology.htm">Kiranti mythology</a></p>
      <p class="menu"><a href="selection.htm">Corpus access</a></p></td>
    <td width="1200" height="700" align="left" valign="top" bgcolor="#FFFFFF">
	
	
	
	<?php
		error_reporting(0);
		
	  $similarity=  isset($_GET["similarity"])    ? $_GET["similarity"]    : "*";
	  $file1=  isset($_GET["file1"])    ? $_GET["file1"]    : "*";
	  $file2=  isset($_GET["file2"])    ? $_GET["file2"]    : "*";
	  $file3=  isset($_GET["file3"])    ? $_GET["file3"]    : "*";
	  $file4=  isset($_GET["file4"])    ? $_GET["file4"]    : "*";
	  $file5=  isset($_GET["file5"])    ? $_GET["file5"]    : "*";
	  $file6=  isset($_GET["file6"])    ? $_GET["file6"]    : "*";
	  $nbsim=  isset($_GET["nbsim"])    ? $_GET["nbsim"]    : "*";
	 
	  
	  $trans=  "ShowAllSimilarities.xsl";
	 



/*echo "sim $similarity\n";
echo "f1 $file1\n";
echo "f2 $file2\n";
echo "f3 $file3\n";
echo "f4 $file4\n";
echo "f5 $file5\n";
echo "f6 $file6\n";
echo "nbsim $nbsim\n";*/




					
		ViewSimilarities($similarity, $trans, $nbsim, $file1, $file2, $file3, $file4, $file5, $file6);
					
	





function ViewSimilarities($similarity, $trans, $nbsim, $file1, $file2, $file3, $file4, $file5, $file6) {
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
		
			  $xsl->load($trans);
			  
			  $xp->setParameter('', 'filesim', $similarity);
			  $xp->setParameter('', 'nbsim', $nbsim);
			  $xp->setParameter('', 'file1', $file1);
			  $xp->setParameter('', 'file2', $file2);
			  $xp->setParameter('', 'file3', $file3);
			  $xp->setParameter('', 'file4', $file4);
			  $xp->setParameter('', 'file5', $file5);
			  $xp->setParameter('', 'file6', $file6);

			 
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML datat
			  $xml_doc = new DomDocument;
			  $xml_doc->load($similarity);


			  // transform the XML into HTML using the XSL file
			  if ($html = $xp->transformToXML($xml_doc)) {
				  echo $html;
			  } else {
				  trigger_error('XSL transformation failed.', E_USER_ERROR);
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
