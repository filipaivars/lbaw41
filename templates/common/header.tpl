<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>WalkMeThrough</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="../../css/styles.css">
    <script src="../../javascript/home.js"></script>

</head>
<body>
{if $USERNAME}
    {include file='common/menu_logged_in.tpl'}

{else}
    {include file='common/menu_logged_out.tpl'}

{/if}



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


