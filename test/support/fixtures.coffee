fs = require 'fs'
path = require 'path'

readFixture = (fixture) ->
	fs.readFileSync "#{__dirname}/../fixtures/#{fixture}", 'utf8'

resolveFixture = (fixture) ->
	path.resolve "#{__dirname}/../fixtures/#{fixture}"

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
	'trim_trailing_whitespace/space.txt': readFixture 'trim_trailing_whitespace/space.txt'
	'trim_trailing_whitespace/tab.txt': readFixture 'trim_trailing_whitespace/tab.txt'
	'trim_trailing_whitespace/none.txt': readFixture 'trim_trailing_whitespace/none.txt'
	'insert_final_newline/none.txt': readFixture 'insert_final_newline/none.txt'
	'insert_final_newline/newline.txt': readFixture 'insert_final_newline/newline.txt'

global.fixtures.cli =
	'validate-valid-file': resolveFixture 'cli/validate-valid-file'
	'validate-invalid-file': resolveFixture 'cli/validate-invalid-file'
	'validate-multiple-files': resolveFixture 'cli/validate-multiple-files'
