<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>WalkMeThrough</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="../../css/styles.css">
  <script src="../../javascript/home.js"></script>

</head>
<body>
<div class="header">
  <div class="container-fluid" id="header-container">
    <div class="row">
      <div class="col-xs-12 col-md-6">
        <img src="../../images/logo.png" style="height: 40px;">
      </div>
      <div class="col-xs-8 col-md-4">
        <div class="input-group stylish-input-group">
          <input type="text" class="form-control"  placeholder="Search" >
                        <span class="input-group-addon">
                            <button type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
        </div>
      </div>
      <div class="col-xs-2 col-md-1" style="text-align: right   ">
        <i class="material-icons" style="font-size: 35px">email</i>
      </div>
      <div class="col-xs-2 col-md-1" style="text-align: right ">
        <i class="material-icons" style="font-size: 35px">person</i>
      </div>
    </div>
  </div>
</div>
<div class="header_2">

  <div class="aparece" style="padding-left: 30%; padding-right: 30%">
    <form id="askForm">
      <div class="row">
        <div class="col-xs-12 col-md-12">
          <input type="text" name="questionTitle" placeholder="Title" style="width: 100%; margin-top: 10px; border-style: none; height: 33px;">
        </div>
        <div class="col-xs-12 col-md-12">
          <input type="text" name="questionDescription" placeholder="Description" style="width: 100%; height: 100px; margin-top: 10px; border-style: none;">
        </div>
        <div class="col-xs-12 col-md-8">
          <input type="text" name="questionTag" placeholder="tags" style="width: 100%; margin-top: 10px; border-style: none; height: 33px">
        </div>
        <div class="col-xs-12 col-md-4" style="text-align: right; border-style: none;">
          <button type="button" class="btn btn-default" style="background-color: #f44937; color: white; margin-top: 10px;">post question</button>

        </div>

      </div>
    </form>
    <hr class="style-one">
  </div>
  <div class="btn2">
    ask a question
  </div>
</div>


