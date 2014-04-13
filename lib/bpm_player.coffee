# bpm player: can loop, play at a bpm instead of inc and sleep.
exports.core = require './auto_play.coffee'
helpers = require './music_helpers/music_helpers.coffee'

exports.init = (quality=100, beatsPerBar=4)->
  exports.quality = quality 
  exports.beatsPerBar = beatsPerBar
exports.init()

exports.run = (points, bpm)->
  a = helpers.bpmConvert.run(bpm, exports.quality, exports.beatsPerBar)
  exports.core.run(
    points
    a.sleep
    a.increment
  )

if (typeof(window) != 'undefined')
  # globally export our functions
  window.run = exports.run
  window.core = exports
  con = AudioContext || webkitAudioContext
  exports.core.core.init(new con())