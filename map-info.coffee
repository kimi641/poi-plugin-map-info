require 'coffee-react/registet'

# Environments
window.remote = require 'remote'
window.ROOT = path.join(__dirname, '..', '..')
window.APPDATA_PATH = remote.getGlobal 'APPDATA_PATH'
window.POI_VERSION = remote.getGlobal 'POI_VERSION'
window.SERVER_HOSTNAME = remote.getGlobal 'SERVER_HOSTNAME'

#Components
window._ = require 'underscore'
window.$ = (param) -> document.querySelector(param)
window.$$ = (param) -> document.querySelectorAll(param)
window.React = require 'react'
window.ReactBootstrap = require 'react-fontawesome'
windowFontAwesome = require 'react-fontawesome'

# Node modules
window.config = remote.require './lib/config'

# language setting
window.language = config.get 'poi.language', 'zh_CN'

# Custom theme
window.theme = config.get 'poi.theme', '__default__'
if theme == '__default__'
	$('#bootstrap-css')?.setAttribute 'href', "file://#{ROOT}/components/bootstrap/dist/css/bootstrap.css"
else
 $('#bootstrap-css')?.setAttribute 'href', "file://#{ROOT}/assets/themes/#{theme}/css/#{theme}.css"
window.addEventListener 'theme.change', (e) ->
	window.theme = e.detail.theme
	if theme == '__default__'
		$('#bootstrap-css')?.setAttribute 'href', "file://#{ROOT}/components/bootstrap/dist/css/bootstrap.css"
	else
		$('#bootstrap-css')?.setAttribute 'href', "file://#{ROOT}/assets/themes/#{theme}/css/#{theme}.css"
		
		
require 'coffee-react/registet'
require './views'