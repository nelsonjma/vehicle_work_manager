var ready = function() {
    $("#stock_item_selectors_search").find("input").keyup(function(){
        var stock_item_selectors_search = $("#stock_item_selectors_search");
        $.get(stock_item_selectors_search.attr("action"), stock_item_selectors_search.serialize(), null, "script");
        return false;
    });

    $("#search_submit_tag").on('click', function(e){
        var stock_item_selectors_search = $("#stock_item_selectors_search");
        $.get(stock_item_selectors_search.attr("action"), stock_item_selectors_search.serialize(), null, "script");
        e.preventDefault();
        return false;
    });

    $('#stock_item_selectors').on('click', '.stock_item_selector_button', function(e) {
        setStockItemId(this);
        setStockItemName(this);
        e.preventDefault();
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);

function setStockItemId(button) {
    $('#task_item_stock_item_id').val($(button).attr('id'));
}

function setStockItemName(button) {
    var parentTr = $(button).parent().parent().get(0); // get parent TR element
    var nameTd = $(parentTr).children('td').get(2); // get position 2 td
    $('#stock_item_name').val($(nameTd).html()); // show value in text box
}