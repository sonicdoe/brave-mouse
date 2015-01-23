fs = require 'fs'

readFixture = (fixture) ->
	fs.readFileSync "#{__dirname}/../fixtures/#{fixture}", 'utf8'

global.fixtures =
	'indent_style/tabs.txt': readFixture 'indent_style/tabs.txt'
	'indent_style/spaces.txt': readFixture 'indent_style/spaces.txt'
	'indent_style/none.txt': readFixture 'indent_style/none.txt'
