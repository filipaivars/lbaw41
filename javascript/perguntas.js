BASE_URL = "...";

function votoPergunta(userid,perguntaid,valor) {
    console.log("HEEEEEEEEEELOOOOOOOOOOOOOOO");
    $.getJSON(BASE_URL + "api/votes/votePergunta.php", {user_id: userid,pergunta_id: perguntaid, valor: valor}, null);

}

function votoResposta(userid,perguntaid,valor) {
    $.getJSON(BASE_URL + "api/votes/votePergunta.php", {user_id: userid,pergunta_id: perguntaid, valor: valor}, null);

}
function test(pergunta_id) {
    console.log(pergunta_id);

}