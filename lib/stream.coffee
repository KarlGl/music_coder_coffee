# a generic stream object.

# library
_ = require '../node_modules/lodash/lodash'

exports.init = ()->
  # current last value called with.
  head: null
  # all things head has ever been in array.
  stream: []
  # current times called without changing
  waits: 0

  # returns if position is different from the last head.
  # side affect is storing it if it is different.
  run: (position)->
    if !_.isEqual(
        position
        this.head)
      # push to stream
      this.stream.push
        waits: this.waits,
        position: position 

      # reset waits
      this.waits = 0
      # update head
      this.head = position
      true
    else
      this.waits += 1
      false
