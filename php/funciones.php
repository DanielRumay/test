<?php

$nombre = limpiar_cadena($_POST['usuario']);
$contraseña = limpiar_cadena($_POST['contraseña']);

if ($nombre == "" || $contraseña == "") {
    echo "<script> window.location.href='/alerta.php'; </script>";
}

if (verificacion_datos("[a-zA-Z]{0,50}", $nombre)) {


    echo "<script> window.location.href='/alerta.php'; </script>";
}

if (verificacion_datos("[a-zA-Z0-9]{0,20}", $contraseña)) {


    echo "<script> window.location.href='/alerta.php'; </script>";
}

$bd_verificacion = conexion_bd();

$bd_verificacion = $bd_verificacion->query("SELECT * FROM usuario WHERE NombreUsu='$nombre' AND Contraseña='$contraseña'");

$cont = password_hash($contraseña, PASSWORD_BCRYPT, ["cost" => 10]);

if ($bd_verificacion->rowCount() == 1) {
    $bd_verificacion = $bd_verificacion->fetch();
    if ($bd_verificacion['NombreUsu'] == $nombre && password_verify($bd_verificacion['Contraseña'], $cont)) {
        $_SESSION['id'] = $bd_verificacion['ID_usuario'];
        $_SESSION['nombre'] = $bd_verificacion['Nombre'];
        $_SESSION['apellido'] = $bd_verificacion['Apellido'];
        $_SESSION['usuario'] = $bd_verificacion['NombreUsu'];
        $_SESSION['puesto'] = $bd_verificacion['Puesto'];
        if (headers_sent()) {
            echo "<script> window.location.href='index.php?=home'; </script>";
        } else {
            header("Location: index.php?vista=home");
        }
    } else {

        echo "<script> window.location.href='/alerta.php'; </script>";
    }
} else {

    echo "<script> window.location.href='/alerta.php'; </script>";
}
