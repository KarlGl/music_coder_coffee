# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/auto_play'

exports.run = (test)->
  spy = sinon.stub(
    core
    'delay'
    (func)-> func())

  core.run([
    {val: 0.3, position: 0.1},
    {val: 0.4, position: 0.2},
    {val: 0.5, position: 0.3},
    ], 10, 0.1)

  test.equal spy.callCount, 10, 'The delay func gets called 10 times... calling 11 plays'

  spy.restore()
  test.done()

