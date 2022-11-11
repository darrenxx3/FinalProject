<?php
include("conn.php");

$result=mysqli_query($connection, "SELECT * FROM Users");
$response = array();

if(mysqli_num_rows($result)>0){
    $response["data"] = array();
    while($r=mysqli_fetch_array($result)){
        $user = array();
        $user["user_id"] = $r["user_id"];
        $user["username"] = $r["username"];
        $user["email"] = $r["email"];
        $user["role_id"] = $r["role_id"];
        array_push($response["data"], $user);
    }
    $response["success"] = 1;
    $response["message"] = "OK";
    http_response_code(200);
    echo json_encode($response);
}
else{
    $response["success"] = 0;
    $response["message"] = "No data available";
    echo json_encode($response);
}



?>
