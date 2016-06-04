<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');

$search = $_GET['search'];
$perguntas = getSearchResults($search);

for ($i = 0; $i < count($perguntas); $i++) {
    $perguntas[$i]["tags"] = getPerguntaTags($perguntas[$i]["pergunta_id"]);
}



$smarty->assign('perguntas', $perguntas);
$smarty->assign('search', $search);
$smarty->display('home/searchResults.tpl');
?>
