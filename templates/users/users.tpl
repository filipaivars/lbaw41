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
                            <h2>{$user.username}</h2><br>
                            {$user.about}
                        </div>
                        <div flex style="margin-top: 65px">
                            <div layout="row">
                                <div flex="65">
                                    Medals
                                </div>
                                <div>
                                    <b>{$user.questions}</b> questions<br>
                                    <b>{$user.answers}</b> answers<br>
                                    <b>{$user.favourites}</b> favourites<br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>

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