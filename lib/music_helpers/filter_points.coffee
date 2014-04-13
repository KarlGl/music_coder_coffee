# Only show points near the passed in startP.
#
exports.run = (points, startP, accuracy=0.01)->
  points.filter (point)->
    if (pos = point.position? && point.position)
      (pos >= startP - accuracy && pos <= startP + accuracy)
    else
      true
  