#
# This time we are making an OSC with our own custom buffer.
# What does this give us?
# We can now specify custom waveforms to be used in the osc.
#

exports.makeOsc = (position, context)->
  waveData = position.waveData
  numberOfChannels = 1
  #parameter describes the sample-rate of the linear PCM audio data in the buffer in sample-frames per second. An implementation must support sample-rates in at least the range 22050 to 96000.
  sampleRate = 44100
  
  setF: (hertz)->
    if this.destroy?
      this.destroy()

    length = sampleRate * (1 / hertz)

    raw = context.createBuffer(
      numberOfChannels,
      length,
      sampleRate)

    channelData = raw.getChannelData(0)


    # Create source node
    source = context.createBufferSource()
    source.loop = true # Make sure that sound will repeat over and over again till we kill it
    source.buffer = raw # Assign our buffer to the source node buffer


    # Yes, you can actually change buffer data while it is playing!!
    setData = (i, channelData)->
      inBuffer = i / length
      getClosest = (n, closest)->
        if (waveData[n]?)
          closest = waveData[n]
          if (closest.x < inBuffer)
            getClosest(n + 1, closest)
          else
            [n, closest]
        else
          [n-1, closest]

      # the closest but always taking the lower. [1] is the result.
      trunc = getClosest(0)

      # Test if one higher is closer.
      oneOver = waveData[trunc[0]]

      point = if (oneOver? && Math.abs(oneOver.x - inBuffer) < Math.abs(trunc[1].x - inBuffer))
        oneOver
      else
        trunc[1]

      channelData[i] = if point? then point.y * 2 - 1 else 0 

    setData(i, channelData) for __, i in channelData

    source.connect(context.destination)
    source.start(0)

    this.destroy = ->
      source.disconnect(0)

