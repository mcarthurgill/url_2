$(document).ready(function() {
  $('.yeah_you').on('submit', function(e){
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/urls',
      data: {original_url: $('.yeah_you input').val()}
    }).done(function(message){
      console.log(message);
      $('#links').html(message);
    });
  });
});
