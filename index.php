<?php require "./inc/session.php";

include "./inc/head.php";

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

include "./inc/footer.php";
