<?php
require_once('db.php');
$compID = $_POST["compID"];
$feedback = $_POST["feedback"];
$query = "select * from  `id18848798_jzclean`.`comp_table` where comlaintID = '$compID'";                                                                   
$res= mysqli_query($con, $query);
if($res){
    $data = mysqli_fetch_array($res);
    if(json_encode($data) == 'null'){
        echo json_encode('complaint id not found') ;
        exit();
    }
    $query1 = "INSERT INTO `resolved_comp` (`domain`, `room_no`, `time`, `description`, `comlaintID`, `feedback`) VALUES ('$data[0]', '$data[1]', '$data[2]', '$data[3]', '$data[4]', '$feedback');";
    $res1 = mysqli_query($con,$query1);
    $query2 = "delete from  `comp_table`  where comlaintID = '$compId';";
    $res2 = mysqli_query($con,$query2);
    echo json_encode("fuck");
}else{
    echo 'failes';
}
?>