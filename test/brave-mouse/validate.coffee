bmValidate = require '../../lib/brave-mouse/validate'

mockFs = require 'mock-fs'

prepareFs = (ecProperty, ecValue, file) ->
	mockFs
		'.editorconfig': "[*]\n#{ecProperty}=#{ecValue}"
		'file.txt': fixtures[file]

describe 'brave-mouse (programmatically)', ->
	describe 'validate', ->
		describe 'properties', ->
			describe 'indent_style', ->
				after ->
					mockFs.restore()

				it 'should validate if file uses tabs but spaces are expected', (done) ->
					prepareFs 'indent_style', 'space', 'indent_style/tabs.txt'

					bmValidate 'file.txt', (err, results) ->
						results.indent_style.should.deep.equal
							expected: 'space'
							is: 'tab'

						done()

				it 'should validate if file uses spaces but tabs are expected', (done) ->
					prepareFs 'indent_style', 'tab', 'indent_style/spaces.txt'

					bmValidate 'file.txt', (err, results) ->
						results.indent_style.should.deep.equal
							expected: 'tab'
							is: 'space'

						done()

				it 'should validate if file uses tabs and tabs are expected', (done) ->
					prepareFs 'indent_style', 'tab', 'indent_style/tabs.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses spaces and spaces are expected', (done) ->
					prepareFs 'indent_style', 'space', 'indent_style/spaces.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses no indentation and tabs are expected', (done) ->
					prepareFs 'indent_style', 'tab', 'indent_style/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses no indentation and spaces are expected', (done) ->
					prepareFs 'indent_style', 'tab', 'indent_style/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should not validate if nothing is expected', (done) ->
					prepareFs null, null, 'indent_style/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()
