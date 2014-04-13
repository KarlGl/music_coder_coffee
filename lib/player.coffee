exports.output = require './output.coffee'
stream = require './stream.coffee'

exports.init = ()->
  exports.positions = stream.init()
  exports.points = stream.init()

exports.run = (points, context, position=0)->
  # both have side effects, both should run not in the OR statement.
  pointsChanged = exports.points.run(points)
  positionsChanged = exports.positions.run(position)
  if (pointsChanged || positionsChanged)
    # remove no longer used oscs.
    # add new oscs.
    # update current oscs
    # true
    exports.output.run(points, context)
