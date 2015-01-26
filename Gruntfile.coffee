module.exports = (grunt) ->
	grunt.initConfig
		clean:
			package: ['lib']
		coffee:
			options:
				bare: true
			files:
				expand: true
				cwd: 'src'
				src: ['**/*.coffee']
				dest: 'lib'
				ext: '.js'
		mochacli:
			options:
				compilers: ['coffee:coffee-script/register']
				require: ['test/support/common', 'test/support/fixtures']
			lib: ['test/brave-mouse']
			cli: ['test/cli']

	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-mocha-cli'

	grunt.registerTask 'build', ['clean:package', 'coffee']
	grunt.registerTask 'test', ['build', 'mochacli']
	grunt.registerTask 'test:lib', ['build', 'mochacli:lib']
	grunt.registerTask 'test:cli', ['build', 'mochacli:cli']
	grunt.registerTask 'default', []
