function ready() {

    var click = $('.click');

    click.click(function (){

        var value = $(this).html();

        if (value == 'CLR') {
            clear_display();
        } else {
            insert_number(value);
        }

    });

    click.attr('unselectable','on').css({
        //'-moz-user-select':'-moz-none',
        '-moz-user-select':'none',
        '-o-user-select':'none',
        '-khtml-user-select':'none', /* you could also put this in a class */
        '-webkit-user-select':'none',/* and add the CSS class here instead */
        '-ms-user-select':'none',
        'user-select':'none'
    }).bind('selectstart', function(){ return false; });
}

function insert_number(number) {
    var display = $('#display');
    var pin     = $('#pin');

    pin.val(pin.val() + number);
    display.html(display.html() + '*');
}

function clear_display() {
    $('#pin').val('');
    $('#display').html('#:');
}

$(document).on("ready page:load", ready);
//$(document).ready(ready);
//$(document).on('page:load', ready);



