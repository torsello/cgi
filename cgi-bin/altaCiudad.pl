#!C:\xampp\php\php.exe
#!C:\xampp\perl\bin\perl.exe

<?php
if($_SESSION['logged_in']):
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
                        </head>
                        <body>
                            <h1> Alta exitosa! </h1>
                            <ul>
                                <li><a href="emitirReporte.pl">Emitir reporte</a></li>
                                <li><a href="altaCiudad.pl">Alta ciudades</a></li>
                                <li><a href="bajaCiudad.pl">Baja ciudades</a></li>
                                <li><a href="modificarMillas.pl">Modificar millas</a></li>
                            </ul>
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
            <title>Document</title>
        </head>
        <body>
        <?php if(isset($error)){ 
            echo "<p>".$error."</p>";
        }?>
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
        <?php
    }
    endif;
?>