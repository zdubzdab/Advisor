$(document).ready(function() {

/average rate/
  $('#rating').raty({
    path: '/assets/',
    readOnly: true,
    score: function() {
          return $(this).attr("data-score");
    }
  });

/vote/
  $('#star-rating').raty({
    path: '/assets/',
    readOnly: false,
    scoreName: 'raiting[value]',
    hints       : ['bad', 'poor', 'regular', 'good', 'gorgeous']
  });

  $('body').on('click', '#b_rating', function() {
    var score = $('.rating_score :input').val();
    var hotel_id = $('#hotel_id').val();
    var user_id = $('#user_id').val();
    var data = {'rating' : { 'score' : score, 'hotel_id' : hotel_id,
    'user_id' : user_id }};
    $.ajax({
      url: '/ratings',
      type: 'post',
      data: data,
      success: function(data){
        $('#b_rating').hide();
        $('<p>Your vote is accepted</p>').appendTo('.notice');
      },
      error: function(data){
        $('<p>Your vote is not accepted try again later</p>').appendTo('.notice');
      }
    });
  });
});
