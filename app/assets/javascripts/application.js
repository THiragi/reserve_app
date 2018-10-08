// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(function(){

  var id = $('#room-id').data('room-id');

//Room rate Calculator

  $('#calc').on('click', function(){
      $.ajax({
          url: '/rooms/' + id + '/calc',
          type: 'POST',
          data:{
            guestcount: $('#guest_count').get(0),
          },
      })
      .done(function(data){
        $('#total').html(data);
      })
      .fail(function(){
        alert('error!');
      });
  });

//Calendar -Week Transition-

  $(document).on('click','#prev_weeks', function(event){
      $.ajax({
          url: '/rooms/' + id + '/prev',
          type:'POST',
          data:{
            date: $('#date').val()
          },
      })
      .done(function(respose){
        $('#calendar-area').html(respose);
      })
      .fail(function(){
        alert('error!');
      });
  });

  $(document).on('click','#next_weeks', function(event){
      $.ajax({
          url: '/rooms/' + id + '/next',
          type:'POST',
          data:{
            date: $('#date').val()
          },
      })
      .done(function(respose){
        $('#calendar-area').html(respose);
      })
      .fail(function(){
        alert('error!');
      });
  });

});
