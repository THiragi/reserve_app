# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#prev_weeks')
    .on 'ajax:complete', (event) ->
      response = event.detail[0].response
      $('#calendar-area').html(response)

$ ->
  $('#next_weeks')
    .on 'ajax:complete', (event) ->
      response = event.detail[0].response
      $('#calendar-area').html(response)
