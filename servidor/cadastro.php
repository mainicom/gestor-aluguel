<?php
$email = $_POST['email'];
$senha = $_POST['senha'];
$mysqli = new mysqli("localhost","root", "", "henrique");
if($mysqli->connect_error){
    die("erro de conexão");
}
// me sinto profisional usando hash hehe
$senha =  password_hash($senha, PASSWORD_DEFAULT);
$sql = ("INSERT INTO users (email, senha) VALUES ('$email','$senha')");
$mysqli->query($sql);
?>
