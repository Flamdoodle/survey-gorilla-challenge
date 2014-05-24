$(document).ready(function() {
    var choice_counter = 1;
    $('#add_choice').on('click', function(e){

        e.preventDefault();
        choice_counter += 1;
        var html_code = "<div><span class='label'>choice</span>: <input name='choice" + choice_counter + "' type='text'></div>"
        $('#choices').append(html_code);

    }) //ending add choice button


    $('#question_form').submit(function(e) {
        e.preventDefault();
        var user_input = $(this).serialize();
        var hidden = $('#hidden_id').text();

        $.ajax({
            url: '/survey/'+hidden+'/questions/',
            type: 'POST',
            data: user_input
      }).success(function(response){
          renderNewQuestionForm();
        })
    })


    $('#login').click(function(e) {
        e.preventDefault;
        $('#hidden_login').slideToggle("fast");
    })

    $('#signup').click(function(e) {
        e.preventDefault;
        $('#hidden_signup').slideToggle("fast");
    })

});

var renderNewQuestionForm = function() {
    $('#choices div:nth-child(n+4)').remove();
    clearFormElements()
};

var clearFormElements = function() {
    $('input[type=text]').each(function() {
        $(this).val('');
    });
}

