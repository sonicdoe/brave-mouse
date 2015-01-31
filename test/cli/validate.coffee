exec = require('child_process').exec

describe 'brave-mouse (CLI)', ->
	describe 'validate', ->
		it 'should validate a single valid file', (done) ->
			exec bin + ' file.txt', cwd: fixtures.cli['validate-valid-file'], (error, stdout, stderr) ->
				should.not.exist error
				stdout.should.include '✔ file.txt'
				stderr.should.be.empty

				done()

		it 'should validate a single invalid file', (done) ->
			exec bin + ' file.txt', cwd: fixtures.cli['validate-invalid-file'], (error, stdout, stderr) ->
				error.code.should.equal 2
				stdout.should.include '✘ file.txt'
				stdout.should.include '  expected indent_style to be tab but is space'
				stdout.should.include '  expected indent_size to be tab but is 2'
				stderr.should.be.empty

				done()

		it 'should validate multiple files', (done) ->
			exec bin + ' a.txt b.txt c.txt d.txt e.txt', cwd: fixtures.cli['validate-multiple-files'], (error, stdout, stderr) ->
				error.code.should.equal 2
				stdout.should.include '✔ a.txt'
				stdout.should.include '✘ b.txt'
				stdout.should.include '  expected indent_style to be tab but is space'
				stdout.should.include '  expected indent_size to be tab but is 2'
				stdout.should.include '✔ c.txt'
				stdout.should.include '✘ d.txt'
				stdout.should.include '  expected indent_size to be 2 but is 4'
				stdout.should.include '✘ e.txt'
				stdout.should.include '  expected indent_style to be space but is tab'
				stdout.should.include '  expected indent_size to be 2 but is tab'
				stderr.should.be.empty

				done()
