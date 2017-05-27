$(document).ready(function() {
  $('#b_hotel_creation').on('click', function(e){
    if ($('#hotel_images_attributes_0_photos').val() == '') { 
      e.preventDefault();
      if ($('.notice').is(':empty')){
        $('<p>Select at least one photo</p>').appendTo('.notice');
      }
    }     
  });
})
