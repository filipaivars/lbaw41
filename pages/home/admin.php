<?php
include_once('../../config/init.php');
include_once('../../database/users.php');
include_once('../../database/perguntas.php');

function delete($id) {
    echo $id;
    deleteUser($id);
}

$users = getAllUsers();
$reports = getReportedUsers();

//$smarty->assign('perguntas', $perguntas);
$smarty->assign('users', $users);
$smarty->assign('reports', $reports);
$smarty->display('home/admin.tpl');
?>
