<?php

echo "<script> window.location.href='/alerta.php'; </script>";
/*
require "main.php";

$nombre = "PedroCD";

$contraseña = "P1542";

$bd_verificacion = conexion_bd();

$bd_verificacion = $bd_verificacion->query("SELECT * FROM usuario WHERE NombreUsu='$nombre'");

$cont = password_hash($contraseña,PASSWORD_BCRYPT,["cost"=>10]);

if ($bd_verificacion->rowCount() == 1) {
    $bd_verificacion = $bd_verificacion->fetch();
    if ($bd_verificacion['NombreUsu'] == $nombre) {
        echo "datos validos1 ";
        if (password_verify($bd_verificacion['Contraseña'],$cont)) {
            echo "datos validos2 ";
        } else {
            echo "datos no 3 validos";
        }
    } else {
        echo "datos no 2 validos";
    }
} else {
    echo "datos no 1 validos";
}

*/