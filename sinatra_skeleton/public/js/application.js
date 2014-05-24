$(document).ready(function() {
    var choice_counter = 1;
    $('#add_choice').on('click', function(e){

        e.preventDefault();
        choice_counter += 1;
        console.log(choice_counter);
        var html_code = "<br><span>choice: <input name='choice" + choice_counter + "'></input></span>"
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
});

var renderNewQuestionForm = function() {
    $('#choices span:nth-child(n+4)').remove();
    clearFormElements()
};

var clearFormElements = function() {
    $('input[type=text]').each(function() {
        $(this).val('');
    });
}

