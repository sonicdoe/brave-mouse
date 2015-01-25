parser = require 'nomnom'

braveMouse = require '../brave-mouse'
braveMousePackageJson = require '../../package.json'

module.exports = (argv) ->
	opts = parser
	.script 'brave-mouse'
	.options
		help:
			abbr: 'h'
			flag: true
			help: 'Print this help message'
		version:
			abbr: 'v'
			flag: true
			help: 'Print brave-mouse’s version'
	.parse argv.slice 2

	if opts.version
		return console.log 'v' + braveMousePackageJson.version
