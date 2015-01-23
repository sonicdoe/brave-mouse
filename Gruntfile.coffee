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

	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'

	grunt.registerTask 'default', []
