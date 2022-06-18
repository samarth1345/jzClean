<?php
require_once('db.php');

$rollNo = $_POST["rollNo"];
$query = "select roomNo from `student` where rollNo = '$rollNo';";
$res= mysqli_query($con, $query);

if($res){
    echo 'succes';
    $data = mysqli_fetch_array($res);
    $query1 = "select * from `resolved_comp`;";
    $res1 = mysqli_query($con,$query1);
    $data1 = mysqli_fetch_array($res1);
    echo json_encode($data1);
    echo '<br>';
    while ($row = mysqli_fetch_array($res1)) {
        echo json_encode($row);
    }
}else{
    echo 'failes';
}
?>

