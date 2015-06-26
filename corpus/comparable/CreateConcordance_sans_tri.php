<?php
		
		set_time_limit(0); 
		
	  $concordance=  isset($_GET["concordance"])    ? $_GET["concordance"]    : "*";
	  $tri=  isset($_GET["tri"])    ? $_GET["tri"]    : "*";
	 
				
		CreateConcordance($concordance, $tri);
					
			
	

function CreateConcordance($concordance, $tri) {
	
			  $xp = new XsltProcessor();
			  $xsl = new DomDocument;
			  //$xsl->load('http://lacito.vjf.cnrs.fr/archivage/tools/listRsc.xsl');
			  
			  $xsl->load('concordance_sans_tri.xsl');
			  
			   $xp->setParameter('', 'tri_demande', "texte");
			  
			 
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
	