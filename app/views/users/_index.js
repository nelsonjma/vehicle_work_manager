
var ready = function() {
    $(document).on('click', '#users .pagination a', function(){
        $.getScript(this.href);
        return false;
    });

    $("#users_search").find("input").keyup(function() {
        var users_search = $("#users_search");

        $.get(users_search.attr("action"), users_search.serialize(), null, "script");
        return false;
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);