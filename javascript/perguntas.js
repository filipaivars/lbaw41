function votoPergunta(userid,perguntaid,valor) {
    $.getJSON(BASE_URL + "api/votes/votePergunta.php", {user_id: userid,pergunta_id: perguntaid, valor: valor}, null);

}

function votoResposta(userid,perguntaid,valor) {
    $.getJSON(BASE_URL + "api/votes/votePergunta.php", {user_id: userid,pergunta_id: perguntaid, valor: valor}, null);

}