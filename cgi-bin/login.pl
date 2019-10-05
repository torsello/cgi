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
            $j = "select * from role where user_id =?";
            $sql=odbc_prepare($conn, $q);
            $sql1=odbc_prepare($conn, $j);
            
            if(!$sql) die("could not prepare statement ".$q);
            if(!$sql1) die("could not prepare statement ".$j);

            if(odbc_execute($sql, array($username, $password))) {
               
                 $row = odbc_fetch_array($sql);

                  if(odbc_execute($sql1, array($row['id']))){
                      $row2= odbc_fetch_array($sql1);
                 

                    if($row['user_name']==$username and $row['password']==$password){
                        if($row2['permission']==1){
                            $_SESSION['logged_in']=true;
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
                        }else{
                            $error="No tienes los privilegios necesarios.";
                        }
                    }else{
                        $error="Usuario o contrasena invalido.";
                    }
                }
            } else {
                $error="Error en consulta";
            }
        
    }else{
		$error='Todos los campos son requeridos.';
    }
?>