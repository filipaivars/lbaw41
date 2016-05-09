<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users.php');

    var_dump($_SESSION['error_messages']);
    var_dump($_SESSION['field_errors']);
  
  $smarty->display('users/register.tpl');
?>
