{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">
        <h4>{$pergunta.titulo}</h4>
        <hr class="style-one">
        <div class="row">
            <div class="col-md-2">
                <img class="avatar" src="../../images/assets/default.png" width="100" height="100"><br>
                {$pergunta.username}<br>
                <div class="perg-data">{$pergunta.created_date}</div>
                <br><br>
                {if $USERNAME eq $pergunta.username}
                    É MEU<br>
                <form action="">
                    <input type="checkbox" name="fechar" value="">fechar pergunta<br>
                    <input type="submit">
                </form>
                {/if}
            </div>
            <div class="col-md-10">

                <div class="perg-conteudo">
                    {$pergunta.conteudo}
                </div>
                <div style="margin-top: 10px; margin-bottom: 10px">
                {foreach $tags as $tag}
                    <div class="col-md-1" style="display:flex">
                        <div class="tag-style">
                            {$tag.nome}
                        </div>
                    </div>
                {/foreach}
                </div>
                <div>
                    <br><br>
                    <script>
                        document.write(checkNull({$pergunta.average}));
                    </script>


                        {if not ($USERNAME eq $pergunta.username)}
                            <input type="number" class="rating" id="test" name="test" data-min="1" data-max="5" value="0">
                        {/if}
                        <br>
                    <div id="apareceComm1">
                        <form method="post" action="{$BASE_URL}actions/perguntas/create_comentario_pergunta.php" enctype="multipart/form-data">
                            <input type="text" style="display: none" name="pergunta_id" value="{$pergunta.pergunta_id}">
                            <input type="text" name="conteudo" placeholder="my comment" style="width: 100%; margin-top: 10px; border-style: none; height: 50px;">
                            <button type="submit" class="perg-comment btn2_2" style="background: none; border: none; color: #e94735; margin-top: 10px">COMMENT</button>
                        </form>
                    </div>
                    <a class="perg-comment" id="btn2_1">COMMENT</a>
                    {foreach $pergunta.comentarios as $comentario}
                        <div class="row" style="margin-top: 20px; padding-top: 5px; margin-left: 3px; margin-right: 5px;background-color: #ecf0f1; min-height: 85px">
                            <div >
                                <div class="col-md-1">
                                    <img class="avatar" src="">
                                </div>
                                <div class="col-md-9">
                                    <b>{$comentario.username}</b><br>
                                    {$comentario.conteudo}
                                </div>
                                <div class="col-md-2">
                                    {$comentario.created_date}
                                </div>
                            </div>
                        </div>

                        <script>
                            myFunction();
                        </script>
                    {/foreach}

                    <div style="margin-top: 30px;">
                        <form method="post" action="{$BASE_URL}actions/perguntas/create_resposta.php" enctype="multipart/form-data">
                            <input type="text" style="display: none" name="pergunta_id" value="{$pergunta.pergunta_id}">
                            <input type="text" name="conteudo" placeholder="my answer" style="width: 100%; margin-top: 10px; border-style: none; height: 75px;">
                            <button type="submit" class="btn btn-default" style="background-color: #f44937; color: white; margin-top: 10px;">post answer</button>
                        </form>
                    </div>


                </div>
            </div>

        </div>
        <br><hr class="style-one"><br>
        <h3>ANSWERS</h3>
        <div id="wrap-answers">
            {foreach $respostas as $resposta}
                <div class="row">
                    <div class="col-md-2">
                        <img class="avatar" src="../../images/assets/default.png" width="100" height="100"><br>
                        {$resposta.username}<br>
                        <div class="perg-data">{$resposta.created_date}</div>
                    </div>
                    <div class="col-md-10">

                        <div class="perg-conteudo">
                            {$resposta.conteudo}
                        </div>
                        <br>
                        <script>
                            document.write(checkNull({$resposta.average}));
                        </script>

                            {if not ($USERNAME eq $resposta.username)}
                            <br><a style="padding-top: 30px; margin-top: 20px">RATE ME</a><br>
                            {/if}
                            <br>
                            <form method="POST" action="{$BASE_URL}actions/perguntas/create_comentario_resposta.php" enctype="multipart/form-data">
                                <input type="text" style="display: none" name="resposta_id" value="{$resposta.resposta_id}">
                                <input type="text" name="conteudo" placeholder="my comment" style="width: 100%; margin-top: 10px; border-style: none; height: 50px;">
                                <button type="submit" class="perg-comment btn2_2" style="background: none; border: none; color: #e94735; margin-top: 10px">COMMENT</button>
                            </form>

                        {foreach $resposta.comentarios as $comentario}
                            <div class="row" style="margin-top: 20px; padding-top: 5px; margin-left: 3px; margin-right: 5px;background-color: #ecf0f1; min-height: 85px">
                                <div >
                                    <div class="col-md-1">
                                        <img class="avatar" src="">
                                    </div>
                                    <div class="col-md-9" style="padding-left: 20px">
                                        <b>{$comentario.username}</b><br>
                                        {$comentario.conteudo}
                                    </div>
                                    <div class="col-md-2">
                                        {$comentario.created_date}
                                    </div>
                                </div>
                            </div>

                            <script>
                                myFunction();
                            </script>
                        {/foreach}
                    </div>
                </div>
                <hr>

            {/foreach}


        </div>


    </div>

    <script>
        (function ($) {

            $.fn.rating = function () {

                var element;

                // A private function to highlight a star corresponding to a given value
                function _paintValue(ratingInput, value) {
                    var selectedStar = $(ratingInput).find('[data-value=' + value + ']');
                    selectedStar.removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                    selectedStar.prevAll('[data-value]').removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                    selectedStar.nextAll('[data-value]').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }

                // A private function to remove the selected rating
                function _clearValue(ratingInput) {
                    var self = $(ratingInput);
                    self.find('[data-value]').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                    self.find('.rating-clear').hide();
                    self.find('input').val('').trigger('change');
                }

                // Iterate and transform all selected inputs
                for (element = this.length - 1; element >= 0; element--) {

                    var el, i, ratingInputs,
                            originalInput = $(this[element]),
                            max = originalInput.data('max') || 5,
                            min = originalInput.data('min') || 0,
                            clearable = originalInput.data('clearable') || null,
                            stars = '';

                    // HTML element construction
                    for (i = min; i <= max; i++) {
                        // Create <max> empty stars
                        stars += ['<span class="glyphicon glyphicon-star-empty" data-value="', i, '"></span>'].join('');
                    }
                    // Add a clear link if clearable option is set
                    if (clearable) {
                        stars += [
                            ' <a class="rating-clear" style="display:none;" href="javascript:void">',
                            '<span class="glyphicon glyphicon-remove"></span> ',
                            clearable,
                            '</a>'].join('');
                    }

                    el = [
                        // Rating widget is wrapped inside a div
                        '<div class="rating-input">',
                        stars,
                        // Value will be hold in a hidden input with same name and id than original input so the form will still work
                        '<input type="hidden" name="',
                        originalInput.attr('name'),
                        '" value="',
                        originalInput.val(),
                        '" id="',
                        originalInput.attr('id'),
                        '" />',
                        '</div>'].join('');

                    // Replace original inputs HTML with the new one
                    originalInput.replaceWith(el);

                }

                // Give live to the newly generated widgets
                $('.rating-input')
                // Highlight stars on hovering
                        .on('mouseenter', '[data-value]', function () {
                            var self = $(this);
                            _paintValue(self.closest('.rating-input'), self.data('value'));
                        })
                        // View current value while mouse is out
                        .on('mouseleave', '[data-value]', function () {
                            var self = $(this);
                            var val = self.siblings('input').val();
                            if (val) {
                                _paintValue(self.closest('.rating-input'), val);
                            } else {
                                _clearValue(self.closest('.rating-input'));
                            }
                        })
                        // Set the selected value to the hidden field
                        .on('click', '[data-value]', function (e) {
                            var self = $(this);
                            var val = self.data('value');
                            self.siblings('input').val(val).trigger('change');
                            self.siblings('.rating-clear').show();
                            e.preventDefault();
                            false
                        })
                        // Remove value on clear
                        .on('click', '.rating-clear', function (e) {
                            _clearValue($(this).closest('.rating-input'));
                            e.preventDefault();
                            false
                        })
                        // Initialize view with default value
                        .each(function () {
                            var val = $(this).find('input').val();
                            if (val) {
                                _paintValue(this, val);
                                $(this).find('.rating-clear').show();
                            }
                        });

            };

            // Auto apply conversion of number fields with class 'rating' into rating-fields
            $(function () {
                if ($('input.rating[type=number]').length > 0) {
                    $('input.rating[type=number]').rating();
                }
            });

        }(jQuery));
    </script>
</div>


{include file='common/footer.tpl'}