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
    <div layout="column">
        <div layout="row">
            <div flex="20">
                DENUNCIAS:
            </div>
            <div flex="5">
                <a>3</a>
            </div>
        </div>
        <br><br>
        <form flex>
            <input type="text" placeholder="search user by username or by email" style="outline: none; width: 40%">
            <button>search</button>
        </form>
        <br><br>
        <h2>USERS</h2>
        <br><br>
        <ul flex>
            <table class="table table-striped table-bordered">
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
        </ul>
    </div>
</div>
</body>
</html>