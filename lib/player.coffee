exports.output = require './output.coffee'
stream = require './stream.coffee'
helpers = require './music_helpers/music_helpers.coffee'

exports.init = ()->
  exports.positions = stream.init()
  exports.points = stream.init()

exports.init()

exports.run = (points, context, position=0, accuracy=0.01)->
  # both have side effects, both should run not in the OR statement.
  pointsChanged = exports.points.run(points)
  positionsChanged = exports.positions.run(position)
  if (pointsChanged || positionsChanged)
    # remove no longer used oscs.
    # add new oscs.
    # update current oscs
    exports.output.run(
      helpers.filteredPoints.run(points, position, accuracy)
      context)
