<?php
/**
 * Created by PhpStorm.
 * User: Luis
 */
include_once('../../config/init.php');
include_once('../../database/perguntas.php');

$popular_tags = getPopularTags();
$recent_tags = getRecentTags();


?>