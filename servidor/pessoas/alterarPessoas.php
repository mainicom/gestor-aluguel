<?php
$pessoaId = $_POST['pessoaId'];
$idUser = $_POST['userId'];
$nome = $_POST['nome'];
$sobrenome = $_POST['sobrenome'];
$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");}
    $sql ="UPDATE Pessoas  SET nome = $nome,
    sobrenome = $sobrenome,
    idUser = $idUser,
    where id = '$pessoaId' ;";
    $resunt = $mysqli->query($sql);
    ?>
