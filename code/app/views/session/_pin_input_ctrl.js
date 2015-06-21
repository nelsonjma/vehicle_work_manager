function ready() {

    $('.click').click(function (){

        var value = $(this).html();

        if (value == 'CLR') {
            clear_display();
        } else {
            insert_number(value);
        }

    });
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