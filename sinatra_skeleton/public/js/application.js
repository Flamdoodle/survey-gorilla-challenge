$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var choice_counter = 1;
  $('#add_choice').on('click', function(e){

    e.preventDefault();
    choice_counter += 1;
    console.log(choice_counter);
    var html_code = "<br>choice: <input name='choice" + choice_counter + "'></input>"
    $('#choices').append(html_code);
    // console.log(hidden);
    // console.log(info);

  }) //ending add choice button


  $('#question_form').submit(function(e) {
    e.preventDefault();
    // console.log(this.choice1);
    var user_input = $(this).serialize();
    console.log(user_input)
    var hidden = $('#hidden_id').text();
    console.log(hidden);

    $.ajax({
      url: '/survey/'+hidden+'/questions/',
      type: 'POST',
      data: user_input
    }).success(function(response){
      console.log('yay')
    })
  })


  // $('#next_question').on('click', function(e) {
  //   e.preventDefault();
  //   var hidden = $('#hidden_id').val();
  //   var info = $('form').serialize();
  //   console.log(info)
  //   $.ajax({
  //         url: '/survey/'+hidden+'/questions/',
  //         type: 'POST',
  //         data: info
  //       }).success(function(response){
  //         console.log('yay')
  //       })
  // }) //ending submit

}); //ending document load
