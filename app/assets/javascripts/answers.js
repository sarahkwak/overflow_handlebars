$(document).ready(function(){
  $('.new_answer').on('submit', function(event){
    event.preventDefault();
    var request = $.ajax({
      type: 'Post',
      url: $(this).attr('action'),
      dataType: 'JSON',
      data: $('.new_answer').serialize()
    });

    request.done(function(response){
      debugger;
      var raw_template = $('#entry-template').html();
      var template = Handlebars.compile(raw_template);
      var placeHolder = $('.answer_list')
     placeHolder.append(template(response))
    });
  })
})
