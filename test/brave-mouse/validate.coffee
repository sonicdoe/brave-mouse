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

			describe 'indent_size', ->
				after ->
					mockFs.restore()

				it 'should validate if file uses tabs but 2 spaces are expected', (done) ->
					prepareFs 'indent_size', 2, 'indent_size/tabs.txt'

					bmValidate 'file.txt', (err, results) ->
						results.indent_size.should.deep.equal
							expected: 2
							is: 'tab'

						done()

				it 'should validate if file uses tabs but 4 spaces are expected', (done) ->
					prepareFs 'indent_size', 4, 'indent_size/tabs.txt'

					bmValidate 'file.txt', (err, results) ->
						results.indent_size.should.deep.equal
							expected: 4
							is: 'tab'

						done()

				it 'should validate if file uses tabs and tabs are expected', (done) ->
					prepareFs 'indent_size', 'tab', 'indent_size/tabs.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses 2 spaces but tabs are expected', (done) ->
					prepareFs 'indent_size', 'tab', 'indent_size/2-spaces.txt'

					bmValidate 'file.txt', (err, results) ->
						results.indent_size.should.deep.equal
							expected: 'tab'
							is: 2

						done()

				it 'should validate if file uses 2 spaces and 2 spaces are expected', (done) ->
					prepareFs 'indent_size', 2, 'indent_size/2-spaces.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses 2 spaces but 4 spaces are expected', (done) ->
					prepareFs 'indent_size', 4, 'indent_size/2-spaces.txt'

					bmValidate 'file.txt', (err, results) ->
						results.indent_size.should.deep.equal
							expected: 4
							is: 2

						done()

				it 'should validate if file uses 4 spaces but tabs are expected', (done) ->
					prepareFs 'indent_size', 'tab', 'indent_size/4-spaces.txt'

					bmValidate 'file.txt', (err, results) ->
						results.indent_size.should.deep.equal
							expected: 'tab'
							is: 4

						done()

				it 'should validate if file uses 4 spaces but 2 spaces are expected', (done) ->
					prepareFs 'indent_size', 2, 'indent_size/4-spaces.txt'

					bmValidate 'file.txt', (err, results) ->
						results.indent_size.should.deep.equal
							expected: 2
							is: 4

						done()

				it 'should validate if file uses 4 spaces and 4 spaces are expected', (done) ->
					prepareFs 'indent_size', 4, 'indent_size/4-spaces.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses no indentation and tabs are expected', (done) ->
					prepareFs 'indent_size', 'tab', 'indent_size/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses no indentation and 2 spaces are expected', (done) ->
					prepareFs 'indent_size', 2, 'indent_size/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses no indentation and 4 spaces are expected', (done) ->
					prepareFs 'indent_size', 4, 'indent_size/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should not validate if nothing is expected', (done) ->
					prepareFs null, null, 'indent_size/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

			describe 'end_of_line', ->
				after ->
					mockFs.restore()

				it 'should validate if file uses LF but CRLF is expected', (done) ->
					prepareFs 'end_of_line', 'crlf', 'end_of_line/lf.txt'

					bmValidate 'file.txt', (err, results) ->
						results.end_of_line.should.deep.equal
							expected: 'crlf'
							is: 'lf'

						done()

				it 'should validate if file uses LF and LF is expected', (done) ->
					prepareFs 'end_of_line', 'lf', 'end_of_line/lf.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses CRLF but LF is expected', (done) ->
					prepareFs 'end_of_line', 'lf', 'end_of_line/crlf.txt'

					bmValidate 'file.txt', (err, results) ->
						results.end_of_line.should.deep.equal
							expected: 'lf'
							is: 'crlf'

						done()

				it 'should validate if file uses CRLF and CRLF is expected', (done) ->
					prepareFs 'end_of_line', 'crlf', 'end_of_line/crlf.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses no newline character and LF is expected', (done) ->
					prepareFs 'end_of_line', 'lf', 'end_of_line/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file uses no newline character and CRLF is expected', (done) ->
					prepareFs 'end_of_line', 'crlf', 'end_of_line/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should not validate if nothing is expected', (done) ->
					prepareFs null, null, 'end_of_line/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

			describe 'trim_trailing_whitespace', ->
				after ->
					mockFs.restore()

				it 'should validate if file has a trailing space but no trailing whitespace is expected', (done) ->
					prepareFs 'trim_trailing_whitespace', true, 'trim_trailing_whitespace/space.txt'

					bmValidate 'file.txt', (err, results) ->
						results.trim_trailing_whitespace.should.deep.equal
							expected: true
							is: false

						done()

				it 'should validate if file has a trailing tab but no trailing whitespace is expected', (done) ->
					prepareFs 'trim_trailing_whitespace', true, 'trim_trailing_whitespace/tab.txt'

					bmValidate 'file.txt', (err, results) ->
						results.trim_trailing_whitespace.should.deep.equal
							expected: true
							is: false

						done()

				it 'should validate if file has no trailing whitespace and none is expected', (done) ->
					prepareFs 'trim_trailing_whitespace', true, 'trim_trailing_whitespace/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file has a trailing space and trailing whitespace is to be expected', (done) ->
					prepareFs 'trim_trailing_whitespace', false, 'trim_trailing_whitespace/space.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file has a trailing tab and trailing whitespace is to be expected', (done) ->
					prepareFs 'trim_trailing_whitespace', false, 'trim_trailing_whitespace/tab.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file has no trailing whitespace but trailing whitespace is to be expected', (done) ->
					prepareFs 'trim_trailing_whitespace', false, 'trim_trailing_whitespace/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should not validate if nothing is expected', (done) ->
					prepareFs null, null, 'trim_trailing_whitespace/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

			describe 'insert_final_newline', ->
				after ->
					mockFs.restore()

				it 'should validate if file has a final newline but a final newline is not expected', (done) ->
					prepareFs 'insert_final_newline', false, 'insert_final_newline/newline.txt'

					bmValidate 'file.txt', (err, results) ->
						results.insert_final_newline.should.deep.equal
							expected: false
							is: true

						done()

				it 'should validate if file has a final newline and a final newline is expected', (done) ->
					prepareFs 'insert_final_newline', true, 'insert_final_newline/newline.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file has no final newline but a final newline is expected', (done) ->
						prepareFs 'insert_final_newline', true, 'insert_final_newline/none.txt'

						bmValidate 'file.txt', (err, results) ->
							results.insert_final_newline.should.deep.equal
								expected: true
								is: false

							done()

				it 'should validate if file has no final newline and no final newline is expected', (done) ->
						prepareFs 'insert_final_newline', false, 'insert_final_newline/none.txt'

						bmValidate 'file.txt', (err, results) ->
							results.should.be.true

							done()

				it 'should not validate if nothing is expected', (done) ->
					prepareFs null, null, 'insert_final_newline/none.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

			describe 'max_line_length', ->
				after ->
					mockFs.restore()

				it 'should validate if all lines in file have less than 80 characters', (done) ->
					prepareFs 'max_line_length', 80, 'max_line_length/under-80.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if all lines in file have less than or equal to 80 characters', (done) ->
					prepareFs 'max_line_length', 80, 'max_line_length/80.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()

				it 'should validate if file contains lines having more than 80 characters', (done) ->
						prepareFs 'max_line_length', 80, 'max_line_length/over-80.txt'

						bmValidate 'file.txt', (err, results) ->
							results.max_line_length.should.deep.equal
								expected: 80
								is: 212

							done()

				it 'should not validate if nothing is expected', (done) ->
					prepareFs null, null, 'max_line_length/80.txt'

					bmValidate 'file.txt', (err, results) ->
						results.should.be.true

						done()
