<?php
session_start();
$conn = odbc_connect('db','root','lala123');

$q=odbc_prepare($conn, "SELECT * FROM rappioeste.user where id= ?");
$rs = odbc_execute($q, array($_POST['id']));

$rows=odbc_fetch_array($q);

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
    <form action="/cgi-bin/modificarMillas.pl" method="post">
        <input type="text" name="miles" value="<?php echo $rows['miles']; ?>">
        <input type="text" name="id" value="<?php echo $_POST['id']; ?>" hidden>
        <input type="submit" value="Seleccionar" name="boton1">
    </form>

</body>
</html>

<?php
odbc_close($conn);  
?>

