<?php
  
function getLastPerguntas() {
    global $conn;
    $stmt = $conn->prepare("
        SELECT pergunta.pergunta_id,pergunta.titulo,pergunta.created_date,utilizador.username, count(DISTINCT resposta.resposta_id) as n_respostas, avg(votoutilizadorpergunta.valor) as average
        FROM pergunta 
        JOIN utilizador ON (pergunta.criar_id = utilizador.user_id) 
        LEFT OUTER JOIN resposta on (pergunta.pergunta_id = resposta.pergunta_id) 
        LEFT OUTER JOIN votoutilizadorpergunta ON (pergunta.pergunta_id = votoutilizadorpergunta.pergunta_id)
        GROUP BY pergunta.pergunta_id,utilizador.user_id
        ORDER BY pergunta.created_date DESC
        LIMIT 10
    ");
    $stmt->execute();
    return $stmt->fetchAll();
  }


function getBestPerguntas() {
    global $conn;
    $stmt = $conn->prepare("
        SELECT pergunta.pergunta_id,pergunta.titulo,pergunta.created_date,utilizador.username, count(DISTINCT resposta.resposta_id) as n_respostas, avg(votoutilizadorpergunta.valor) as average
        FROM pergunta 
        JOIN utilizador ON (pergunta.criar_id = utilizador.user_id) 
        LEFT OUTER JOIN resposta on (pergunta.pergunta_id = resposta.pergunta_id) 
        LEFT OUTER JOIN votoutilizadorpergunta ON (pergunta.pergunta_id = votoutilizadorpergunta.pergunta_id)
        GROUP BY pergunta.pergunta_id,utilizador.user_id
        ORDER BY average DESC NULLS LAST 
        LIMIT 10
    ");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getPergunta($pergunta_id) {
  global $conn;
  $stmt = $conn->prepare("
        SELECT pergunta.pergunta_id, pergunta.titulo, pergunta.conteudo,pergunta.created_date, utilizador.username, avg(votoutilizadorpergunta.valor) as average
        FROM pergunta
        JOIN utilizador ON (pergunta.criar_id = utilizador.user_id)
        LEFT OUTER JOIN votoutilizadorpergunta ON (votoutilizadorpergunta.pergunta_id = pergunta.pergunta_id)
        WHERE pergunta.pergunta_id = ?
        GROUP BY pergunta.pergunta_id, utilizador.user_id
");
  $stmt->execute(array($pergunta_id));
  return $stmt->fetchAll();
}

function getPerguntaRespostas($pergunta_id) {
    global $conn;
    $stmt = $conn->prepare("
        SELECT resposta.resposta_id, resposta.conteudo,resposta.created_date , utilizador.username, avg(votoutilizadorresposta.valor) as average
        FROM resposta
        JOIN pergunta ON (resposta.pergunta_id = pergunta.pergunta_id)
        JOIN utilizador ON (resposta.criar_id = utilizador.user_id)
        LEFT OUTER JOIN votoutilizadorresposta ON (resposta.resposta_id = votoutilizadorresposta.resposta_id)
        WHERE pergunta.pergunta_id = ?
        GROUP BY resposta.resposta_id,pergunta.pergunta_id, utilizador.user_id
        ORDER BY average DESC NULLS LAST
                            ");
    $stmt->execute(array($pergunta_id));
    return $stmt->fetchAll();
}

function getPerguntaTags($pergunta_id) {
    global $conn;
    $stmt = $conn->prepare("
        SELECT tag.nome
        FROM pergunta
        JOIN perguntatag ON (pergunta.pergunta_id = perguntatag.pergunta_id)
        JOIN tag ON (perguntatag.tag_id = tag.tag_id)
        WHERE pergunta.pergunta_id = ? 
                            ");
    $stmt->execute(array($pergunta_id));
    return $stmt->fetchAll();
}

function getPerguntaComentarios($pergunta_id) {
    global $conn;
    $stmt = $conn->prepare("
        SELECT comentario.conteudo,comentario.created_date,utilizador.username
        FROM comentario
        JOIN pergunta ON (pergunta.pergunta_id = comentario.pergunta_id)
        JOIN utilizador ON (comentario.criar_id = utilizador.user_id)
        WHERE pergunta.pergunta_id = ?
                            ");
    $stmt->execute(array($pergunta_id));
    return $stmt->fetchAll();
}

function getRespostaComentarios($resposta_id) {
    global $conn;
    $stmt = $conn->prepare("
        SELECT comentario.conteudo,comentario.created_date,utilizador.username
        FROM comentario
        JOIN resposta ON (resposta.resposta_id = comentario.resposta_id)
        JOIN utilizador ON (comentario.criar_id = utilizador.user_id)
        WHERE resposta.resposta_id = ?
                            ");
    $stmt->execute(array($resposta_id));
    return $stmt->fetchAll();
}



  
  function getUserTweets($username) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM tweets JOIN 
                                 users USING(username) 
                            WHERE username = ? 
                            ORDER BY time DESC");
    $stmt->execute(array($username));
    return $stmt->fetchAll();
  }

  function createTweet($username, $tweet) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO tweets 
                            VALUES (DEFAULT, ?, ?, ?)");
    $stmt->execute(array(date('Y-m-d H:i:s'), $username, $tweet));
  }
  
  function getTweetCountAfter($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT COUNT(*) AS count
                            FROM tweets 
                            WHERE id > ?");
    $stmt->execute(array($id));
    $result = $stmt->fetch();    
    return $result['count'];
  }

  function getTweetsAfter($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM tweets JOIN 
                                 users USING(username) 
                            WHERE id > ?
                            ORDER BY time");
    $stmt->execute(array($id));
    return $stmt->fetchAll();
  }

?>
