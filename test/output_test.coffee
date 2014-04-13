# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/output'

called = false
exports.run = (test)->
  spy = sinon.stub(core.oscLib, 'makeOsc', ->
    destroy: ->
    setF: ->
  )
  spy2 = sinon.stub(core, 'setF')
  test.equal spy2.callCount, 0, "Freq not set"
  core.run([{val: 1}, {val: 0.1}])
  test.equal core.oscs.length, 2, "created osc"
  test.equal spy2.callCount, 1, "Freq got set"
  core.run([{val: 1}])
  test.equal core.oscs.length, 1, "destroyed osc"
  core.run([{val: 0.1}])
  test.equal core.oscs.length, 1, "still 1 osc"
  core.run([])
  test.equal core.oscs.length, 0, "now 0 osc"

  # now lets test with some waits.
  

  spy.restore()
  spy2.restore()
  test.done()
