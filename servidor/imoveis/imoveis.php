<?php
$userid= $_POST['id'];
$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");}
$sql="SELECT * from imoveis where idUser ='$userid'";
$resunt= $mysqli->query($sql);
$imoveis=[];
while($row= $resunt-> fetch_assoc()){
    $imoveis[]= $row;
}
header('Content-Type: application/json');
echo json_encode($imoveis);


?>
