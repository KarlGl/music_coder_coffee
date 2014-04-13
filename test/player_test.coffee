# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/player'

exports.run = (test)->
  core.init()
  spy = sinon.stub(core.output, 'run')

  core.run([{}], null, 0)
  core.run([{}], null, 0)
  test.equal spy.callCount, 1
  core.run([{}], null, 1)
  test.equal spy.callCount, 2
  core.run([{val: 'new'}], null, 1)
  test.equal spy.callCount, 3
  spy.restore()
  test.done()
