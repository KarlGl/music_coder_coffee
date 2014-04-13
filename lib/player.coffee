exports.output = require './output.coffee'
stream = require './stream.coffee'

exports.init = ()->
  exports.positions = stream.init()
  exports.points = stream.init()

exports.run = (points, context, position=0)->
  if exports.positions.run(position) || exports.points.run(points)
    # remove no longer used oscs.
    # add new oscs.
    # update current oscs
    exports.output.run(points, context)