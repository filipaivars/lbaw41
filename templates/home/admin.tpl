<!DOCTYPE html>

<html>
<head>
    <style>
        table, td, th {
            border: 1px solid #ddd;
            text-align: left;
        }

        table {
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2
        }
    </style>
</head>
<body>
<br>
<h1>Welcome</h1>
<hr>
<div class="container">
    <h2>Reported Users</h2>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>#</th>
                <th>User ID</th>
                <th>Username</th>
                <th>Actions</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            {foreach $reports as $row }
                <tr>
                    <td> {$row.denuncia_id} </td>
                    <td> {$row.user_id} </td>
                    <td> <a href="../../pages/users/users.php?user_id={$row.user_id}"> {$row.username} </a></td>
                    <td>
                        <button onclick="location.href='{$BASE_URL}actions/admin/delete_user.php?user_id={$row.user_id}'">Remove User</button>
                        <button onclick="location.href='{$BASE_URL}actions/admin/delete_report.php?denuncia_id={$row.denuncia_id}'">Ignore Report</button>
                    </td>
                    <td> {$row.descricao} </td>
                </tr>
            {/foreach}
            </tbody>
        </table>
    </div>
</div>
<h2>System Users</h2>
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
                    <td> <button onclick="location.href='{$BASE_URL}actions/admin/delete_user.php?user_id={$row.user_id}'">Remove User</button> </td>
                </tr>
            {/foreach}
        </table>
</body>
</html>