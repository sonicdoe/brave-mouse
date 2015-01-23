fs = require 'fs'

editorconfig = require 'editorconfig'
detectIndent = require 'detect-indent'

module.exports = (filePath, callback) ->
	editorconfig.parse(filePath)
	.then (editorconfigProperties) ->
		result = {}

		fs.readFile filePath, 'utf8', (err, fileContents) ->
			return callback err if err

			if editorconfigProperties.indent_style
				indentStyle = detectIndent(fileContents).type

				if indentStyle isnt editorconfigProperties.indent_style and indentStyle
					result.indent_style =
						expected: editorconfigProperties.indent_style
						is: indentStyle

			result = true if Object.keys(result).length is 0

			callback null, result
	.catch (err) ->
		return callback err
