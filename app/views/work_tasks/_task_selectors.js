var ready = function() {
    $("#task_selectors_search").find("input").keyup(function(){
        var task_selectors_search = $("#task_selectors_search");
        $.get(task_selectors_search.attr("action"), task_selectors_search.serialize(), null, "script");
        return false;
    });

    $("#search_submit_tag").on('click', function(e){
        var task_selectors_search = $("#task_selectors_search");
        $.get(task_selectors_search.attr("action"), task_selectors_search.serialize(), null, "script");
        e.preventDefault();
        return false;
    });

    $('#task_selectors').on('click', '.task_selector_button', function(e) {
        setTaskId(this);
        setTaskName(this);
        e.preventDefault();
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);

function setTaskId(button) {
    $('#work_task_task_id').val($(button).attr('id'));
}

function setTaskName(button) {
    var parentTr = $(button).parent().parent().get(0); // get parent TR element
    var nameTd = $(parentTr).children('td').get(1); // get position 2 td
    $('#task_name').val($(nameTd).html()); // show value in text box
}