<?php
include_once('../../config/init.php');
include_once('../../database/users.php');
include_once('../../database/perguntas.php');

$users = getAllUsers();
$reports = getReportedUsers();

function delete($id) {
    if (isset($_GET['delete'])) {
        deleteUser($id);
    }
}

//$smarty->assign('perguntas', $perguntas);
$smarty->assign('users', $users);
$smarty->assign('reports', $reports);
$smarty->display('home/admin.tpl');
?>
