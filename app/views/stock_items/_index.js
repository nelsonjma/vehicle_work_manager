$(document).ready(function() {

    // substituido pelo remote: true no link do table > th
    //$(document).on('click', '#stock_items_thead tr th a, #stock_items .pagination a', function(){
    $(document).on('click', '#stock_items .pagination a', function(){
        $.getScript(this.href);
        return false;
    });

    $("#stock_items_search").find("input").keyup(function() {
        var stock_items_search = $("#stock_items_search")

        $.get(stock_items_search.attr("action"), stock_items_search.serialize(), null, "script");
        return false;
    });
});