(function($) {
    "use strict"

    $('.content-body').css({'height':(($(window).height() - 65))+'px'});
    $(window).resize(function(){
        $('.content-body').css({'height':(($(window).height() - 65))+'px'});
    });
})(jQuery);