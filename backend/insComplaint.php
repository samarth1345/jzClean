<?php
require_once('db.php');
$domain = $_POST["domain"];
$roomInfo = $_POST["roomInfo"];
$time = $_POST["time"];
$desc = $_POST["desc"];

$query = "INSERT INTO `id18848798_jzclean`.`comp_table` (`domain`, `room_no`, `time`, `description`) VALUES ('$domain', '$roomInfo','$time' , '$desc' );";
$res= mysqli_query($con, $query);
if($res){
    echo 'succes';
    $query = "SELECT complaintID from `id18848798_jzclean`.`comp_table` ORDER BY complaintID DESC limit 1;";
    $res= mysqli_query($con, $query);
    $data = mysqli_fetch_array($res);
    echo $data[0];
}else{
    echo 'failes';
}
?>