<?php
require_once('db.php');

$rollNo = $_POST["rollNo"];
$query = "select * from `student` where rollNo = '$rollNo';";
$res= mysqli_query($con, $query);

if($res){
    echo 'succes';
    $data = mysqli_fetch_array($res);
    echo json_encode($data);
}else{
    echo 'failes';
}
?>

