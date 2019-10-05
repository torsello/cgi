#!C:\xampp\php\php.exe
#!C:\xampp\perl\bin\perl.exe

<?php

$conn = odbc_connect('db','root','lala123');

//$serverSoft= $_ENV['SERVER_SOFTWARE'];
$params = fgets(STDIN);
if($params):
$code= explode("&",(explode("=",$params)[1]))[0];
$description= explode("&",(explode("=",$params)[2]))[0];
$state= explode("&",(explode("=",$params)[1]))[0];
$state_code=explode("&",(explode("=",$params)[1]))[0];
$address=explode("&",(explode("=",$params)[1]))[0];
endif;


if(!$conn){
    exit("<strong> Error connection <strong>");
}

if(!empty($code) or !empty($description) or !empty($state) or !empty($state_code) or !empty($address)){

            $q = "CALL altaCiudad(?,?,?,?,?)";
            $sql = odbc_prepare($conn, $q);
            
            if(!$sql) die("could not prepare statement ".$q);

            if(odbc_execute($sql, array($code, $description, $state, $state_code, $address))) {

                 
                        ?>
                        <!DOCTYPE html>
                        <html lang="en">
                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <meta http-equiv="X-UA-Compatible" content="ie=edge">
                            <title>Menu</title>
                            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

                        </head>
                        <body>
                            
                            <div class="container" style="padding-top:150px;">
                            <h1> Alta exitosa! </h1>
                                <ul class="list-group" style="list-style-type:none;">
                                    <li><a href="emitirReporte.pl" class="list-group-item">Emitir reporte</a></li>
                                    <li><a href="altaCiudad.pl"  class="list-group-item">Alta ciudades</a></li>
                                    <li><a href="bajaCiudad.pl"  class="list-group-item">Baja ciudades</a></li>
                                    <li><a href="modificarMillas.pl" class="list-group-item">Modificar millas</a></li>
                                </ul>   
                                   </div>
                                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>                     
                        </body>
                        </html>
                        <?php
            } else {
                $error="Error en consulta";
            }
        
    }else{
        		$error='Todos los campos son requeridos.';
?>

        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <title>Alta ciudad</title>
        </head>
        <body>
        <?php if(isset($error)){ 
            echo "<p>".$error."</p>";
        }?>
        <div class="container">
            <form action="/cgi-bin/altaCiudad.pl" method="post">
             <div class="form-group">
                <label for="exampleInputEmail1">Codigo</label>
                <input type="text" name="code" id="" placeholder="" class="form-control"><br>
            <div><div class="form-group">
                <label for="exampleInputEmail1">Descripcion</label>
                <input type="text" name="description" id="" placeholder="" class="form-control"><br>
            <div><div class="form-group">
                <label for="exampleInputEmail1">Estado</label>
                <input type="text" name="state" id="" placeholder="" class="form-control"><br>
            <div><div class="form-group">
                <label for="exampleInputEmail1">Codigo postal</label>
                <input type="text" name="state_code" id="" placeholder="" class="form-control"><br>
            <div><div class="form-group">
                <label for="exampleInputEmail1">Direccion</label>
                <input type="text" name="address" id="" placeholder="" class="form-control"><br><br>
            <div>
                <input type="submit" value="Dar alta" name="boton"><br>
            </form>
        <div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        </body>
        </html>
        <?php
    }
?>