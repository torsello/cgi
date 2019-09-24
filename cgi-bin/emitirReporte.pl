#!C:\xampp\php\php.exe
#!C:\xampp\perl\bin\perl.exe

<?php

$conn = odbc_connect('db','root','lala123');

//$serverSoft= $_ENV['SERVER_SOFTWARE'];
$params = fgets(STDIN);
$fechaInicio= explode("&",(explode("=",$params)[1]))[0];
$fechaFin= explode("&",(explode("=",$params)[2]))[0];
$origen= explode("&",(explode("=",$params)[3]))[0];
$destino=explode("&",(explode("=",$params)[4]))[0];



if(!$conn){
    exit("<strong> Error connection <strong>");
}

if(!empty($fechaInicio) or !empty($fechaFin) or !empty($origen) or !empty($destino)){

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
                                <li><a href="../emitirReporte.php">Emitir reporte</a></li>
                                <li><a href="../altaCiudades.php">Alta ciudades</a></li>
                                <li><a href="../bajaCiudades">Baja ciudades</a></li>
                                <li><a href="../modificarMillas.php">Modificar millas</a></li>
                            </ul>
                        </body>
                        </html>
                        <?php
            } else {
                $error="Error en consulta";
            }
        
    }else{
		$error='Todos los campos son requeridos.';
    }
    

	//header('location: http://127.0.0.1');
    //exit();

?>