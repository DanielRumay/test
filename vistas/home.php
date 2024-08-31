<?php
require_once "./php/main.php";

$nom = limpiar_cadena($_SESSION['nombre']);
$ape = limpiar_cadena($_SESSION['apellido']);

$bd = conexion_bd();

$bd = $bd -> query("SELECT * FROM usuario WHERE NombreUsu='$nom'");

$cargo = limpiar_cadena($_SESSION['puesto']);

?>
<div class="row">
    <div class="fondo">
        <div class="container is-fluid">
            <blockquote class="blockquote">
                <h1>HOME</h1>
                <h2>Bienvenido Usuario <?php echo $nom." ".$ape." -> ".$cargo;?></h2>
            </blockquote>
        </div>
    </div>

</div>