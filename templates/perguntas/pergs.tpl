{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">
        <h4>{$pergunta.titulo}</h4>
        <hr class="style-one">
        <div class="row">
            <div class="col-md-3">
                <img class="avatar" src="../../images/assets/default.png" width="50" height="50"><br>
                {$pergunta.username}<br>
                {$pergunta.created_date}
            </div>
            <div class="col-md-9">
                <div class="perg-conteudo">
                    {$pergunta.conteudo}
                </div>
            </div>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}