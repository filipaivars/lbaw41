<?php
  
function getLastPerguntas() {
    global $conn;
    $stmt = $conn->prepare(
        "SELECT pergunta.pergunta_id, pergunta.titulo,pergunta.created_date,utilizador.username, avg(votoutilizadorpergunta.valor) as average , count(resposta.resposta_id) as n_respostas
        FROM pergunta, utilizador, votoutilizadorpergunta,resposta
        WHERE pergunta.criar_id = utilizador.user_id AND pergunta.criar_id = votoutilizadorpergunta.pergunta_id AND pergunta.pergunta_id = resposta.pergunta_id
        GROUP BY pergunta.pergunta_id,utilizador.user_id
        ORDER BY pergunta.created_date DESC
        LIMIT 10
    ");
    $stmt->execute();
    return $stmt->fetchAll();
  }

function getPergunta($pergunta_id) {
  global $conn;
  $stmt = $conn->prepare("
        SELECT pergunta.pergunta_id, pergunta.titulo, pergunta.conteudo
        FROM pergunta
        WHERE pergunta.pergunta_id = ? 
                            ");
  $stmt->execute();
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
