// By default, this pack is loaded for server-side rendering.
// It must expose react_ujs as `ReactRailsUJS` and prepare a require context.
//= require ./components
//= require ./application
var componentRequireContext = require.context("components", true)
var applicationRequireContext = require.context("application", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext, applicationRequireContext)
