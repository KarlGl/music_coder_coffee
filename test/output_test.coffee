# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/output'

called = false
exports.run = (test)->
  spy = sinon.stub(core.oscLib, 'makeOsc', ->
    destroy: ->
    setF: ->
      called = true
  )
  test.ok !called, "Freq not set"
  core.run([{val: 1}, {val: 0.1}])
  test.equal core.oscs.length, 2, "created osc"
  test.ok called, "Freq got set"
  core.run([{val: 1}])
  test.equal core.oscs.length, 1, "destroyed osc"
  core.run([{val: 0.1}])
  test.equal core.oscs.length, 1, "still 1 osc"
  core.run([])
  test.equal core.oscs.length, 0, "now 0 osc"

  # now lets test with some waits.
  

  spy.restore()
  test.done()
