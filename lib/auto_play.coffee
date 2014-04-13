exports.core = require './core.coffee'

exports.delay = (func, time)->
  # only one of these per instance,
  # clear it so we never have 2
  if (exports.nextPlay)
    clearTimeout(exports.nextPlay)
  exports.nextPlay = setTimeout(
    func
    time)

exports.init = (isLoop=true)->
  exports.isLoop = isLoop  
exports.init()

exports.runRecur = (points, sleep, inc, pos, startPos, endPos, isLoop)->

  if (pos <= endPos)
    exports.core.run(
      points: points
      position: pos
    )

    kill = exports.core.player.output.killAll

    func = ->
      exports.runRecur(points, sleep, inc, pos + inc, startPos, endPos, isLoop)
    if (pos + inc <= endPos)
      exports.delay(
        func
        sleep
      )
    else
      if (isLoop)
        kill()
        # can not delay here! will cancel
        # exports.delay(
        exports.run(points, sleep, inc, startPos, endPos)
          # sleep
        # )
      else
        kill()

exports.run = (points, sleep, inc, pos=0, endPos=1)->
  if (exports.nextPlay)
    clearTimeout(exports.nextPlay)
  exports.runRecur(points, sleep, inc, pos, pos, endPos, exports.isLoop)
