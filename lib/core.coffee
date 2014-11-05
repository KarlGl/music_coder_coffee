#
# Save the context to create sounds and trigger the ui callbacks when playing.
# Then play on Player.
#

exports.player = require './player.coffee'

# a mock for an audio context until you set one.
core = {}
core.context =
  destination: null, 
  createBuffer: -> 
  createOscillator: -> 
    connect: ->
    start: ->
    disconnect: ->
    frequency: 
      value: null

exports.init = (context)->
  if (context)
    core.context = context
  exports.player.init()

exports.run = (input)->
  if (input.eachPlayStartCallback?)
    input.eachPlayStartCallback(input.position)
  exports.player.run(
    input.points 
    core.context
    input.position
    input.blockSize
  )
