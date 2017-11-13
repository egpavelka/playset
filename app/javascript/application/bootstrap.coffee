import $ from 'jquery'
import 'jquery-match-height'
import 'bootstrap'

# Set up bootstrap menu actions
# and adjust all tracks to same height
$ ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $('.dropdown-toggle').dropdown()
  $('.track-overlay').matchHeight()

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
    $("#submit-embedded").click(submitEmbedded)
    $("#submit-upload").click(submitUpload)

  # # Show/hide submit forms
  # toggleSubmit = (active, inactive) ->
  #   console.log("##{active}-form")
  #   $("##{active}-form").show()
  #   $("#submit-#{active}").addClass('active')
  #   $("##{inactive}-form").hide()
  #   $("#submit-#{inactive}").removeClass('active')
  #
  # $ ->
  #   $("#submit-embedded").click(toggleSubmit('embedded', 'upload'))
  #   $("#submit-upload").click(toggleSubmit('upload', 'embedded'))
