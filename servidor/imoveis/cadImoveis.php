<?php
$bairro = $_POST['bairro'];
$cidade = $_POST['cidade'];
$cep = $_POST['cep'];
$idUser = $_POST['userId'];
$descricao = $_POST['descricao'];
$endereco = $_POST['endereco'];

$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");}
    $sql ="INSERT INTO imoveis (descricao, endereco, idUser, cep, bairro, cidade) VALUES ('$descricao', '$endereco', '$idUser', '$cep', '$bairro', '$cidade');";
    $resunt = $mysqli->query($sql);
?>
