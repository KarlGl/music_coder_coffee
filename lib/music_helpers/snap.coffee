
exports.snapToGrid = (pos, gridCellSize=0.1)->
  gridCellSize * Math.round(pos / gridCellSize)