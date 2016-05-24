<?php
  
  function createUser( $username, $password) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Utilizador(username,password) VALUES (?, ?);");
    $stmt->execute(array($username, sha1($username.$password)));
  }

  function isLoginCorrect($username, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM Utilizador 
                            WHERE username = ? AND password = ?");
    $stmt->execute(array($username, sha1($username.$password)));
    return $stmt->fetch() == true;
  }

function getUserId($username) {
  global $conn;
  $stmt = $conn->prepare("SELECT user_id
                            FROM Utilizador 
                            WHERE username = ?");
  $stmt->execute(array($username));
  return $stmt->fetchAll()[0];
}

function getUser($user_id) {
  global $conn;
  $stmt = $conn->prepare("SELECT username
                            FROM Utilizador
                            WHERE username = ?");
  $stmt->execute(array($user_id));
  return $stmt->fetchAll();
}

function deleteUser($user_id) {
    global $conn;
    $stmt = $conn->prepare("DELETE FROM Utilizador
                              WHERE user_id= ?;");
    try{
        return $stmt->execute(array($user_id));
    } catch(PDOException $e) {

    }
}

function getUserInfo($user_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT username, avatar,created_date, about
                              FROM Utilizador
                                WHERE user_id = ?");
    $stmt->execute(array($user_id));
    return $stmt->fetchAll();
}

function editUserInfo($user_id, $about, $password, $avatar) {
    global $conn;
    $stmt = $conn->prepare("UPDATE Utilizador
                              SET about = :about, password = :password, avatar = :avatar
                                WHERE user_id = :user_id;");
    $stmt->bindParam( ':user_id', $user_id, PDO::PARAM_STR );
    $stmt->bindParam( ':about', $about, PDO::PARAM_STR );
    $stmt->bindParam( ':password', $password, PDO::PARAM_STR );
    $stmt->bindParam( ':avatar', $avatar, PDO::PARAM_STR );
    try{
        return $stmt->execute();
    } catch(PDOException $e) {

    }
}

function getUserLastQuestions($user_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT pergunta.pergunta_id,pergunta.titulo,pergunta.created_date,utilizador.username, pergunta.criar_id, pergunta.conteudo, count(DISTINCT resposta.resposta_id) as n_respostas, avg(votoutilizadorpergunta.valor) as average
        FROM pergunta
        JOIN utilizador ON (pergunta.criar_id = utilizador.user_id)
        LEFT OUTER JOIN resposta on (pergunta.pergunta_id = resposta.pergunta_id)
        LEFT OUTER JOIN votoutilizadorpergunta ON (pergunta.pergunta_id = votoutilizadorpergunta.pergunta_id)
        WHERE pergunta.criar_id = ?
        GROUP BY pergunta.pergunta_id,utilizador.user_id
        ORDER BY pergunta.created_date DESC
        LIMIT 5");
    $stmt->execute(array($user_id));
    return $stmt->fetchAll();
}

function getUserFavourites($user_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT COUNT(user_id) as total
                              FROM Favorito
                                WHERE user_id = ?");
    return $stmt->execute(array($user_id));
}

function getUserQuestions($user_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT COUNT(pergunta_id) as total
                              FROM Pergunta
                                WHERE criar_id = ?");
    return $stmt->execute(array($user_id));
}

function getUserAnswers($user_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT COUNT(resposta_id) as total
                              FROM Resposta
                                WHERE criar_id = ?");
    return $stmt->execute(array($user_id));
}


?>
