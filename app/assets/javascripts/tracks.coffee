# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 # Switch between link validation and file upload fields based on radio button selection for source type

$ ->
  # set up function to switch between submission types
  select_src_type = (v) ->
    # hide both entry fields
    $('.embedded').hide()
    $('.upload').hide()
    # display field corresponding to checked radio button
    $(".#{v}").show()

  # select initial value on page load
  $('.src_type').ready ->
    v = $('.src_type:checked')[0].value
    select_src_type(v)

  # switch when radio button selection changes
  $('.src_type').change ->
    select_src_type(@value)
