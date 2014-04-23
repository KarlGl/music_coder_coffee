#
# This time we are making an OSC with our own custom buffer.
# What does this give us?
# We can now specify custom waveforms to be used in the osc.
#

exports.makeOsc = (context)->
  # Create a single channel buffer as the 'raw'
  raw = context.createBuffer(1, 44100, 44100)
  channelData = raw.getChannelData(0)


  # Create source node
  source = context.createBufferSource()
  source.loop = true # Make sure that sound will repeat over and over again
  source.buffer = raw # Assign our buffer to the source node buffer

  raw:
    raw
  source:
    source

  destroy: ->
    source.disconnect(0)
  setF: (f)->
    # Yes, you can actually change buffer data while it is playing!!
    setData = (i, channelData)->
      channelData[i] = Math.sin(16  * 180 * (i / channelData.length))

    setData(i, channelData) for __, i in channelData
  engage: ()->
    source.connect(context.destination)
    source.noteOn(0)
