<?php
include("db.php");
include("tables.php");
include_once("functions.php");
include("constants.php");

if(isset($_SESSION['lang']) and $_SESSION['lang']=="th"){
	include("lang_thai.php");
} else {
	include("lang_english.php");
}
?>