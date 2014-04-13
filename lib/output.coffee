exports.oscLib = require './audiolib/osc_lib.coffee'
helpers = require './music_helpers/music_helpers.coffee'

exports.killAll = ()->
  exports.oscs.forEach (position)->
    position.osc.destroy()

# array of positions that have 'val' key as a 0 to 1 number.
# remove no longer used oscs.
# add new oscs.
# update current oscs
exports.run = (positions, context)->
  # destroy all oscs
  exports.killAll()

  # make all new oscs from POSITIONS.
  exports.oscs = positions.map (position)-> 
    exports.oscs.push(osc = exports.oscLib.makeOsc(context))
    position.osc = osc
    position
  
  # setF of all oscs
  exports.oscs.map (position)-> 
      position.osc.setF helpers.humanEar.
      run( position.val )

exports.oscs = []
