<?php
		
	  $similarity=  isset($_GET["similarity"])    ? $_GET["similarity"]    : "*";
	  $trans=  "ShowAllSimilarities.xsl";
	  
	


					
		ViewSimilarities($similarity, $trans);
					
	





function ViewSimilarities($similarity, $trans) {
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
		
			  $xsl->load($trans);
			  
			  $xp->setParameter('', 'similarity', $similarity);
			 
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


	?>
	