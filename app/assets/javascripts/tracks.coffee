# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 # Switch between link validation and file upload fields based on radio button selection for source type

 $ ->

  # ..... EMBED VS. UPLOAD .....
  # set up function to switch between submission types
  select_track_kind = (v) ->
    # hide both entry fields
    $('#upload-form').hide()
    $('#embedded-form').hide()
    # clear metadata/source fields
    $('.response-data').val('')
    # display field corresponding to checked radio button
    $("##{v.toLowerCase()}-form").show()

  # select initial value on page load
  $('.track_kind').ready ->
    v = $('.track_kind:checked')[0].value
    select_track_kind(v)

  # switch when radio button selection changes
  $('.track_kind').change ->
    # switch submission type
    select_track_kind(@value)

  # ..... INLINE VALIDATION .....
  # for embeddeds
  $('.check-embedded-source').click ->
    console.log 'hello'
      # check url type
      # extract track identifier from url to query the appropriate service
      # autopopulate metadata fields if available, disable fields

  # for uploads
  $('.check-upload-source').click ->
      # check file type
      # check for audio metadata
      # autopopulate metadata fields if available, disable fields
