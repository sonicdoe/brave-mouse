exec = require('child_process').exec

describe 'brave-mouse (CLI)', ->
	describe 'help option', ->
		it 'should output usage information when called with -h', (done) ->
			exec bin + ' -h', (error, stdout, stderr) ->
				stdout.should.include 'Usage: brave-mouse'
				done()

		it 'should output usage information when called with --help', (done) ->
			exec bin + ' --help', (error, stdout, stderr) ->
				stdout.should.include 'Usage: brave-mouse'
				done()
