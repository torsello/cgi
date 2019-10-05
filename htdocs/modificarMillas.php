<?php
session_start();
$conn = odbc_connect('db','root','lala123');

$sql= "SELECT * FROM rappioeste.user;";

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
    <form action="modificarMillas2.php" method="post">
        <select name="id">
        <?php foreach($rows as $row): ?>
            
            <option value="<?php echo $row['id']; ?>"><?php echo $row['dni_passport']; ?>
            </option>
            
        <?php endforeach; ?>
        </select>
        <input type="submit" value="Seleccionar" name="boton1">
    </form>

</body>
</html>

<?php
odbc_close($conn);  
?>

