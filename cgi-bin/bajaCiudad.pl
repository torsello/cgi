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
                        </head>
                        <body>
                            <h1> Baja exitosa! </h1>
                            <ul>
                                <li><a href="../emitirReporte.php">Emitir reporte</a></li>
                                <li><a href="../altaCiudades.php">Alta ciudades</a></li>
                                <li><a href="../bajaCiudades.php">Baja ciudades</a></li>
                                <li><a href="../modificarMillas.php">Modificar millas</a></li>
                            </ul>
                        </body>
                        </html>
                        <?php
            } else {
                $error="Error en consulta";
            }
        
    }else{
        $sql= "Select * from airport where baja=0";

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
            <title>Document</title>
        </head>
        <body>

        <?php if(isset($error)){ 
            echo "<p>".$error."</p>";
        }?>
            <form action="/cgi-bin/bajaCiudad.pl" method="post">
                <select name="code">
                <?php foreach($rows as $row):
                    if($row['baja']): ?>
                    <option value="<?php echo $row['code']; ?>"><?php echo $row['description'];  ?></option> 
                <?php endif;
                    endforeach; ?>
                </select>
                <input type="submit" value="Dar baja" name="boton">
            </form>
        </body>
        </html>

        <?php
        odbc_close($conn);  
    

        $error='Todos los campos son requeridos.';
    }
    
?>