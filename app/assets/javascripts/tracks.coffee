# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 # Switch between link validation and file upload fields based on radio button selection for source type

 $ ->
   # set up function to switch between submission types
   select_source_kind = (v) ->
     # hide both entry fields
     $('#upload-form').hide()
     $('#embedded-form').hide()
     # clear metadata fields
     $('.response-data').val('')
     # display field corresponding to checked radio button
     $("##{v.toLowerCase()}-form").show()

   # select initial value on page load
   $('.source_kind').ready ->
     v = $('.source_kind:checked')[0].value
     select_source_kind(v)

   # switch when radio button selection changes
   $('.source_kind').change ->
     # switch submission type
     select_source_kind(@value)
