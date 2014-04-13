# Converts a number from 0 to 1,
# into something the human ear can hear,
# where 0 is the lowest, and 1 is the highest.

exports.run = (startF)->
  startF * 4985 + 15