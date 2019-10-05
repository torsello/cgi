<?php
session_start();
?>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>

<!--
<?php
//if(isset($error)){
?>

<small style="color:#aa0000;">
<?php //echo $error; ?>
</small>
<br>


<?php
//}
?>
-->
<div class="container" style="padding-top:150px;">
<form class="" action="/cgi-bin/login.pl" method="POST" autocomplete="off">
    <h3 style="color: black;">¡Bienvenido!</h3>
    <div class="form-group">
    <label for="exampleInputEmail1">Usuario</label>
    <input style="margin-bottom:.5em;" class="form-control" type="text" name="username" placeholder="">
    </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Contraseña</label>
    <input style="margin-top:.5em; margin-bottom: .5em;" class="form-control" type="password" name="password" placeholder="">
    </div>
    <input class="" type="submit" value="Iniciar Sesi&oacute;n">
</form>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
