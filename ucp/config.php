<?php
$db_host = getenv('DB_HOST') ?: '127.0.0.1';
$db_user = getenv('DB_USER') ?: 'palembangrp';
$db_pass = getenv('DB_PASS') ?: 'change_me';
$db_name = getenv('DB_NAME') ?: 'bersamaroleplay';
$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);
if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error); }
?>
