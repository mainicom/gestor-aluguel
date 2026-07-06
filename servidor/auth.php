<?php
$email = $_POST['email'];
$senha = $_POST['senha'];
$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");}
$sql ="SELECT * FROM users WHERE email = '$email';";
$resunt = $mysqli->query($sql);
$existe = false;
while($row = $resunt -> fetch_assoc()){
    if(password_verify($senha, $row['senha'] )){
          $existe = true;
          $id =  $row['id'];
    }
}

 header('Content-Type: application/json ');
 echo json_encode ([
    "existe" => $existe,
    "id" => $id
 ]);
?>
