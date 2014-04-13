# Converts a bpm into "increment" and "sleep" (ms).
# to play a sample of q 10 in one second:
# increment = 1 / 10 = 0.1
# sleep = (60000 / 60) / 10 = 100

exports.run = (bpm, quality, beatsPerBar=4)->
  samplesPerMinute = bpm / beatsPerBar
  {increment: 1 / quality, sleep: (60000 / samplesPerMinute) / quality}

