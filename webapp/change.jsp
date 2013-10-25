<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Highslide JS</title>
<script src="JavaScript/JScript.js" type="text/javascript"></script>
<script type="text/javascript" src="JavaScript/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/highslide.css" />

<script type="text/javascript">

hs.graphicsDir = 'graphics/';
hs.outlineType = 'rounded-white';
hs.wrapperClassName = 'draggable-header';

</script>

</head>

<body>

<div>
AJAX requesting the body of a HTML page,
<a href="index.htm"
		onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )">
	click here.
</a>
<br/>

AJAX requesting a specific id in an external HTML page,
<a href="includes/ajax.htm#intro" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )">
	intro</a>,
<a href="includes/ajax.htm#div3" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )">
	div3</a>.


</div>
</body>
</html>