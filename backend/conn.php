<?php

$db_name="id18848798_jzclean";
$db_user="id18848798_samarth";
$db_pass='dsW8PxAzYK83w#4';
$db_host="localhost";

$con = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

if(!$con) {
// echo json_encode("connection error");
}
else{
// echo json_encode("connection successfull");
}
?>



 if (!$rep) {
    printf("Error: %s\n", mysqli_error($con));
    exit();