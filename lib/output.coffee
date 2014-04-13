exports.oscLib = require './audiolib/osc_lib.coffee'
helpers = require './music_helpers/music_helpers.coffee'

exports.run = (positions, context)->
  positions.map (position)-> 
    exports.oscs.push(osc = exports.oscLib.makeOsc(context))
    osc.setF helpers.humanEar.
      run(position.val)
  this

exports.oscs = []
