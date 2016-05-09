<?php
  
  function createUser( $username, $password) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Utilizador(username,password) VALUES (?, ?);");
    $stmt->execute(array($username, sha1($password)));
  }

  function isLoginCorrect($username, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM users 
                            WHERE username = ? AND password = ?");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch() == true;
  }
?>
