<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Search</title>
<link href="../styles.css" rel="stylesheet" type="text/css" />
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
    <td width="1200" height="40" align="center" colspan="2"><img src="../images/HimalCo/baniere.jpg" width="1200" height="40"/></td>
  </tr>
  <tr>
    <td align="left"><img src="../images/logos/cnrs.jpg" width="60" height="60"/></td>
    <td align="right"><img src="../images/logos/ANR.gif" width="80" height="60"/></td>
  </tr>
</table>
<!-- Menu -->
<table width="1200" height="30" align="center">
  <tr>
    <td width="200" height="30" align="center" background="../images/HimalCo/bouton.png" class="menu"><a href="../index.htm">Presentation</a></td>
    <td width="200" height="30" align="center" background="../images/HimalCo/bouton.png" class="menu"><a href="../corpus/comparable/index.htm">Comparable corpus</a></td>
    <td width="200" height="30" align="center" background="../images/HimalCo/bouton.png" class="menu"><a href="index.htm">Dictionaries</a></td>
    <td width="200" height="30" align="center" background="../images/HimalCo/bouton.png" class="menu"><a href="../links.htm">Read more</a></td>
    <td width="200" height="30" align="center" background="../images/HimalCo/bouton.png" class="menu"><a href="../documentation/index.htm">Technical documentation</a></td>
    <td width="200" height="30" align="center" background="../images/HimalCo/bouton.png" class="menu"><a href="../contact.htm">Contact information</a></td>
  </tr>
</table>
<!-- Body -->
<table width="1200" height="700" align="center" class="fond">
  <tr> 
    <!-- Left menu -->
    <td width="100" height="700" align="left" valign="top"><p class="menu"><a href="index.htm">Presentation</a></p>
      <p class="menu"><a href="SelectDictionary.php?dict=japhug">Japhug</a></p>
      <p class="menu"><a href="SelectDictionary.php?dict=khaling">Khaling</a></p>
      <p class="menu"><a href="SelectDictionary.php?dict=na">Na</a></p>
      <p class="menu"><a href="search.php">Search</a></p></td>
    <!-- Contents -->
    <td width="1100" height="700" align="left" valign="top" bgcolor="#FFFFFF">Search term:<br/>
      <form id="form" name="form" action=""  method="post">
        <input name="mot" type="text" title="mot"  />
        <input name="text0" type="hidden" value="text0" />
        <input name="text1" type="hidden" value="text1" />
        <input name="text2" type="hidden" value="text2" />
        <input type="submit" value="OK" />
      </form></td>
  </tr>
</table>
</tr>
</table>
<!-- Footer -->
<table width="1200" height="30" align="center">
  <tr>
    <td width="1200" height="30" align="center"><b>Corpus and dictionaries compiled thanks to funding by the ANR.</b></td>
  </tr>
  <tr>
    <td width="1200" align="center"><img src="../images/logos/ANR.gif"></td>
  </tr>
</table>
</body>
</html>
