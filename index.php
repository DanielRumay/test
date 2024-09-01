<?php require "./inc/session.php";
?>
!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/fondo.css">

</head>
    <body>
<?php
if (!isset($_GET['vista']) || $_GET['vista'] == "") {
    $_GET['vista'] = "login";
}

if (is_file("./vistas/" . $_GET['vista'] . ".php") && $_GET['vista'] != "login" && $_GET['vista'] != "404") {
    include "./inc/navbar.php";

    include "./vistas/" . $_GET['vista'] . ".php";
} else {

    if ($_GET['vista'] == "login") {
        include "./inc/navbar.php";

        include "./vistas/login.php";
    } else {

        include "./vistas/404.php";
    }
}
?>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>

</html>
