parser = require 'nomnom'

braveMouse = require '../brave-mouse'

module.exports = (argv) ->
	parser
	.script 'brave-mouse'
	.parse argv.slice 2
