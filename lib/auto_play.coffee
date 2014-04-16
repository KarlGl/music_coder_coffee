exports.core = require './core.coffee'

exports.delay = (func, time)->
  # only one of these per instance,
  # clear it so we never have 2
  if (exports.nextPlay)
    clearTimeout(exports.nextPlay)
  exports.nextPlay = setTimeout(
    func
    time)

exports.kill = exports.core.player.output.killAll

exports.runRecur = (params, pos)->
  if (pos <= params.endPos)
    exports.core.run(
      points: params.points
      position: pos
    )

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
  if (exports.nextPlay)
    clearTimeout(exports.nextPlay)
  exports.runRecur(params, params.startPos)
