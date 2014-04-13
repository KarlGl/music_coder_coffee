exports.core = require './core.coffee'

exports.delay = (func, time)->
  if (exports.nextPlay)
    clearTimeout(exports.nextPlay)
  # only one of these per instance,
  # clear it so we never have 2
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

    func = ->
      exports.runRecur(points, sleep, inc, pos + inc, startPos, endPos, isLoop)
    if (pos + inc <= endPos)
      exports.delay(
        func
        sleep
      )
    else
      if (isLoop)
        exports.delay(
          exports.runRecur(points, sleep, inc, startPos, startPos, endPos, exports.isLoop)
        )
      else
        exports.core.player.output.killAll()

exports.run = (points, sleep, inc, pos=0, endPos=1)->
  exports.runRecur(points, sleep, inc, pos, pos, endPos, exports.isLoop)
