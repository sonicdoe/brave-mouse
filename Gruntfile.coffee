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
			files: ['test/brave-mouse']

	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-mocha-cli'

	grunt.registerTask 'build', ['clean:package', 'coffee']
	grunt.registerTask 'test', ['mochacli']
	grunt.registerTask 'default', []
