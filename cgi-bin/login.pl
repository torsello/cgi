#!C:\xampp\php\php.exe
#!C:\xampp\perl\bin\perl.exe

<?php

$conn = odbc_connect('db','root','lala123');

//$serverSoft= $_ENV['SERVER_SOFTWARE'];
$params = fgets(STDIN);
$username= explode("&",(explode("=",$params)[1]))[0];
$password= explode("=",$params)[2];



if(!$conn){
    exit("<strong> Error connection <strong>");
}

if(!empty($username) and !empty($password)){

            $q = "select * from user where user_name=? and password=?";
            $sql=odbc_prepare($conn, $q);
            
            if(!$sql) die("could not prepare statement ".$q);

            if(odbc_execute($sql, array($username, $password))) {
                 $row = odbc_fetch_array($sql);
                 if($row['user_name']==$username and $row['password']==$password){
                    if($row['root']==1){
                        $_SESSION['logged_in']=true;
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
                            <ul>
                                <li><a href="../emitirReporte.php">Emitir reporte</a></li>
                                <li><a href="../altaCiudades.php">Alta ciudades</a></li>
                                <li><a href="../bajaCiudades.php">Baja ciudades</a></li>
                                <li><a href="../modificarMillas.php">Modificar millas</a></li>
                            </ul>
                        </body>
                        </html>
                        <?php
					}else{
                        $error="No tienes los privilegios necesarios.";
                    }
                }else{
                    $error="Usuario o contrasena invalido.";
                }
            } else {
                $error="Error en consulta";
            }
        
    }else{
		$error='Todos los campos son requeridos.';
    }
    

	//header('location: http://127.0.0.1');
    //exit();

?>