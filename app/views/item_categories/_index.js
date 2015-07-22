
var ready = function() {

    $(document).on('click', '#item_categories .pagination a', function(){
        $.getScript(this.href);
        return false;
    });

    $("#item_categories_search").find("input").keyup(function() {
        var item_categories_search = $("#item_categories_search");

        $.get(item_categories_search.attr("action"), item_categories_search.serialize(), null, "script");
        return false;
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);