<?php
require_once('db.php');
$rollNO = $_POST["rollNO"];
$name = $_POST["name"];
$roomNo = $_POST["roomNo"];
$dues = $_POST["dues"];
$roomType = $_POST["roomType"];
$dob = $_POST["dob"];
$profileLink = $_POST["profileLink"];

$query = "INSERT INTO `student` (`rollNo`, `name`, `roomNo`, `dues`, `roomType`, `dob`, `profileLink`) VALUES 
('$rollNO','$name','$roomNo','$dues','$roomType','$dob','$profileLink')";
$res= mysqli_query($con, $query);
if($res){
    echo 'succes';
}else{
    echo 'failes';
}
?>
