
$(function(){

  $('#pic1').mouseover(function(){
    $('#img_container').html("<img src=\"assets/avatar16.png\" \/>");
  });
  $('#pic2').mouseover(function(){
    $('#img_container').html("<img src=\"assets/avatar18.png\" \/>");
  });
  $('#pic3').mouseover(function(){
    $('#img_container').html("<img src=\"assets/avatar19.png\" \/>");
  });
  // $('#img_container').on('click', function(){
    
  // });

  $( "#service" ).selectmenu();
  $( "#datepicker" ).datepicker();

})