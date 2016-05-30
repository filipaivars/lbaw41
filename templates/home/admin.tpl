<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' href='bower_components/angular-material/angular-material.css' />
    <link rel="stylesheet" href="styles/main.css">
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="wrap">
    <br><br>
    <h1>Welcome</h1>
    <hr>
    <div layout="column">
        <div layout="row">
            <div>
                <h2>DENUNCIAS</h2>
                <table>
                    <tr>
                        <th>Report Number</th>
                        <th>User ID</th>
                        <th>Username</th>
                    </tr>
                    {foreach $reports as $row }
                        <tr>
                            <td> {$row.denuncia_id} </td>
                            <td> {$row.user_id} </td>
                            <td> <a href="../../pages/users/users.php?user_id={$row.criar_id}> {$row.username} </a></td>
                        </tr>
                    {/foreach}
                </table>
            </div>
            <div>

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
                        <td> {$row.username} </td>
                        <td> {$row.created_date} </td>
                    </tr>
                {/foreach}
            </table>
    </div>
</div>
</body>
</html>