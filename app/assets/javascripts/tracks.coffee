# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 # Switch between link validation and file upload fields based on radio button selection for source type

$ ->

  # on page load, show link submission
  $('#embedded-form').show()
  $('#upload-form').hide()

  # clicking nav buttons toggles between forms
  $('.select-track-type').click ->
    $('#embedded-form').toggle()
    $('#upload-form').toggle()
