{React, ReactBootstrap} = window
{Panel, Buttonm, Input, Col, Grid, Row, Table} = ReactBootstrap
Divider = require './divider'
path = require 'path-extra'
fs = require "fs-extra"
i18n = require '../node-module/i18n'
{__} = i18n

i18n.confiure({
	locales:['zh_CN'],
	defaultLocale: 'zh_CN'
	directory: path.join{__dirname, '..', 'i18n'},
	updateFiles: false,
	indent: '\t',
	extension: '.json'
})
i18n.setLocale(window.language)

Map = [
  "1-1 鎮守府正面海域", "1-2 南西諸島沖", "1-3 製油所地帯沿岸", "1-4 南西諸島防衛線", "1-5 [Extra] 鎮守府近海", "1-6 [Extra Operation] 鎮守府近海航路",
  "2-1 カムラン半島", "2-2 バシー島沖", "2-3 東部オリョール海", "2-4 沖ノ島海域", "2-5 [Extra] 沖ノ島沖",
  "3-1 モーレイ海", "3-2 キス島沖", "3-3 アルフォンシーノ方面", "3-4 北方海域全域", "3-5 [Extra] 北方AL海域",
  "4-1 ジャム島攻略作戦", "4-2 カレー洋制圧戦", "4-3 リランカ島空襲", "4-4 カスガダマ沖海戦", "4-5 [Extra] カレー洋リランカ島沖",
  "5-1 南方海域前面", "5-2 珊瑚諸島沖", "5-3 サブ島沖海域", "5-4 サーモン海域", "5-5 [Extra] サーモン海域北方",
  "6-1 中部海域哨戒線", "6-2 MS諸島沖", "6-3 グアノ環礁沖海域"
]


MapInfoArea = React.createClass
	getList: (_map) ->
		pp = path.join(__dirname, "..", "data.json")
		db = fs.readJsonSync pp
		rows = []
		for 