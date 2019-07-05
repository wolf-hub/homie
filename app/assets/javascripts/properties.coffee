# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("form#sign_up_user_landlord").bind("ajax:success", (event) ->
    $('.modal').modal('hide')
    jQuery('#new_property').submit()
    console.log(event)
  ).bind("ajax:error", (event) ->
    console.log(event.originalEvent.detail[2].response)
    wolfstring = event.originalEvent.detail[2].response
    console.log(JSON.parse(wolfstring))
    console.log(event)
    wolfstring2 = JSON.parse(wolfstring)
    error_messages = if wolfstring2['error']
      "<div class='alert alert-danger pull-left'>" + wolfstring2['error'] + "</div>"
    else if wolfstring2['errors']
      $.map(wolfstring2["errors"], (v, k) ->
        "<div class='alert alert-danger pull-left'>" + k + " " + v + "</div>"
      ).join ""
    else
      "<div class='alert alert-danger pull-left'>Unknown error</div>"
    $('.modal-footer').html(error_messages)
  )