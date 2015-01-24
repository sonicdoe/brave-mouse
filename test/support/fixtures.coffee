fs = require 'fs'

readFixture = (fixture) ->
	fs.readFileSync "#{__dirname}/../fixtures/#{fixture}", 'utf8'

global.fixtures =
	'indent_style/tabs.txt': readFixture 'indent_style/tabs.txt'
	'indent_style/spaces.txt': readFixture 'indent_style/spaces.txt'
	'indent_style/none.txt': readFixture 'indent_style/none.txt'
	'indent_size/tabs.txt': readFixture 'indent_size/tabs.txt'
	'indent_size/2-spaces.txt': readFixture 'indent_size/2-spaces.txt'
	'indent_size/4-spaces.txt': readFixture 'indent_size/4-spaces.txt'
	'indent_size/none.txt': readFixture 'indent_size/none.txt'
	'end_of_line/lf.txt': readFixture 'end_of_line/lf.txt'
	'end_of_line/crlf.txt': readFixture 'end_of_line/crlf.txt'
	'end_of_line/none.txt': readFixture 'end_of_line/none.txt'
