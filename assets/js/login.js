$(document).ready(function(){
  $('.signup-btn').click(function(){
    $('.register-form').show('slow');
    $('.secure-login').hide('slow');
    $('body').removeClass().addClass('signup-slide');
  });
  //default dispaly
   $('.signup-btn').trigger('click');
  
  $('.login-btn').click(function(){
    $('.secure-login').show('slow');
    $('.register-form').hide('slow');
    $('body').removeClass().addClass('login-slide');
  });
});
