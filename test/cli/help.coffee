describe 'brave-mouse (CLI)', ->
	describe 'help option', ->
		it 'should output usage information when called with -h', (done) ->
			exec ['-h'], (error, stdout, stderr) ->
				stdout.should.include 'Usage: brave-mouse'
				done()

		it 'should exit with an exit code of 0 when called with -h', (done) ->
			exec ['-h'], (error, stdout, stderr) ->
				should.not.exist error
				done()

		it 'should output usage information when called with --help', (done) ->
			exec ['--help'], (error, stdout, stderr) ->
				stdout.should.include 'Usage: brave-mouse'
				done()

		it 'should exit with an exit code of 0 when called with --help', (done) ->
			exec ['--help'], (error, stdout, stderr) ->
				should.not.exist error
				done()
