fs = require 'fs'

editorconfig = require 'editorconfig'
detectIndent = require 'detect-indent'

module.exports = (filePath, callback) ->
	editorconfig.parse(filePath)
	.then (editorconfigProperties) ->
		results = {}

		fs.readFile filePath, 'utf8', (err, fileContents) ->
			return callback err if err

			if editorconfigProperties.indent_style
				indentStyle = detectIndent(fileContents).type

				if indentStyle isnt editorconfigProperties.indent_style and indentStyle
					results.indent_style =
						expected: editorconfigProperties.indent_style
						is: indentStyle

			results = true if Object.keys(results).length is 0

			callback null, results
	.catch (err) ->
		return callback err
