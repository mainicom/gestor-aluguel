<?php
$idUser = $_POST['userId'];
$nome = $_POST['nome'];
$sobrenome = $_POST['sobrenome'];

$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");}
    $sql ="INSERT INTO Pessoas (nome, sobrenome, idUser) VALUES ('$nome', '$sobrenome', '$idUser');";
    $resunt = $mysqli->query($sql);
    ?>
