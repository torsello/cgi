<?php
session_start();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <form action="/cgi-bin/altaCiudad.pl" method="post">
        <input type="text" name="code" id="" placeholder="Codigo"><br>
        <input type="text" name="description" id="" placeholder="Descripcion"><br>
        <input type="text" name="state" id="" placeholder="Estado"><br>
        <input type="text" name="state_code" id="" placeholder="Codigo postal"><br>
        <input type="text" name="address" id="" placeholder="Direccion"><br><br>
        <input type="submit" value="Dar alta" name="boton"><br>
    </form>
</body>
</html>



