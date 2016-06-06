
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
            console.log(originalInput);

            // HTML element construction
            for (i = min; i <= max; i++) {
                // Create <max> empty stars
                stars += ['<span class="glyphicon glyphicon-star-empty" data-value="', i,'" data-id="',
                    originalInput.data('id'),
                    '" data-user_id="',
                    originalInput.data('user_id'),
                    '" data-case="',
                    originalInput.data('case'), ,'"></span>'].join('');
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
                '" data-id="',
                originalInput.data('id'),
                '" data-user_id="',
                originalInput.data('user_id'),
                '" data-case="',
                originalInput.data('case'),
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
                console.log(BASE_URL);
                if(self.data('case') == 0) {
                    votoPergunta(self.data('user_id'),self.data('id'),self.data('value'));
                }
                else if(self.data('case') == 1){

                }

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


function votoPergunta(userid,perguntaid,valor) {
    console.log(userid + " " + perguntaid + " " + valor);
    $.getJSON(BASE_URL + "api/votes/votePergunta.php", {user_id: userid,pergunta_id: perguntaid, valor: valor}, null);

}

function votoResposta(userid,perguntaid,valor) {
    $.getJSON(BASE_URL + "api/votes/votePergunta.php", {user_id: userid,pergunta_id: perguntaid, valor: valor}, null);

}