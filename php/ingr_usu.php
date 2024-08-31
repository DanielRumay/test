<?php

require "main.php";

$pdo=conexion_bd();

$pdo_2=conexion_bd();

$i=1;

$pdo=$pdo->query("INSERT INTO usuario(ID_usuario,NombreUsu,Nombre,Apellido,Contraseña,Puesto,ContraseñaTemp) 
    VALUES(000000004,'Heliana','Heliana','Yglesias','H231027','Coordinador','H231027')");

echo "datos ingresado".$i;
