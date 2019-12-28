let clone_sort_choice_block = $('.sort_choice_block');
let clone_condition_choice_block = $('.condition_choice_block');

$('#apply_button').on("click", function(){
    let methods = $('.sort_method');
    let directions = $('.sort_direction');
    let condition_methods = $('.condition_method');
    let condition_conditions = $('.condition_condition');
    let condition_data = $('.input-data');
    let methods_res = [];
    let directions_res = [];
    let condition_methods_res = [];
    let condition_conditions_res = [];
    let condition_data_res = [];

    methods.each(function (i,v) {
        methods_res.push($(v).val());
    });

    directions.each(function (i,v) {
        directions_res.push($(v).val());
    });

    condition_methods.each(function (i,v) {
        condition_methods_res.push($(v).val());
    });

    condition_conditions.each(function (i,v) {
        condition_conditions_res.push($(v).val());
    });

    condition_data.each(function (i,v) {
        condition_data_res.push($(v).val());
    });

    $.ajax({
        type: "POST",
        data:
            {
                'sort_methods' : JSON.stringify(methods_res),
                'sort_directions' : JSON.stringify(directions_res),
                'condition_methods' : JSON.stringify(condition_methods_res),
                'condition_conditions' : JSON.stringify(condition_conditions_res),
                'condition_data' : JSON.stringify(condition_data_res),
            },
        success: onAjaxSuccess
    });
    function onAjaxSuccess(data){
        $("#data").empty();
        for (let row in data['res']){
            let html_data = "<div class=\"row mb-3\" style=\"margin: 0\">";
            for(let i=0; i < data['res'][row].length; i++) {
                html_data += "<div class=\"col themed-grid-col\">" + data['res'][row][i] + "</div>";
            }
            html_data += "<a style=\"margin: auto; padding-left: 10px;\" href=\"";
            html_data += "/edit/" + data['table_name'] + "/" + data['res'][row][0];
            html_data += "\">Редактировать</a>";
            $("#data").append(html_data)
        }
    }
});

$('#add_sort').on("click", function(){
    if ($(".sort_choice_block").length >= $('.sort_method:first option').length)
        return false;
    $('#sort_block .buttons').before(clone_sort_choice_block.clone());
});

$('#rem_sort').on("click", function(){
    if ($(".sort_choice_block").length == 1)
        return false;
    $('.sort_choice_block:last').remove();
});

$('#add_cond').on("click", function(){
    if ($(".condition_choice_block").length >= 8)
        return false;
    $('#condition_block .buttons').before(clone_condition_choice_block.clone());
});

$('#rem_cond').on("click", function(){
    if ($(".condition_choice_block").length == 1)
        return false;
    $('.condition_choice_block:last').remove();
});