<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <br>
    <h1>Welcome</h1>
    <hr>
    <div layout="column">
        <div class="container">
            <div>
                <h2>DENUNCIAS</h2>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Report Number</th>
                            <th>User ID</th>
                            <th>Username</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach $reports as $row }
                            <tr>
                                <td> {$row.denuncia_id} </td>
                                <td> {$row.user_id} </td>
                                <td> <a href="../../pages/users/users.php?user_id={$row.user_id}"> {$row.username} </a></td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <h2>USERS</h2>
        <table>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>User Creation Date</th>
            </tr>
            {foreach $users as $row }
                <tr>
                    <td> {$row.user_id} </td>
                    <td> <a href="../../pages/users/users.php?user_id={$row.user_id}"> {$row.username} </a></td>
                    <td> {$row.created_date} </td>
                </tr>
            {/foreach}
        </table>
    </div>
</div>
</body>
</html>