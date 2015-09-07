<?php
		
	  $color=  isset($_GET["color"])    ? $_GET["color"]    : "*";
	  $filesim=  isset($_GET["filesim"])    ? $_GET["filesim"]    : "*";
	 
$lg=  isset($_GET["lg"])    ? $_GET["lg"]    : "*";


	  $file=  isset($_GET["file"])    ? $_GET["file"]    : "*";
	  $sentence=  isset($_GET["sentence"])    ? $_GET["sentence"]    : "*";
	  
	
	$file1=  isset($_GET["file1"])    ? $_GET["file1"]    : "*";
	$file2=  isset($_GET["file2"])    ? $_GET["file2"]    : "*";
	$file3=  isset($_GET["file3"])    ? $_GET["file3"]    : "*";
	$file4=  isset($_GET["file4"])    ? $_GET["file4"]    : "*";
	$file5=  isset($_GET["file5"])    ? $_GET["file5"]    : "*";
	$file6=  isset($_GET["file6"])    ? $_GET["file6"]    : "*";
	
	
	

		/*echo "Similarité : $similarity\n";
		echo "Couleur : $color\n";*/
		
	if(isset($_POST['mot'])){
		$mot=htmlspecialchars($_POST['mot']);
		/*echo "CreateConcordanceOneWord";*/
		CreateConcordanceOneWord($mot);
	 }
	 else{
	 $mot=  isset($_GET["mot"])    ? $_GET["mot"]    : "*";
	 }

			if ($color=="")	{
		/*echo "ViewOneSentence";*/
		ViewOneSentence($filesim, $file, $sentence, $mot);
		
		
		}
		else {
			if ($mot==""){
			/*echo "ViewOneSimilarity";*/
		ViewOneSimilarity($filesim, $color, $mot, $file1, $file2, $file3, $file4, $file5, $file6, $filesim);
		}
		else {
	/*echo "ViewOneSimilarityOneWord";*/
		ViewOneSimilarityOneWord($filesim, $color, $mot, $file1, $file2, $file3, $file4, $file5, $file6, $filesim);
		}
		}
		
			
			
	
		function viewOneSentence($filesim, $file, $sentence, $mot) {
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  $xsl->load('ShowOneSentence.xsl');
			  
			  $xp->setParameter('', 'file', $file);
			  $xp->setParameter('', 'filesim', $filesim);
			   $xp->setParameter('', 'sentence', $sentence);
			   $xp->setParameter('', 'mot', $mot);
			 
			
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML datat
			  $xml_doc = new DomDocument;
			  //$xml_doc->load('http://lacito.vjf.cnrs.fr/archivage/tools/metadata_lacito.xml');
			  $xml_doc->load($filesim);


			  // transform the XML into HTML using the XSL file
			  if ($html = $xp->transformToXML($xml_doc)) {
				  echo $html;
			  } else {
				  trigger_error('XSL transformation failed.', E_USER_ERROR);
			  }
	}	
				

function ViewOneSimilarityOneWord($filesim, $color, $mot, $file1, $file2, $file3, $file4, $file5, $file6, $filesim) {
	
	/*echo "sim $similarity";
$file1="tata";
	echo "2 $color";*/
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  $xsl->load('ShowOneSimilarityWord.xsl');
			  
			  $xp->setParameter('', 'file1', $file1);
			  $xp->setParameter('', 'file2', $file2);
			  $xp->setParameter('', 'file3', $file3);
			  $xp->setParameter('', 'file4', $file4);
			  $xp->setParameter('', 'file5', $file5);
			  $xp->setParameter('', 'file6', $file6);
			  
			  $xp->setParameter('', 'filesim', $filesim);
			  
			   $xp->setParameter('', 'color', $color);
			   $xp->setParameter('', 'mot', $mot);
			 
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML datat
			  $xml_doc = new DomDocument;
			  //$xml_doc->load('http://lacito.vjf.cnrs.fr/archivage/tools/metadata_lacito.xml');
			  $xml_doc->load('orphans.xml');


			  // transform the XML into HTML using the XSL file
			  if ($html = $xp->transformToXML($xml_doc)) {
				  echo $html;
			  } else {
				  trigger_error('XSL transformation failed.', E_USER_ERROR);
			  }
	}	


function ViewOneSimilarity($filesim, $color, $mot, $file1, $file2, $file3, $file4, $file5, $file6, $filesim) {
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  $xsl->load('ShowOneSimilarity.xsl');
			  
			  $xp->setParameter('', 'filesim', $filesim);
			   $xp->setParameter('', 'color', $color);
			   
			    $xp->setParameter('', 'file1', $file1);
			  $xp->setParameter('', 'file2', $file2);
			  $xp->setParameter('', 'file3', $file3);
			  $xp->setParameter('', 'file4', $file4);
			  $xp->setParameter('', 'file5', $file5);
			  $xp->setParameter('', 'file6', $file6);
			  
			  $xp->setParameter('', 'filesim', $filesim);
			 
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML datat
			  $xml_doc = new DomDocument;
			  //$xml_doc->load('http://lacito.vjf.cnrs.fr/archivage/tools/metadata_lacito.xml');
			  $xml_doc->load($filesim);


			  // transform the XML into HTML using the XSL file
			  if ($html = $xp->transformToXML($xml_doc)) {
				  echo $html;
			  } else {
				  trigger_error('XSL transformation failed.', E_USER_ERROR);
			  }
	}	


	?>
