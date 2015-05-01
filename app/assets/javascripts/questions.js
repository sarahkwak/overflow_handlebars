$(document).ready(function(){
  $(".question_form").on("submit", function(event){
    event.preventDefault();
    // debugger
    var request = $.ajax({
      url: '/questions',
      type: 'POST',
      data: $('.new_question').serialize(),
      dataType: 'JSON'
    });
    request.done(function(response){
      console.log(response)
     var raw_template = $('#entry-template').html();
     var template = Handlebars.compile(raw_template);
     var placeHolder = $('.question_list')
     placeHolder.append(template(response))
    });
    request.fail(function(response){
      alert("AJAX FAILED")
    });
  });

//   $(document).on("submit", "delete_btn", function(event){
//     event.preventDefault();
//     var request = $.ajax({
//       type: "",
//       url:
//     })
//   } )
});

