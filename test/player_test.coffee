# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/player'

exports.run = (test)->
  core.init()
  spy = sinon.spy(core.output, 'run')
  # core.run([])
  spy.restore()
  test.done()
