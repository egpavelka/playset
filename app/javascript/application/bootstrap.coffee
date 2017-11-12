import $ from 'jquery'
import 'jquery-match-height'
# import 'popper'

$ ->
  # $("a[rel~=popover], .has-popover").popover()
  # $("a[rel~=tooltip], .has-tooltip").tooltip()
  # $('.dropdown-toggle').dropdown()
  $('.track-overlay').matchHeight()

console.log 'loading'
