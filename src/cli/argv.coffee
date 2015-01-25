parser = require 'nomnom'

braveMouse = require '../brave-mouse'
braveMousePackageJson = require '../../package.json'

module.exports = (argv) ->
	opts = parser
	.script 'brave-mouse'
	.options
		version:
			abbr: 'v'
			flag: true
			help: 'Print brave-mouse’s version'
	.parse argv.slice 2

	if opts.version
		return console.log 'v' + braveMousePackageJson.version
