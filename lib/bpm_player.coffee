#
# bpm player: can loop, play at a bpm instead of inc and sleep.
#

exports.core = require './auto_play.coffee'
helpers = require './music_helpers/music_helpers.coffee'

exports.kill = exports.core.kill

exports.run = (params)->
  a = helpers.bpmConvert.run(params.bpm, params.quality, params.beatsPerBar)
  params.sleep = a.sleep
  params.increment = a.increment
  exports.core.run params

if (typeof(window) != 'undefined')
  # globally export our functions
  window.run = exports.run
  window.core = exports
  con = AudioContext || webkitAudioContext
  exports.core.core.init(new con())