<?php
include_once('../../config/init.php');
include_once('../../database/users.php');
include_once('../../database/perguntas.php');

if (!$_GET['user_id']) {
    $_SESSION['error_messages'][] = 'Undefined id';
    header("Location: $BASE_URL");
    exit;
}

$user_id = $_GET['user_id'];
$user = getUserInfo($user_id)[0];

$perguntas = getUserLastQuestions($user_id);
for ($i = 0; $i < count($perguntas); $i++) {
    $perguntas[$i]["tags"] = getPerguntaTags($perguntas[$i]["pergunta_id"]);
    if(strlen($perguntas[$i]["conteudo"]) > 50) {

        //this finds the position of the first period after 50 characters
        $period= strpos($perguntas[$i]["conteudo"], '.', 50);

        //this gets the characters 0 to the period and stores it in $teaser
        $perguntas[$i]["conteudo"] = substr($perguntas[$i]["conteudo"], 0, $period);

    }
}


$user["favourites"] = getUserFavourites($user_id)["total"];
$user["questions"] = getUserQuestions($user_id)["total"];
$user["answers"] = getUserAnswers($user_id)["total"];

$smarty->assign('perguntas', $perguntas);
$smarty->assign('user', $user);
$smarty->display('users/users.tpl');
?>
