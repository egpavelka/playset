# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 # Switch between link validation and file upload fields based on radio button selection for source type

 $ ->

  # ..... EMBED VS. UPLOAD .....
  # set up function to switch between submission types
  switch_submit_form = (a,i) ->
    $("#submit_#{i}").hide()
    $("#select_#{i}").removeClass('active')
    # clear metadata/source fields
    $(".#{i}-response-data").val('')
    # display field corresponding to checked radio button
    $("#submit_#{a}").show()
    $("#select_#{a}").addClass('active')

  $('#select_upload').click ->
    switch_submit_form('upload', 'url')

  $('#select_url').click ->
    switch_submit_form('url', 'upload')

  # select initial value on page load
  $(document).ready ->
    switch_submit_form('url', 'upload')

  # ..... INLINE VALIDATION .....
  $('#url_source').change ->
    if /youtu/.test @value || /vimeo/.test @value
      document.getElementById('track_playback').value = 'Video'
    else
      document.getElementById('track_playback').value = 'Audio'
