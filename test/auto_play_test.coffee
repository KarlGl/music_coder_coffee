# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/auto_play'

exports.run = (test)->
  spy = sinon.stub(
    core
    'delay'
    (func)-> func())
  oscSpy = sinon.stub(
    core.core.player.output.oscLib
    'makeOsc', ->
      destroy: ->
      setF: ->
  )
  core.init(false)

  core.run([
    {val: 0.3, position: 0.1},
    {val: 0.4, position: 0.2},
    {val: 0.5, position: 0.3},
    ], 10, 0.1)

  test.equal spy.callCount, 10, 'The delay func gets called 10 times... calling 11 plays...'

  # could remove this test, kinda overboard
  test.equal oscSpy.callCount, 3, '3 Oscs are made'

  spy.restore()
  oscSpy.restore()
  test.done()

