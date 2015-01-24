fs = require 'fs'

editorconfig = require 'editorconfig'
detectIndent = require 'detect-indent'

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

			results = true if Object.keys(results).length is 0

			callback null, results
	.catch (err) ->
		return callback err
