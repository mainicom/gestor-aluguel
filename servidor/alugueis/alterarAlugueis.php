<?php
$aluguelId = $_POST['aluguelId'];
$idUser = $_POST['userId'];
$valor = $_POST['valor'];
$datainicial = $_POST['dataInicial'];
$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");}
    $sql ="UPDATE alugueis  SET valor = '$valor',
dataInicio = '$datainicial',
idUser = '$idUser'
where id = '$aluguelId' ;";
    $resunt = $mysqli->query($sql);
    if(!$resunt){echo($datainicial );}
    ?>
