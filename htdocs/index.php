<?php
session_start();
?>
<html>
<head>
    
    
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

<form class="" action="/cgi-bin/login.pl" method="POST" autocomplete="off">
    <h3 style="color: white;">¡Bienvenido!</h3>
    <input style="margin-bottom:.5em;" class="" type="text" name="username" placeholder="Usuario">
    <input style="margin-top:.5em; margin-bottom: .5em;" class="" type="password" name="password" placeholder="Contraseña">
    <input class="" type="submit" value="Iniciar Sesi&oacute;n">
</form>




</body>
</html>
