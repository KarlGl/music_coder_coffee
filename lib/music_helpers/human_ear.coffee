# Converts a number from 0 to 1,
# into something the human ear can hear,
# where 0 is the lowest, and 1 is the highest.

LOWSEST_POSSIBLE_FREQUENCY = 15
HIGHEST_POSSIBLE_FREQUENCY = 1000

exports.run = (startF)->
  startF * HIGHEST_POSSIBLE_FREQUENCY + LOWSEST_POSSIBLE_FREQUENCY

# 
# Convert a frequency into a 0 to 1 number.
# Ranged within reason for the human ear.
#
exports.freqToRange = (startF)->
  ( startF - LOWSEST_POSSIBLE_FREQUENCY ) / HIGHEST_POSSIBLE_FREQUENCY