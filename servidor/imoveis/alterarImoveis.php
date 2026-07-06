<?php
$bairro = $_POST['bairro'];
$cidade = $_POST['cidade'];
$cep = $_POST['cep'];
$imovelId = $_POST['imovelId'];
$idUser = $_POST['userId'];
$descricao = $_POST['descricao'];
$endereco = $_POST['endereco'];
$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");}
    $sql ="UPDATE imoveis  SET descricao = '$descricao',
    endereco = '$endereco',
    idUser = '$idUser',
    bairro= '$bairro',
    cidade = '$cidade',
    cep = '$cep'
    where id = '$imovelId' ;";
    $resunt = $mysqli->query($sql);
    ?>
