<?php
  
function getLastPerguntas() {
    global $conn;
    $stmt = $conn->prepare("
        SELECT pergunta.pergunta_id,pergunta.titulo,pergunta.created_date,utilizador.username, utilizador.avatar, pergunta.criar_id, count(DISTINCT resposta.resposta_id) as n_respostas, avg(votoutilizadorpergunta.valor) as average
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
        SELECT pergunta.pergunta_id,pergunta.titulo,pergunta.created_date,utilizador.username, utilizador.avatar, pergunta.criar_id, count(DISTINCT resposta.resposta_id) as n_respostas, avg(votoutilizadorpergunta.valor) as average
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
        SELECT pergunta.pergunta_id, pergunta.titulo, pergunta.conteudo,pergunta.created_date, utilizador.username, pergunta.criar_id, avg(votoutilizadorpergunta.valor) as average
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
        ORDER BY average DESC NULLS LAST, resposta.created_date ASC
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

function addQuestion($titulo, $conteudo, $criar_id, $tags) {
    global $conn;
    $final = 'BEGIN transaction';
    $stmt = $conn->prepare($final);
    $stmt->execute();
    $final = 'INSERT INTO Pergunta(titulo,conteudo,criar_id) VALUES ( ? , ? , ? )';
    $stmt = $conn->prepare($final);
    $stmt->execute(array($titulo,$conteudo,$criar_id));
    foreach ($tags as $tag) {
        $final = 'INSERT INTO PerguntaTag VALUES (lastval(),?)';
        $stmt = $conn->prepare($final);
        $stmt->execute(array($tag));
    }
    $final = 'COMMIT transaction';
    $stmt = $conn->prepare($final);
    $stmt->execute();
    $final = "SELECT currval('pergunta_pergunta_id_seq')";
    $stmt = $conn->prepare($final);
    $stmt->execute();
    return $stmt->fetchAll()[0];
}

/*TAGS MANAGEMENT*/
function addTag($nome) {
    global $conn;
    $queryInsert = "INSERT INTO Tag(nome) VALUES(:nome)";
    $stmt = $conn->prepare($queryInsert);
    $stmt->bindParam( ':nome', $nome, PDO::PARAM_STR );
    try{
        $stmt->execute();

    } catch(PDOException $e) {

    }
    $querySelect = "SELECT tag_id FROM tag WHERE nome =:nome";
    $stmt2 = $conn->prepare($querySelect);
    $stmt2->bindParam( ':nome', $nome, PDO::PARAM_STR );
    $stmt2->execute();
    return $stmt2->fetchAll()[0];
}



function getPopularTags() {
    global $conn;
    $query = "SELECT nome FROM Tag WHERE tag_id IN (SELECT tag_id FROM PerguntaTag GROUP BY tag_id ORDER BY COUNT(tag_id) DESC LIMIT 5)";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    return $stmt->fetchAll();
}

function getRecentTags() {
    global $conn;
    $query = "SELECT nome FROM Tag WHERE tag_id IN (SELECT tag_id FROM PerguntaTag ORDER BY pergunta_id DESC LIMIT 5);";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    return $stmt->fetchAll();
}

function getPerguntaCriador($pergunta_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT criar_id
                            FROM pergunta 
                            WHERE pergunta_id = ?");
    $stmt->execute(array($pergunta_id));
    return $stmt->fetchAll()[0]['criar_id'];
}

function getRespostaCriador($resposta_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT criar_id
                            FROM resposta 
                            WHERE resposta_id = ?");
    $stmt->execute(array($resposta_id));
    return $stmt->fetchAll()[0]['criar_id'];
}



/*SEARCH*/

function getSearchResults($search) {
    global $conn;
    $stmt = $conn->prepare("
            SELECT pergunta.pergunta_id,pergunta.titulo, pergunta.created_date,utilizador.user_id, utilizador.username, avg(votoutilizadorpergunta.valor) as average,count(DISTINCT resposta.resposta_id) as n_respostas, ts_rank_cd(pergunta.searchtext,plainto_tsquery('english', ?)) AS rank
            FROM pergunta
            JOIN utilizador ON pergunta.criar_id = utilizador.user_id
            LEFT OUTER JOIN resposta on (pergunta.pergunta_id = resposta.pergunta_id) 
            LEFT OUTER JOIN votoutilizadorpergunta ON (pergunta.pergunta_id = votoutilizadorpergunta.pergunta_id)
            WHERE  pergunta.searchtext @@ plainto_tsquery('english', ?)
            GROUP BY pergunta.pergunta_id, utilizador.user_id
            ORDER BY rank ASC , pergunta.created_date DESC
                            ");
    $stmt->execute(array($search,$search));
    return $stmt->fetchAll();
}

function getSearchByTag($tag) {
    global $conn;
    $stmt = $conn->prepare("
            SELECT DISTINCT pergunta.pergunta_id,pergunta.titulo, pergunta.created_date,utilizador.user_id, utilizador.username, avg(votoutilizadorpergunta.valor) as average,count(DISTINCT resposta.resposta_id) as n_respostas
            FROM pergunta
            JOIN utilizador ON pergunta.criar_id = utilizador.user_id
            JOIN perguntatag ON pergunta.pergunta_id = perguntatag.pergunta_id
            JOIN tag ON perguntatag.tag_id = tag.tag_id
            LEFT OUTER JOIN resposta on (pergunta.pergunta_id = resposta.pergunta_id) 
            LEFT OUTER JOIN votoutilizadorpergunta ON (pergunta.pergunta_id = votoutilizadorpergunta.pergunta_id)
            WHERE tag.nome = ?
            GROUP BY pergunta.pergunta_id, utilizador.user_id
            ORDER BY average DESC , pergunta.created_date DESC
                            ");
    $stmt->execute(array($tag));
    return $stmt->fetchAll();

}

/*RESPOSTAS*/

function createAnswer($conteudo,$criar_id,$pergunta_id) {
     global $conn;
      $stmt = $conn->prepare("INSERT INTO Resposta (conteudo,criar_id,pergunta_id) VALUES (:conteudo,:criar_id,:pergunta_id)");
      $stmt->bindParam( ':criar_id', $criar_id, PDO::PARAM_STR );
      $stmt->bindParam( ':conteudo', $conteudo, PDO::PARAM_STR );
      $stmt->bindParam(':pergunta_id', $pergunta_id, PDO::PARAM_STR );
      return $stmt->execute();

}

function canUserAnswer($criar_id,$pergunta_id) {
    global $conn;
    $stmt = $conn->prepare("
            SELECT *
            FROM resposta
            WHERE resposta.criar_id = :criar_id AND resposta.pergunta_id = :pergunta_id
                            ");
    $stmt->bindParam( ':criar_id', $criar_id, PDO::PARAM_STR );
    $stmt->bindParam(':pergunta_id', $pergunta_id, PDO::PARAM_STR );
    return $stmt->fetch() == NULL;
}

/*COMENTARIOS*/

function createCommentQuestion($conteudo, $criar_id, $pergunta_id){

   global $conn;
   $stmt = $conn->prepare("INSERT INTO Comentario (conteudo,criar_id,pergunta_id) VALUES (:conteudo,:criar_id,:pergunta_id)");
   $stmt->bindParam( ':criar_id', $criar_id, PDO::PARAM_STR );
   $stmt->bindParam( ':conteudo', $conteudo, PDO::PARAM_STR );
   $stmt->bindParam(':pergunta_id', $pergunta_id, PDO::PARAM_STR );
   return $stmt->execute();
}

function createCommentAnswer($conteudo, $criar_id, $resposta_id){

   global $conn;
   $stmt = $conn->prepare("INSERT INTO Comentario (conteudo,criar_id,resposta_id) VALUES (:conteudo,:criar_id,:resposta_id)");
   $stmt->bindParam( ':criar_id', $criar_id, PDO::PARAM_STR );
   $stmt->bindParam( ':conteudo', $conteudo, PDO::PARAM_STR );
   $stmt->bindParam(':resposta_id', $resposta_id, PDO::PARAM_STR );
   return $stmt->execute();
}

/*UPDATES*/
function updateQuestion($pergunta_id, $titulo, $conteudo,$tags) {

    global $conn;
    $final = 'DELETE FROM perguntatag  WHERE pergunta_id= ?;';
    $stmt = $conn->prepare($final);
    $stmt->execute(array($pergunta_id));
    $final = 'BEGIN transaction';
    $stmt = $conn->prepare($final);
    $stmt->execute();
    $final = 'UPDATE Pergunta SET titulo= ?, conteudo= ? WHERE pergunta_id= ?;';
    $stmt = $conn->prepare($final);
    $stmt->execute(array($titulo,$conteudo,$pergunta_id));
    foreach ($tags as $tag) {
        $final = 'INSERT INTO PerguntaTag VALUES (?,?)';
        $stmt = $conn->prepare($final);
        $stmt->execute(array($pergunta_id,$tag));
    }
    $final = 'COMMIT transaction';
    $stmt = $conn->prepare($final);
    return $stmt->execute();

}


function updateAnswer($resposta_id, $conteudo) {




    global $conn;
    $query = "UPDATE resposta SET conteudo= :conteudo WHERE resposta_id= :resposta_id;";
    $stmt = $conn->prepare($query);
    $stmt->bindParam( ':conteudo', $conteudo, PDO::PARAM_STR );
    $stmt->bindParam(':resposta_id', $resposta_id, PDO::PARAM_STR );
    return $stmt->execute();
}

function updateCommentQuestion($conteudo, $criar_id, $pergunta_id) {
    global $conn;
    $query = "UPDATE comentario SET conteudo= :conteudo WHERE pergunta_id= :pergunta_id AND criar_id= :criar_id;";
    $stmt = $conn->prepare($query);
    $stmt->bindParam( ':conteudo', $conteudo, PDO::PARAM_STR );
    $stmt->bindParam(':pergunta_id', $pergunta_id, PDO::PARAM_STR );
    $stmt->bindParam(':criar_id', $criar_id, PDO::PARAM_STR );
    return $stmt->execute();
}

function updateCommentAwnser($conteudo, $criar_id, $resposta_id) {
    global $conn;
    $query = "UPDATE comentario SET conteudo= :conteudo WHERE resposta_id= :resposta_id AND criar_id= :criar_id;";
    $stmt = $conn->prepare($query);
    $stmt->bindParam( ':conteudo', $conteudo, PDO::PARAM_STR );
    $stmt->bindParam(':resposta_id', $resposta_id, PDO::PARAM_STR );
    $stmt->bindParam(':criar_id', $criar_id, PDO::PARAM_STR );
    return $stmt->execute();
}


/*VOTOS perg*/

function existsVotoPergunta($user_id, $pergunta_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM votoutilizadorpergunta 
                            WHERE user_id = ? AND pergunta_id = ?");
    $stmt->execute(array($user_id, $pergunta_id));
    return $stmt->fetch() == true;
}


function createVotoPergunta($user_id, $pergunta_id, $valor){

    global $conn;
    $stmt = $conn->prepare("INSERT INTO votoutilizadorpergunta (user_id,pergunta_id,valor) VALUES (:user_id,:pergunta_id,:valor)");
    $stmt->bindParam( ':valor', $valor, PDO::PARAM_STR );
    $stmt->bindParam( ':user_id', $user_id, PDO::PARAM_STR );
    $stmt->bindParam(':pergunta_id', $pergunta_id, PDO::PARAM_STR );
    return $stmt->execute();
}


function updateVotoPergunta($user_id, $pergunta_id, $valor) {
    global $conn;
    $query = "UPDATE votoutilizadorpergunta SET valor= :valor WHERE pergunta_id= :pergunta_id AND user_id= :user_id;";
    $stmt = $conn->prepare($query);
    $stmt->bindParam( ':valor', $valor, PDO::PARAM_STR );
    $stmt->bindParam( ':user_id', $user_id, PDO::PARAM_STR );
    $stmt->bindParam(':pergunta_id', $pergunta_id, PDO::PARAM_STR );
    return $stmt->execute();
}

/*VOTOS resp*/
function existsVotoResposta($user_id, $resposta_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM votoutilizadorresposta 
                            WHERE user_id = ? AND resposta_id = ?");
    $stmt->execute(array($user_id, $resposta_id));
    return $stmt->fetch() == true;
}


function createVotoResposta($user_id, $resposta_id, $valor){

    global $conn;
    $stmt = $conn->prepare("INSERT INTO votoutilizadorresposta (user_id,resposta_id,valor) VALUES (:user_id,:resposta_id,:valor)");
    $stmt->bindParam( ':valor', $valor, PDO::PARAM_STR );
    $stmt->bindParam( ':user_id', $user_id, PDO::PARAM_STR );
    $stmt->bindParam(':resposta_id', $resposta_id, PDO::PARAM_STR );
    return $stmt->execute();
}


function updateVotoResposta($user_id, $resposta_id, $valor) {
    global $conn;
    $query = "UPDATE votoutilizadorresposta SET valor= :valor WHERE resposta_id= :resposta_id AND user_id= :user_id;";
    $stmt = $conn->prepare($query);
    $stmt->bindParam( ':valor', $valor, PDO::PARAM_STR );
    $stmt->bindParam( ':user_id', $user_id, PDO::PARAM_STR );
    $stmt->bindParam(':resposta_id', $resposta_id, PDO::PARAM_STR );
    return $stmt->execute();
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
