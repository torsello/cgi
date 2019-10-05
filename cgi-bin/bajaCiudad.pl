#!C:\xampp\php\php.exe
#!C:\xampp\perl\bin\perl.exe

<?php

$conn = odbc_connect('db','root','lala123');

//$serverSoft= $_ENV['SERVER_SOFTWARE'];
$params = fgets(STDIN);
if($params):
$code= explode("&",(explode("=",$params)[1]))[0];
endif;


if(!$conn){
    exit("<strong> Error connection <strong>");
}

if(!empty($code)){

            $q = "CALL bajaCiudad(?)";
            $sql = odbc_prepare($conn, $q);
            
            if(!$sql) die("could not prepare statement ".$q);

            if(odbc_execute($sql, array($code))) {

                 
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
                            <h1> Baja exitosa! </h1>
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
        $sql= "Select * from airport where airport.show=1";

        $rs= odbc_exec($conn, $sql);
        $rows=[];
        $x=0;

        while($arr=odbc_fetch_array($rs)){
            $rows[$x]= $arr;
            $x++;
        }

        ?>

        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Baja ciudad</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        </head>
        <body>
        <div class="container" style="padding-top:150px;">
        <?php if(isset($error)){ 
            echo "<p>".$error."</p>";
        }?>
            <form action="/cgi-bin/bajaCiudad.pl" method="post">
                <select class="custom-select">
                <?php foreach($rows as $row):
                    if($row['show']): ?>
                    <option value="<?php echo $row['code']; ?>"><?php echo $row['description'];  ?></option> 
                <?php endif;
                    endforeach; ?>
                </select><br><br>
                <input type="submit" value="Dar baja" name="boton">
            </form>
            
            </div>
        </body>
        </html>

        <?php
        odbc_close($conn);  
    

        $error='Todos los campos son requeridos.';
    }
    
?>