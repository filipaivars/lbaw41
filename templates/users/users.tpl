{include file='common/header.tpl'}

<div class="wrap">
    <div layout="column">
        <div>
            <div layout="row">
                <div flex>
                    <img src="../../images/users/perfil_foto.png" style="width: 160px">
                </div>
                <div flex="80">
                    <div layout="column">
                        <div flex>
                            <h2>{$username}</h2><br>
                            {$about}
                        </div>
                        <div flex style="margin-top: 65px">
                            <div layout="row">
                                <div flex="65">
                                    <img src="../../images/users/medalha.png">
                                </div>
                                <div>
                                    <b>4</b> questions<br>
                                    <b>2</b> answers<br>
                                    <b>2</b> favorites for
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <img src="../../images/users/rate_fav.png" style="width: 160px">
        </div>
        <span style="display:block; height: 50px;"></span>
        <div>
            <h2>QUESTIONS<h2><hr>
                    <a ng-href="#/question"><img src="../../images/users/question.png" style="width: 90%; padding-left:5%"></a>
                    <a ng-href="#/question"><img src="../../images/users/question.png" style="width: 90%; padding-left:5%"></a>
        </div>
    </div>
</div>


{include file='common/footer.tpl'}