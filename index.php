<?php

include('includes.php');

// Database connection variables
$dbhost = "localhost";
$dbuser = "classic_rock_log";
$dbpass = "Horiv2";
$db = "classic_rock_log";

// Handle MySQL errors nicely
function showmysqlerror( ) {
die('
<html>
<head>
<link type="text/css" rel="stylesheet" href="style/map.css">
</head>
<body>
<div class="error"><b>MySQL Error:</b> '.mysql_errno( ).' '.mysql_error( ).'</div>
</body>
</html>
');
}

// Connect to the database, or fail
if (!($connection = @ mysql_connect($dbhost,$dbuser,$dbpass)))
showmysqlerror( );
 
// Select the database, or fail
if (!(mysql_select_db($db, $connection)))
showmysqlerror( );

?>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Classic Rock Routes</title>

<script type="text/javascript" src="http://openspace.ordnancesurvey.co.uk/osmapapi/openspace.js?key=77F6109703989267E0405F0AF060229B"></script>

<script type="text/javascript" src="functions.js"></script>

<script type="text/javascript">

	var osMap;
 
	window.onload = function()
	{
		// Center map on NN478605 - the centre of Scotland (or there abouts)
		var numref = gridrefLetToNum( '<?php if ($_GET['gr'] == "") { echo "NN478605"; } else { echo $_GET['gr'];} ?>' );
		osMap = new OpenSpace.Map('map');
		osMap.setCenter( new OpenSpace.MapPoint( numref[ 0 ], numref[ 1 ] ), <?php if ($_GET['zoom'] == "") { echo "3"; } else { echo $_GET['zoom'];} ?>);

<?php
//printBothies();
printpoints();
?>
//		document.getElementById( "linkto" ).onclick = function()
//		{
//			var link_coords = osMap.getCenter();
//			var link_GR = gridrefNumToLet( link_coords.getEasting(), link_coords.getNorthing(), 6)
//			var link_URL = "http://theboyhope.com/maps/osmap/?gr=" + link_GR + "&zoomlevel=" + osMap.zoom;
//			self.location = link_URL;
//			alert( "Copy the URL from the address bar." );
//		}
	}

</script>

<style type="text/css">

body { margin:0;padding:0; }
div#grform { position:fixed;top:30px;left:90px;z-index:1000; }

</style>

    <style media="print">
    div#grform {
        display: none;
    }
	
    .print_output {
        display: inline;
    }
    </style>

</head>

<body>

<div id="grform" action="index.php" method="get">
<form>
<input type="text" name="gr" id="gr"><input type="submit" value="Submit Grid Ref">
</form>
<!--<button id="linkto">Link to This Page</button>-->
</div>
<div id="map" style="width:100%; height:100%; border: 1px solid black;"></div>

</body>

</html>
