# All helpers.

humanEar = require './human_ear.coffee'
filteredPoints = require './filter_points.coffee'
bpmConvert = require './bpm_convert.coffee'
snap = require './bpm_convert.coffee'

exports.humanEar = humanEar
exports.filteredPoints = filteredPoints
exports.bpmConvert = bpmConvert
exports.snap = snap

# Our gui may actually rely on this but it's reasonable.
# if you want some function that uses the music helpers,
# it's not an implementation thing but things close to 
# what the user can configure, so theoretically if they are 
# scripting they can use these functions.
if (window?)
  window.SPhelpers = exports
