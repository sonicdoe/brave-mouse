path = require 'path'

chai = require 'chai'
global.should = chai.should()

global.bin = path.join __dirname, '..', '..', 'bin', 'brave-mouse'
