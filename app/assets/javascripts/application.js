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

  $('#editConfirm').click(function(){
    getValue();
    $('.form_list').show();
    $('.confirm_list').hide();
  });

  $('#sendConfirm').click(function(){
    getValue();
    $('.confirm_list').show();
    $('.form_list').hide();
  });

  function getValue() {
    $('#confirmName').text($('#reservation_guest_name').val());
    $('#confirmMail').text($('#reservation_guest_mail').val());
    $('#confirmPhone').text($('#reservation_guest_phone').val());
    $('#confirmNote').text($('#reservation_stay_note').val());
    $('#confirmRoom').html($('#inputRoom'));
    $('#confirmRoomType').html($('#inputRoomType'));
    $('#confirmInDate').text($('#reservation_check_in_date').val());
    $('#confirmOutDate').text($('#reservation_check_out_date').val());
    $('#confirmStayCount').html($('#inputstaycount'));
    $('#confirmGuestCount').html($('#inputguestcount'));
    $('#confirmStayAmount').html($('#inputstayamount'));
  }

//Date Validates


  $('#checkin').blur(function() {
    var checkin = $('#checkin').val();
    if (checkin != ''){
      if (new Date(checkin) <= new Date().setHours(0)){
        alert('今日より前の日付は選択できません');
        setTimeout(function() {
            $('#checkin').focus();
            $('#checkin').select();
        }, 1);
      }
    }
  });

  $('#checkout').blur(function() {
    var checkin = $('#checkin').val();
    var checkout = $('#checkout').val();
    if (checkout != ''){
      if (new Date(checkout) <= new Date(checkin)){
        alert('チェックイン日より前の日付は選択できません');
        setTimeout(function() {
            $('#checkout').focus();
            $('#checkout').select();
        }, 1);
      }
    }
  });

  var id = $('#room-id').data('room-id');
  //Room rate Calculator

  $('#calc').on('click', function(){
      $.ajax({
          url: '/rooms/' + id + '/calc',
          type: 'POST',
          data:{
            guestcount: $('#guest_count').val(),
            checkin: $('#checkin').val(),
            checkout: $('#checkout').val()
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
