fs = require 'fs'

editorconfig = require 'editorconfig'

module.exports = (filePath, callback) ->
	editorconfig.parse(filePath)
	.then (editorconfigProperties) ->
		result = {}

		fs.readFile filePath, 'utf8', (err, fileContents) ->
			return callback err if err

			result = true if Object.keys(result).length is 0

			callback null, result
	.catch (err) ->
		return callback err
