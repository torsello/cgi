<?php
session_start();
$conn = odbc_connect('db','root','lala123');

$sql= "Select * from airport";

$rs= odbc_exec($conn, $sql);
$rows=[];
$x=0;

while(odbc_fetch_array($rs)){
    $rows[$x]= odbc_fetch_array($rs);
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
    <form action="/cgi-bin/bajaCiudad.pl" method="post">
        <select name="code">
        <?php foreach($rows as $row): ?>
            <option value="<?php echo $row['code']; ?>"><?php echo $row['description']; ?></option> 
        <?php endforeach; ?>
        </select>
        <input type="submit" value="Dar baja" name="boton">
    </form>
</body>
</html>

<?php
odbc_close($conn);  
?>



