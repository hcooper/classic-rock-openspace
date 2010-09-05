<?php

function printpoints() {

	// Retrieve the list of climbers the user has completed in the $get_info array
	$climbed_routes = mysql_query ("SELECT * from climbed WHERE user_id='1'");
	$get_info = mysql_fetch_row($climbed_routes);
	

	$result = mysql_query ("SELECT id,name,region,gridref FROM crags");
	$count = "1";
	while($row = mysql_fetch_array($result)) {
		echo "var numref".$count." = gridrefLetToNum( '".$row['gridref']."' );\n";
	echo "var position".$count." = new OpenSpace.MapPoint(numref".$count."[ 0 ], numref".$count."[ 1 ]);\n";
	echo "var size".$count." = new OpenLayers.Size(28, 28);\n";
	echo "var offset".$count." = new OpenLayers.Pixel(-16, -37);\n";
	echo "var infoWindowAnchor".$count." = new OpenLayers.Pixel(16, 16);\n";
//	echo "var icon".$count." = new OpenSpace.Icon('icon-red.png', size".$count.", offset".$count.", null, infoWindowAnchor".$count.");\n";

	$getclimbs = mysql_query("SELECT id,name,new_grade,ukcid from routes WHERE crag=".$row['id']);

	echo "var content".$count." = \""."<b>Crag:</b> ".$row['name']."<br><b>Location:</b> ".$row['region']."<br><b>Grid Ref:</b> ".$row['gridref']."<br>";

		while($climbs = mysql_fetch_array($getclimbs)) {
			$climb_id = $climbs['id'];
			echo $climb_id . "<a href='http://www.ukclimbing.com/logbook/c.php?i=" . $climbs['ukcid'] . "'>" .  $climbs['name'] . "</a>"." - ".$climbs['new_grade']."<br>";
			if ($get_info[$climb_id] == "1") {
				echo "Climbed";
				$temp_array[] = "1";
			} else {
				$temp_array[] = "0";
			}
		}
	echo "\";\n";
//	var_dump($temp_array);
		if (in_array("1", $temp_array) && in_array("0", $temp_array)) {
		        echo "var icon".$count." = new OpenSpace.Icon('icon-yellow.png', size".$count.", offset".$count.", null, infoWindowAnchor".$count.");\n";
		} elseif (!in_array("0", $temp_array)) {
			echo "var icon".$count." = new OpenSpace.Icon('icon-green.png', size".$count.", offset".$count.", null, infoWindowAnchor".$count.");\n";
		} else {
		        echo "var icon".$count." = new OpenSpace.Icon('icon-red.png', size".$count.", offset".$count.", null, infoWindowAnchor".$count.");\n";
		}
	$temp_array=array();
	echo "var infoWindowSize".$count." = new OpenLayers.Size(200, 200);\n";
	echo "var marker = osMap.createMarker(position".$count.", icon".$count.", content".$count.", infoWindowSize".$count.");\n\n\n";		
	$count = $count + 1;
	}
}

?>
