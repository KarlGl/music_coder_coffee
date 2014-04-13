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


  core.run([{val: 1, position: 0.1}, {val: 1, position: 0.2}, {val: 1, position: 0.3}], null, 0.2)

  test.equal( 
    spy.getCall(3).args[0].length
    1
    "The last call only has one position that matches current")

  spy.restore()
  test.done()
