# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/auto_play'

exports.run = (test)->
  spy = sinon.stub(
    core
    'delay'
    (func)-> func())

  core.run({
    points: [
      {val: 0.3, position: 0.1},
      {val: 0.4, position: 0.2},
      {val: 0.5, position: 0.3},
      ],
    sleep: 10,
    increment: 0.1,
    startPos: 0,
    endPos: 1,
    isLoop: false,
  })

  test.equal spy.callCount, 10, 'The delay func gets called 10 times... calling 11 plays...'

  spy.restore()
  test.done()

