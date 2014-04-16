# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/core'

exports.run = (test)->
  # test.ok(core.run().error, "Throw error when no input.")
  core.init()
  create = sinon.spy(core.player.output.oscLib, 'makeOsc')
  run = core.run(points: [
    val: 0.5
    ])
  test.equal(create.callCount, 1, "1 point 1 osc")
  create.restore()
  test.done()

exports.run2 = (test)->
  core.init()
  create = sinon.spy(core.player.output.oscLib, 'makeOsc')
  run = core.run(points: [
      val: 0.5
    ,
      val: 0.5
    ])
  test.equal(create.callCount, 2, "2 oscs")

  create.restore()
  test.done()
