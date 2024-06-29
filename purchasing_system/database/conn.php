<?php 
// Koneksi database
$hostname = 'localhost';
$dbname = 'db_purchasing_system';
$username = 'root';
$password= '';

$koneksi = mysqli_connect($hostname,$username,$password,$dbname);

// periksa koneksi 
if (!$koneksi) {
    die('koneksi database gagal : ' .mysqli_connect_error());
};

// echo "database suskes ";
?>