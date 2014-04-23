# Only show points near the passed in startP.
#
fixJsNumbers = (number)->
  parseFloat(number.toPrecision(12))

exports.run = (points, startP, accuracy=0.1)->
  accuracy = fixJsNumbers(accuracy)
  points.filter (point)->
    if (point.position?)
      startP = fixJsNumbers(startP)
      pos = fixJsNumbers point.position
      (pos > fixJsNumbers(startP - accuracy) && pos < fixJsNumbers(startP + accuracy))
    else
      # no position, just play it!
      true

if (window?)
  window.filterPoints = exports
  
# noteToFrequency = (note) ->
  # Math.pow(2, (note - 69) / 12) * 440.0