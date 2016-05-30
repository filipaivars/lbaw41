<div class="header">
    <div class="container-fluid" id="header-container">
        <div class="row" style="display: flex; align-items: center; text-align: right">
            <div class="col-xs-12 col-md-2">
                <a href="../../pages/home/home.php">
                    <img src="../../images/assets/logo.png" style="height: 40px;">
                </a>
            </div>
            <div class="col-xs-8 col-md-2">
                <form method="get" action="../../pages/home/searchResults.php">
                    <div class="input-group stylish-input-group">
                        <input type="text" class="form-control"  placeholder="Search" name="search">
                        <span class="input-group-addon">
                            <button type="submit">
                                <span class="glyphicon glyphicon-search"></span>

                            </button>
                        </span>
                    </div>
                </form>
            </div>
            <div class="col-xs-8 col-md-7" style="text-align: right; font-weight: 200; font-size: 80%;">
                <b style="margin-right: 20px">{$USERNAME}</b>
                <button value="logout"><a href="{$BASE_URL}actions/users/logout.php">Logout</a></button>
            </div>
            <div class="col-xs-2 col-md-1 dropdown" style="text-align: right " >
                <a class="dropdown-toggle" data-toggle="dropdown" href="../../pages/users/register.php">
                    <i class="material-icons" style="font-size: 35px">person</i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">HTML</a></li>
                    <li><a href="#">CSS</a></li>
                    <li><a href="#">JavaScript</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>