# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  $ ->
    $(document).on 'ajax:complete', "#prev_weeks", (event) ->
        response = event.detail[0].response
        $('#calendar-area').html(response)

  $ ->
    $(document).on 'ajax:complete', "#next_weeks", (event) ->
        response = event.detail[0].response
        $('#calendar-area').html(response)
