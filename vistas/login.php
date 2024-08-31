<div class="container">
    <div class="row">
        <figure class="text-center">
            <blockquote class="blockquote">
                <p class="tittle">¡Bienvenid@ a Everywhere Travel!</p>
            </blockquote>
        </figure>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-8">
            <p class="form_t">Inicio de Sesion</p>
            <form action="" method="POST">
                <div class="mb-3 row form_t">
                    <p class="col-sm-3">Usuario</p>
                    <div class="col-sm-5">
                        <input type="text" patwwtern="[a-zA-Z]{0,50}"
                            maxlength="50" class="bor-red form-control" name="usuario">
                    </div>
                </div>
                <div class="mb-3 row form_t">
                    <p class="col-sm-3">Contraseña</p>
                    <div class="col-sm-5">
                        <input type="password" pattern="[a-zA-Z0-9]{0,20}" maxlength="20"
                            class="bor-red form-control" id="inputPassword" name="contraseña">
                    </div>
                </div>
                <div class="olvd">
                    <a class="navbar-brand" href="#">olvidé mi contraseña</a>
                </div>
                <p class="form_b">
                    <button type="submit" class="botton button is-info is-rounded">Iniciar Sesión</button>
                </p>
                <?php
                if (isset($_POST['usuario']) && isset($_POST['contraseña'])) {
                    
                    require_once "./php/main.php";
                    require_once "./php/funciones.php";
                    
                }
                ?>
            </form>
        </div>
        <div class="col-4">
            <div class="img">
                <img src="/img/pixelcut-export.ico" width="275" height="275" class="rounded"
                    alt="Logo">
            </div>
        </div>
    </div>
</div>