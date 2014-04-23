#
# Manage refs to all oscillators. Create them to play sounds. 
#

exports.oscLib = require './audiolib/osc_lib.coffee'
helpers = require './music_helpers/music_helpers.coffee'

exports.killAll = ()->
  exports.oscs.forEach (position)->
    position.osc.destroy()

exports.makeAll = (positions, context)->
  exports.oscs = positions.map (position)-> 
    exports.oscs.push(osc = exports.oscLib.makeOsc(context))
    osc.engage()
    position.osc = osc
    position

exports.setF = (vals)->
  exports.oscs.map (position, i)-> 
      position.osc.setF helpers.humanEar.
      run( vals[i] )

# array of positions that have 'val' key as a 0 to 1 number.
# remove no longer used oscs.
# add new oscs.
# update current oscs
exports.run = (positions, context)->
  if (positions.length != exports.oscs.length)
    console.log("number of units changed", positions)
    # destroy all oscs
    exports.killAll()
    # make all new oscs from POSITIONS.
    exports.makeAll(positions, context)
  # setF of all oscs
  else
    console.log("number of units did not change", positions)

  exports.setF(positions.map((position)-> position.val))

exports.oscs = []
