<?php
session_start();
$conn = odbc_connect('db','root','lala123');

$sql= "SELECT * FROM rappioeste.airport;";

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
  <!-- ... -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="static/css/jquery.datetimepicker.min.css" >

<body>
            <div class="container mt-5 mb-5" style="width: 400px">
             <form action="/cgi-bin/emitirReporte.pl" method="post">
                <p>Fecha inicio:</p>
                <input type="text" id="picker" name="fechaInicio" class="form-control">
                <p>Fecha fin:</p>
                <input type="text" id="picker2" name="fechaFin" class="form-control">
                <p>Origen:</p>
                <select name="origen" class="form-control">
                <option disabled selected value> -- select an option -- </option>

                    <?php foreach($rows as $row): ?>
                        
                        <option value="<?php echo $row['id']; ?>"><?php echo $row['description']; ?>
                        </option>
                        
                    <?php endforeach; ?>
                </select>
                <p>Destino:</p>
                <select name="destino" class="form-control">
                <option disabled selected value> -- select an option -- </option>

                    <?php foreach($rows as $row): ?>
                        
                        <option value="<?php echo $row['id']; ?>"><?php echo $row['description']; ?></option>
                        
                    <?php endforeach; ?>
                </select><br>
                <input type="submit" value="Emitir reporte" name="boton">
            </form>
            </div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="static/js/jquery.datetimepicker.full.min.js"></script>

<script>
$('#picker').datetimepicker({
    timepicker: false,
    datepicker: true,
    format: 'Y-m-d', //format date
    value: '2019-8-1', // value default
    weeks: true
});


$('#picker2').datetimepicker({
    timepicker: false,
    datepicker: true,
    format: 'Y-m-d', //format date
    value: '2019-8-1', // value default
    weeks: true
});


</script>
</body>
</html>



