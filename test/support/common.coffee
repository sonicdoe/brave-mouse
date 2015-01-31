childProcess = require 'child_process'
path = require 'path'

chai = require 'chai'
global.should = chai.should()

global.exec = (args, options, callback) ->
	if arguments.length is 2
		callback = options
		options = {}

	binPath = path.join __dirname, '..', '..', 'bin', 'brave-mouse'

	childProcess.exec "#{binPath} #{args.join(' ')}", options, callback
