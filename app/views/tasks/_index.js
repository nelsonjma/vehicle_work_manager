
var ready = function() {

    // substituido pelo remote: true no link do table > th
    $(document).on('click', '#tasks', function(){
        $.getScript(this.href);
        return false;
    });

    $("#tasks_search").find("input").keyup(function() {
        var tasks_search = $("#tasks_search");

        $.get(tasks_search.attr("action"), tasks_search.serialize(), null, "script");
        return false;
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);