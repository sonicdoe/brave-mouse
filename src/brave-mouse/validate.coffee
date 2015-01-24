fs = require 'fs'

editorconfig = require 'editorconfig'
detectIndent = require 'detect-indent'
detectNewline = require 'detect-newline'

module.exports = (filePath, callback) ->
	editorconfig.parse(filePath)
	.then (editorconfigProperties) ->
		results = {}

		fs.readFile filePath, 'utf8', (err, fileContents) ->
			return callback err if err

			if editorconfigProperties.indent_style or editorconfigProperties.indent_size
				indentation = detectIndent fileContents
				indentation.amount = 'tab' if indentation.type is 'tab'

				if editorconfigProperties.indent_style and
				indentation.type isnt editorconfigProperties.indent_style and
				indentation.type
					results.indent_style =
						expected: editorconfigProperties.indent_style
						is: indentation.type

				if editorconfigProperties.indent_size and
				indentation.amount isnt editorconfigProperties.indent_size and
				indentation.type
					results.indent_size =
						expected: editorconfigProperties.indent_size
						is: indentation.amount

			if editorconfigProperties.end_of_line
				newline = detectNewline fileContents

				newline = 'lf' if newline is '\n'
				newline = 'crlf' if newline is '\r\n'

				if newline isnt editorconfigProperties.end_of_line and
				newline
					results.end_of_line =
						expected: editorconfigProperties.end_of_line
						is: newline

			results = true if Object.keys(results).length is 0

			callback null, results
	.catch (err) ->
		return callback err
