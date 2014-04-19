exports.output = require './output.coffee'
stream = require './stream.coffee'
helpers = require './music_helpers/music_helpers.coffee'

exports.init = ()->
  exports.positions = stream.init()
  exports.points = stream.init()

exports.init()

# 
# make oscilators for the poinsts if they match position.#
# 
exports.run = (points, context, position=0, accuracy=0.01)->
  # both have side effects, both should run execute in the OR statement.
  pointsChanged = exports.points.run(points)
  positionsChanged = exports.positions.run(position)
  if (pointsChanged || positionsChanged)
    # change osilators. chagne thier pitch, or make new ones.
    console.log("playing at position", position)
    exports.output.run(
      helpers.filteredPoints.run(points, position, accuracy)
      context)
