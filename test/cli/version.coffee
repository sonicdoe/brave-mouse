path = require 'path'

packageVersion = require(path.join __dirname, '..', '..', 'package.json').version

describe 'brave-mouse (CLI)', ->
	describe 'version option', ->
		it 'should output brave-mouse’s version when called with -v', (done) ->
			exec ['-v'], (error, stdout, stderr) ->
				stdout.should.include 'v' + packageVersion
				done()

		it 'should exit with an exit code of 0 when called with -v', (done) ->
			exec ['-v'], (error, stdout, stderr) ->
				should.not.exist error
				done()

		it 'should output brave-mouse’s version when called with --version', (done) ->
			exec ['--version'], (error, stdout, stderr) ->
				stdout.should.include 'v' + packageVersion
				done()

		it 'should exit with an exit code of 0 when called with --version', (done) ->
			exec ['--version'], (error, stdout, stderr) ->
				should.not.exist error
				done()
