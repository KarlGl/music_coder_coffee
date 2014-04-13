exports.core = require './core.coffee'

exports.delay = (func, time)->
  setTimeout(
    func
    time)

exports.run = (points, sleep, inc, pos=0, endPos=1)->
  if (pos <= endPos)
    exports.core.run(
      points: points
      position: pos
    )

  # if we can call it once more... do it
  if (pos + inc <= endPos)
    exports.delay(
      ->
        exports.run(points, sleep, inc, pos + inc)
      sleep
    )

if (typeof(window) != 'undefined')
  # globally export our functions
  window.run = exports.run
  con = AudioContext || webkitAudioContext
  exports.core.init(new con())