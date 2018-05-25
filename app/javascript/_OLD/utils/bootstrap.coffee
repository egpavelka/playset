import $ from 'jquery'
import 'jquery-match-height'
import 'bootstrap'

# Show/hide submit forms
toggleSubmit = (active, inactive) ->
  $(".#{active}-form").show()
  $("#submit-#{active}").addClass('active')
  $(".#{inactive}-form").hide()
  $("#submit-#{inactive}").removeClass('active')

submitEmbedded = () ->
  toggleSubmit('embedded', 'upload')

submitUpload = () ->
  toggleSubmit('upload', 'embedded')

$ ->
  # Set up bootstrap menu actions
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $('.dropdown-toggle').dropdown()
  # and adjust all tracks to same height
  $('.track-overlay').matchHeight()
  # submit forms
  $("#submit-embedded").click(submitEmbedded)
  $("#submit-upload").click(submitUpload)
