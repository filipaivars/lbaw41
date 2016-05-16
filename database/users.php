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

function getUser($username) {
  global $conn;
  $stmt = $conn->prepare("SELECT user_id
                            FROM Utilizador
                            WHERE username = ?");
  $stmt->execute(array($username));
  return $stmt->fetchAll();
}


  
?>
