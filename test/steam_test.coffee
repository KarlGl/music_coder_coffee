# For test mocking.
sinon = require 'sinon'

core = require '../lib/stream.coffee'

exports.runWithObjects = (test)->
  stream = core.init()
  stream.run({a: {a :2}})
  stream.run({a: {a :2}})
  stream.run({a: {a :3}})
  test.equal(stream.stream.length, 2,
    "Will see two nested objects as the same, resulting in only 1 push to the stream.")
  test.done()

exports.runWithArrays = (test)->
  stream = core.init()
  stream.run([{}])
  stream.run([{}])
  stream.run([{a: 2}])
  test.equal(stream.stream.length, 2,
    "Will see two arrays objects as the same, resulting in only 1 push to the stream.")
  test.done()

exports.run = (test)->
  stream = core.init()
  test.deepEqual(stream.stream, [], 'Blank after init')
  stream.run(0.5)
  test.deepEqual(
    stream.stream
    [
      waits: 0
      position: 0.5
    ]
    "1 push")

  stream.run(0.5)
  test.deepEqual(stream.stream, 
    [
      waits: 0
      position: 0.5
    ], "Still 1 pos, called with same")
  stream.run(0.7)
  test.deepEqual(stream.stream, [
    waits: 0
    position: 0.5
  ,
    waits: 1
    position: 0.7
  ], "2nd pos, different, should push to streams")
  test.done()
