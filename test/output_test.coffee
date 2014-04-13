# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/output'

exports.run = (test)->
  # core.init()
  spy = sinon.stub(core.oscLib, 'makeOsc', ->
      destroy: ->
      setF: ->
  )
  core.run([{val: 1}])
  # spy.restore()
  test.done()
