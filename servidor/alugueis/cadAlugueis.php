<?php
$idUser = $_POST['userId'];
$valor = $_POST['valor'];
$dataInicial = $_POST['dataInicial'];

$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");}
    $sql ="INSERT INTO alugueis (valor, dataInicio, idUser) VALUES ('$valor', '$dataInicial', '$idUser');";
    $resunt = $mysqli->query($sql);
    if($resunt){echo("okay");}else{echo($dataInicial); echo("valor".$valor."user id".$idUser);}
    ?>
