<?php

// Name of the file
$filename = 'q2a.sql';
// MySQL host
$mysql_host = '127.0.0.1';
// MySQL username
$user= 'q2a';
// MySQL password
$password = 'q2a_secret';
// Database name
$mysql_database = 'q2a';
$dsn = 'mysql:host='.$mysql_host.';dbname='.$mysql_database;
$db = new PDO($dsn, $user, $password);

$sql = file_get_contents($filename);

$qr = $db->exec($sql);
