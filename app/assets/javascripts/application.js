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
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require turbolinks
//= require_tree .

$(function(){

// Step Form

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
  }

  // Pick Date (Toggle Version)

  var flag = 0;
  $('#calendar-area').on('click','.datebox',function(){
    var pickdate = $(this).data('date');
    var checkin = $('#checkin').val();

    if (flag == 0) {
      if (new Date(pickdate) < new Date().setHours(0)){
        alert('今日より以前は選択できません');
      } else {
        $('td').removeClass('datein');
        $('td').removeClass('dateout');
        $('td').removeClass('duration');
        $('td > p').empty();
        $(this).addClass('datein');
        $('.datein > p').text('CheckIn');
        $('#checkin').val(pickdate);
        $('#indate_display').text(pickdate);
        flag = 1;
        return;
      }
    } else if (flag == 1) {
      if (new Date(pickdate) <= new Date(checkin)) {
        alert('その日は選択できません');
      } else {
        $(this).addClass('dateout');
        $('.dateout > p').text('CheckOut');
        $('#checkout').val(pickdate);
        $('#outdate_display').text(pickdate);
        var checkout = $('#checkout').val();
        var datein = new Date(checkin);
        var dateout = new Date(checkout);
        var diff = Math.ceil((dateout - datein) / 86400000) - 1;
        for (var i = 0; i < diff; ++i) {
          datein.setDate(datein.getDate() + 1);
          var y = datein.getFullYear();
          var m = ("00" + (datein.getMonth()+1)).slice(-2);
          var d = ("00" + datein.getDate()).slice(-2);
          var ymd = y + "-" + m + "-" + d;
          $("td[data-date='"+ ymd +"']").addClass('duration');
          console.log(ymd);
        }
        flag = 0;
        return;
      }
    }

  });

  $('#clr').click(function(){
    $('td').removeClass('datein');
    $('td').removeClass('dateout');
    $('td').removeClass('duration');
    $('#checkin').val('');
    $('#checkout').val('');
    $('#msg_full').empty();
    $('td > p').empty();
    $('#total').empty();
    flag = 0;
    return;
  });

  //Guestcount Validate

  $('#guestcount').blur(function() {
    var capacity = $('.capacity').text();
    var guestcount = $('#guestcount').val();

    if (guestcount == 0){
        $('#msg_guestcount').text('※人数に0は使用できません');
        setTimeout(function() {
            $('#guestcount').focus();
            $('#guestcount').select();
        }, 1);
     } else if (capacity < guestcount ) {
       $('#msg_guestcount').text('※定員数を超過しています');
       setTimeout(function() {
           $('#guestcount').focus();
           $('#guestcount').select();
       }, 1);
     } else {
       $('#msg_guestcount').empty();
     }
  });


  //Room rate Calculator

  var id = $('#room-id').data('room-id');

  $('#calc').on('click', function(){
      $.ajax({
          url: '/rooms/' + id + '/calc',
          type: 'POST',
          data:{
            guestcount: $('#guestcount').val(),
            checkin: $('#checkin').val(),
            checkout: $('#checkout').val()
          },
      })
      .done(function(data, textStatus, jqXHR){
        if (jqXHR.status === 200) {
          $('#total').html(data);
          $('#msg_full').empty();
        } else if (jqXHR.status === 201) {
          $('#msg_full').text(data);
          $('#total').empty();
        }
      })
      .fail(function(){
        alert('Error!');
      });
  });

  //Calendar -Week Transition-

  $(document).on('click','.prev_weeks', function(event){

    var current = parseInt($(this).parent().parent().attr('data-num'));
    var prev = current - 1;
    var prevstart = $(this).children().val();
    var setnum = $(this).parent().parent().find('input').val();
    var prevcheck = $('div').hasClass('weeks_set_' + prev);

    if (prevcheck) {
        $("div[data-num='"+ current +"']").css('display','none');
        $("div[data-num='"+ prev +"']").css('display','block');
        console.log(current);
        console.log(prev);
        console.log(setnum);
        console.log(prevstart);
        console.log(prevcheck);
    } else {
      $.ajax({
          url: '/rooms/' + id + '/prev',
          type:'POST',
          data:{
            prevstart: $(this).children().val(),
            setnum: $(this).parent().parent().find('input').val()
          },
      })
      .done(function(respose){
        $('#calendar-area').prepend(respose);
        $("div[data-num='"+ current +"']").css('display','none');
        console.log(current);
        console.log(prev);
        console.log(setnum);
        console.log(prevstart);
        console.log(prevcheck);
      })
      .fail(function(){
        alert('error!');
      });
    }

  });

  $(document).on('click','.next_weeks', function(event){
    var current = parseInt($(this).parent().parent().attr('data-num'));
    var next = current + 1;
    var nextstart = $(this).children().val();
    var setnum = $(this).parent().parent().find('input').val();
    var nextcheck = $('div').hasClass('weeks_set_' + next);

    if (nextcheck) {
      $("div[data-num='"+ current +"']").css('display','none');
      $("div[data-num='"+ next +"']").css('display','block');
      console.log(current);
      console.log(next);
      console.log(setnum);
      console.log(nextstart);
      console.log(nextcheck);
    } else {
      $.ajax({
          url: '/rooms/' + id + '/next',
          type:'POST',
          data:{
            nextstart: $(this).children().val(),
            setnum: $(this).parent().parent().find('input').val()
          },
      })
      .done(function(respose){
        $('#calendar-area').prepend(respose);
        $("div[data-num='"+ current +"']").css('display','none');
        console.log(current);
        console.log(next);
        console.log(setnum);
        console.log(nextstart);        
        console.log(nextcheck);
      })
      .fail(function(){
        alert('error!');
      });
    }

  });


  //Reservation Form Validates
  // $('#sendConfirm').prop('disabled', true);

  $.validator.addMethod('phoneJP',
    function(value, element){
      return this.optional(element) || /^\d{11}$|^\d{3}-\d{4}-\d{4}$/.test(value);
    });
  $('#new_reservation').validate({
    rules : {
      'reservation[guest_name]': {
        required: true,
      },
      'reservation[guest_mail]': {
        required: true,
        email: true
      },
      'reservation[guest_phone]': {
        required: true,
        phoneJP: true
      }
    },
    messages: {
      'reservation[guest_name]': {
        required: '*名前を入力してください'
      },
      'reservation[guest_mail]': {
        required: '*メールアドレスを入力してください',
        email: '*正しい形式で入力してください'
      },
      'reservation[guest_phone]': {
        required: '*電話番号を入力してください',
        phoneJP: '*正しい形式で入力してください'
      }
    },
    errorPlacement: function(error, element){
        if(element.attr('name') === 'reservation[guest_name]'){
        error.appendTo($('.msg_guestname'));
      } else if (element.attr('name') === 'reservation[guest_mail]') {
        error.appendTo($('.msg_guestmail'));
      } else {
        error.appendTo($('.msg_guestphone'));
      }
    }
  });



});
