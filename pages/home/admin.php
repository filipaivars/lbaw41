<?php

include_once('../../config/init.php');
include_once('../../database/users.php');
include_once('../../database/perguntas.php');

/*
function deleteThis($user_id, $report_id) {
    deleteUser($user_id);
    deleteReport($report_id);
}
*/

if(!$_SESSION['admin']) {


    $smarty->display('home/admin_login.tpl');

}
else{
    $users = getAllUsers();
    $reports = getReportedUsers();

//$smarty->assign('perguntas', $perguntas);
    $smarty->assign('deleteThis', 'delete_this');
    $smarty->assign('users', $users);
    $smarty->assign('reports', $reports);
    $smarty->display('home/admin.tpl');
}
?>
