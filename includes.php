<?php

function printpoints() {

	$climbed_routes = mysql_query ("SELECT * from climbed WHERE user_id='1'");
	
	while ($get_info = mysql_fetch_row($climbed_routes)){
		$i=0;
		unset($get_info["0"]);
	//	var_dump($get_info);
		foreach ($get_info as $field) {
//			if ($i == "0") {
//				echo "User ID:" . $i . "\n";
//				next;
//			}
			if ($field == "1") {
				echo "Climbed: " . $i . "\n";
			}
			$i++;
		}
	}

	$result = mysql_query ("SELECT id,name,region,gridref FROM crags");
	$count = "1";
	while($row = mysql_fetch_array($result)) {
		echo "var numref".$count." = gridrefLetToNum( '".$row['gridref']."' );\n";
	echo "var position".$count." = new OpenSpace.MapPoint(numref".$count."[ 0 ], numref".$count."[ 1 ]);\n";
	echo "var size".$count." = new OpenLayers.Size(28, 28);\n";
	echo "var offset".$count." = new OpenLayers.Pixel(-16, -37);\n";
	echo "var infoWindowAnchor".$count." = new OpenLayers.Pixel(16, 16);\n";
	echo "var icon".$count." = new OpenSpace.Icon('icon-red.png', size".$count.", offset".$count.", null, infoWindowAnchor".$count.");\n";

	$getclimbs = mysql_query("SELECT name, new_grade,ukcid from routes WHERE crag=".$row['id']);

	echo "var content".$count." = \""."<b>Crag:</b> ".$row['name']."<br><b>Location:</b> ".$row['region']."<br><b>Grid Ref:</b> ".$row['gridref']."<br>";

		while($climbs = mysql_fetch_array($getclimbs)) {
			echo "<a href='http://www.ukclimbing.com/logbook/c.php?i=" . $climbs['ukcid'] . "'>" .  $climbs['name'] . "</a>"." - ".$climbs['new_grade']."<br>";
		}

	echo "\";\n";
	echo "var infoWindowSize".$count." = new OpenLayers.Size(200, 200);\n";
	echo "var marker = osMap.createMarker(position".$count.", icon".$count.", content".$count.", infoWindowSize".$count.");\n";		
	$count = $count + 1;
	}
}

?>
