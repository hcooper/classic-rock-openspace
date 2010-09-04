<?php
session_start(); 
$newip = $_SERVER['REMOTE_ADDR']; 

if (!isset($_SESSION['user']) || empty($_SESSION['user']) || $newip != $_SESSION['ip']) { 
	echo "please login";
	include "form.php";
} else {
	echo $_SESSION['user'];
	echo $_SESSION['ip'];
	include "membersection.php";
}
?>
