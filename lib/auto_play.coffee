exports.core = require './core.coffee'
snap = require './music_helpers/snap.coffee'

exports.delay = (func, time)->
  # only one of these per instance,
  # clear it so we never have 2
  if (exports.nextPlay)
    clearTimeout(exports.nextPlay)
  exports.nextPlay = setTimeout(
    func
    time)

exports.kill = ->
  if (exports.nextPlay)
    clearTimeout(exports.nextPlay)
  exports.core.player.output.killAll

exports.runRecur = (params, pos)->
  pos = snap.snapToGrid(pos, params.blockSize)
  if (pos <= params.endPos)
    # play at pos...
    exports.core.run
      points: params.points
      position: pos
      eachPlayStartCallback: params.eachPlayStartCallback
      blockSize: params.blockSize
    

    kill = exports.kill

    func = ->
      exports.runRecur(params, pos + params.increment)
    if (pos + params.increment <= params.endPos)
      exports.delay(
        func
        params.sleep
      )
    else
      if (params.isLoop)
        kill()
        # can not delay here! will cancel
        # exports.delay(
        exports.run(params)
          # sleep
        # )
      else
        kill()

exports.run = (params)->
  exports.kill()
  # SNAP TO GRID
  params.startPos = snap.snapToGrid(params.startPos, params.blockSize)
  exports.runRecur(params, params.startPos)
