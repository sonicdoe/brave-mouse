fs = require 'fs'

editorconfig = require 'editorconfig'
detectIndent = require 'detect-indent'
detectNewline = require 'detect-newline'
detectCharset = require 'detect-charset'
detectTrailingWhitespace = require 'detect-trailing-whitespace'

module.exports = (filePath, callback) ->
	editorconfig.parse(filePath)
	.then (editorconfigProperties) ->
		results = {}

		fs.readFile filePath, (err, rawFileContents) ->
			return callback err if err

			fileContents = rawFileContents.toString()

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

			if editorconfigProperties.charset
				charset = detectCharset rawFileContents

				if charset isnt editorconfigProperties.charset and
				# As ISO-8859-1 is mostly a subset of UTF-8, we treat ISO-8859-1 as
				# valid if the .editorconfig specifies UTF-8.
				!(charset is 'latin1' and editorconfigProperties.charset is 'utf-8')
					results.charset =
						expected: editorconfigProperties.charset
						is: charset

			if editorconfigProperties.trim_trailing_whitespace
				hasTrailingWhitespace = detectTrailingWhitespace fileContents

				if hasTrailingWhitespace isnt !editorconfigProperties.trim_trailing_whitespace
					results.trim_trailing_whitespace =
						expected: editorconfigProperties.trim_trailing_whitespace
						is: !hasTrailingWhitespace

			results = true if Object.keys(results).length is 0

			callback null, results
	.catch (err) ->
		return callback err
