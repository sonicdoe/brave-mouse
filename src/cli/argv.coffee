async = require 'async'
parser = require 'nomnom'

braveMouse = require '../brave-mouse'
braveMousePackageJson = require '../../package.json'

module.exports = (argv) ->
	opts = parser
	.script 'brave-mouse'
	.options
		path:
			position: 0
			help: 'Files to validate against your .editorconfig.'
			list: true
		help:
			abbr: 'h'
			flag: true
			help: 'Print this help message'
		version:
			abbr: 'v'
			flag: true
			help: 'Print brave-mouse’s version'
	.parse argv.slice 2

	# Even though nomnom calls process.exit(), execution may continue because
	# exit waits for stdio to drain. See https://github.com/joyent/node/issues/3584.
	if process.argv.indexOf('-h') isnt -1 or process.argv.indexOf('--help') isnt -1
		return

	if opts.version
		return console.log 'v' + braveMousePackageJson.version

	if opts.path
		exitCode = 0

		async.each opts.path, (filePath, callback) ->
			braveMouse.validate filePath, (err, results) ->
				return callback err if err

				if results is true
					console.log "✔ #{filePath}"
					callback()
				else
					console.log "✘ #{filePath}"

					for property, result of results
						console.log "  expected #{property} to be #{result.expected} but is #{result.is}"

					exitCode = 2

					callback()
		, (err) ->
			if err
				console.error err
				exit 1
			else
				exit exitCode

exit = (code = 0) ->
	if process.platform is 'win32'
		require('exit') code
	else
		process.exit code
