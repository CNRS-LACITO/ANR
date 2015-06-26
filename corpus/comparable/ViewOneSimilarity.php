<?php
		
	  $color=  isset($_GET["color"])    ? $_GET["color"]    : "*";
	  $similarity=  isset($_GET["similarity"])    ? $_GET["similarity"]    : "*";
	 



	  $file=  isset($_GET["file"])    ? $_GET["file"]    : "*";
	  $sentence=  isset($_GET["sentence"])    ? $_GET["sentence"]    : "*";
	  
	

	/*
	  
	  $f1_xml=  isset($_GET["f1xml"])    ? $_GET["f1xml"]    : "*";
	  $f2_xml=  isset($_GET["f2xml"])    ? $_GET["f2xml"]    : "*";
	  $f3_xml=  isset($_GET["f3xml"])    ? $_GET["f3xml"]    : "*";
	  
	  
	  $f1_lang=  isset($_GET["f1_lang"])    ? $_GET["f1_lang"]    : "*";
	  $f2_lang=  isset($_GET["f2_lang"])    ? $_GET["f2_lang"]    : "*";
	  $f3_lang=  isset($_GET["f3_lang"])    ? $_GET["f3_lang"]    : "*";
	  
	  
	  $f1_sound=  isset($_GET["f1_sound"])    ? $_GET["f1_sound"]    : "*";
	  $f2_sound=  isset($_GET["f2_sound"])    ? $_GET["f2_sound"]    : "*";
	  $f3_sound=  isset($_GET["f3_sound"])    ? $_GET["f3_sound"]    : "*";
		
	*/	
	
		/*echo "Similarité : $similarity\n";
		echo "Couleur : $color\n";*/
		
	if(isset($_POST['mot'])){
		$mot=htmlspecialchars($_POST['mot']);
		CreateConcordanceOneWord($mot);
	 }
	 else{
	 $mot=  isset($_GET["mot"])    ? $_GET["mot"]    : "*";
	 }

			if ($similarity=="")	{

		ViewOneSentence($file, $sentence, $mot);
		
		
		}
		else {
			if ($mot==""){
			
		ViewOneSimilarity($similarity, $color);
		}
		else {
	
		ViewOneSimilarityOneWord($similarity, $color, $mot);
		}
		}
		
			
			
	
		function viewOneSentence( $file, $sentence, $mot) {
	

			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  $xsl->load('ShowOneSentence.xsl');
			  
			  $xp->setParameter('', 'file', $file);
			   $xp->setParameter('', 'sentence', $sentence);
			   $xp->setParameter('', 'mot', $mot);
			 
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML datat
			  $xml_doc = new DomDocument;
			  //$xml_doc->load('http://lacito.vjf.cnrs.fr/archivage/tools/metadata_lacito.xml');
			  $xml_doc->load('SIMILARITIES.xml');


			  // transform the XML into HTML using the XSL file
			  if ($html = $xp->transformToXML($xml_doc)) {
				  echo $html;
			  } else {
				  trigger_error('XSL transformation failed.', E_USER_ERROR);
			  }
	}	
				

function ViewOneSimilarityOneWord($similarity, $color, $mot) {
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  $xsl->load('ShowOneSimilarityWord.xsl');
			  
			  $xp->setParameter('', 'similarity', $similarity);
			   $xp->setParameter('', 'color', $color);
			   $xp->setParameter('', 'mot', $mot);
			 
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML datat
			  $xml_doc = new DomDocument;
			  //$xml_doc->load('http://lacito.vjf.cnrs.fr/archivage/tools/metadata_lacito.xml');
			  $xml_doc->load('SIMILARITIES.xml');


			  // transform the XML into HTML using the XSL file
			  if ($html = $xp->transformToXML($xml_doc)) {
				  echo $html;
			  } else {
				  trigger_error('XSL transformation failed.', E_USER_ERROR);
			  }
	}	


function ViewOneSimilarity($similarity, $color) {
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  $xsl->load('ShowOneSimilarity.xsl');
			  
			  $xp->setParameter('', 'similarity', $similarity);
			   $xp->setParameter('', 'color', $color);
			 
			  // import the XSL styelsheet into the XSLT process
			  $xp->importStylesheet($xsl);


			// create a DOM document and load the XML datat
			  $xml_doc = new DomDocument;
			  //$xml_doc->load('http://lacito.vjf.cnrs.fr/archivage/tools/metadata_lacito.xml');
			  $xml_doc->load('SIMILARITIES.xml');


			  // transform the XML into HTML using the XSL file
			  if ($html = $xp->transformToXML($xml_doc)) {
				  echo $html;
			  } else {
				  trigger_error('XSL transformation failed.', E_USER_ERROR);
			  }
	}	


	?>
