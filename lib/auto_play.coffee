exports.core = require './core.coffee'

exports.delay = (func, time)->
  setTimeout(
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

    # if we can call it once more... do it
    func = ->
      exports.runRecur(points, sleep, inc, pos + inc, startPos, endPos, isLoop)
    if (pos + inc <= endPos)
      exports.delay(
        func
        sleep
      )
    else
      if (isLoop)
        exports.runRecur(points, sleep, inc, startPos, startPos, endPos, exports.isLoop)

exports.run = (points, sleep, inc, pos=0, endPos=1)->
  exports.runRecur(points, sleep, inc, pos, pos, endPos, exports.isLoop)
