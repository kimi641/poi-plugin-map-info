{React, ReactBootstrap, FontAwesome} = window
{Button} = ReactBootstrap
remote = require 'remote'
windowManager = remote.require './lib/window'

i18n = require './node_modules/i18n'
path = require 'path-extra'
{__} = i18n

i18n.configure
  locales: ['en_US', 'ja_JP', 'zh_CN', 'zh_TW']
  defaultLocale: 'zh_CN'
  directory: path.join(__dirname, 'i18n')
  updateFiles: false
  indent: '\t'
  extension: '.json'
i18n.setLocale(window.language)

window.mapInfoWindow = null
initialMapInofWindow = ->
	window.mapInfoWindow = windowManager.createWindow
		#configure
		x: config.get 'poi.window.x', 0
		y: config.get 'poi.window.y', 0
		width: 820
		height: 650
	window.mapInfoWindow.loadUrl "file://#{__dirname}/index.html"
if config.get('plugin.ShipInfo.enable', true)
	initialMapInofWindow()
	
module.exports = 
	name: 'MapInfo'
	displayName: __ 'Map Info'
	author: 'Lukeliu'
	version: '0.1.0'
	description: __ 'Show map Info'
	handleClick: ->
		window.mapInfoWindow.show()