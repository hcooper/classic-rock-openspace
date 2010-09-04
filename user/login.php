<?php
session_start(); 
$user = $_POST['user']; 
$passwd = md5($_POST['passwd']); 

// Database connection variables
$dbhost = "localhost";
$dbuser = "classic_rock_log";
$dbpass = "Horiv2";
$db = "classic_rock_log";

// Handle MySQL errors nicely
function showmysqlerror( ) {
die('
<html>
<sshead>
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


$sql = "select id,user,passwd from users where user='$user' and passwd='$passwd'"; 
$result = mysql_query($sql); 
if (mysql_num_rows($result)!= 1) { 
 $error = "Login failed"; 
include "form.php"; 
print $error;
} else { 
 $_SESSION['user'] = "$user"; 
 $_SESSION['ip'] = $_SERVER['REMOTE_ADDR']; 
 // any other data needed to navigate the site or 
 // to authenticate the user can be added here 
 include "membersection.php"; 
}
?>
