fs = require 'fs'

editorconfig = require 'editorconfig'
detectIndent = require 'detect-indent'
detectNewline = require 'detect-newline'
detectTrailingWhitespace = require 'detect-trailing-whitespace'
detectNewlineAtEof = require 'detect-newline-at-eof'
maxLineLength = require 'max-line-length'

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

			if editorconfigProperties.trim_trailing_whitespace
				hasTrailingWhitespace = detectTrailingWhitespace fileContents

				if hasTrailingWhitespace isnt !editorconfigProperties.trim_trailing_whitespace
					results.trim_trailing_whitespace =
						expected: editorconfigProperties.trim_trailing_whitespace
						is: !hasTrailingWhitespace

			if editorconfigProperties.hasOwnProperty 'insert_final_newline'
				hasFinalNewline = !!detectNewlineAtEof fileContents

				if hasFinalNewline isnt editorconfigProperties.insert_final_newline
					results.insert_final_newline =
						expected: editorconfigProperties.insert_final_newline
						is: hasFinalNewline

			if editorconfigProperties.max_line_length
				maximumLineLength = maxLineLength fileContents

				if maximumLineLength > editorconfigProperties.max_line_length
					results.max_line_length =
						expected: editorconfigProperties.max_line_length
						is: maximumLineLength

			results = true if Object.keys(results).length is 0

			callback null, results
	.catch (err) ->
		return callback err
