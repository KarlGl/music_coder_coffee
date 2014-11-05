#
# Create an osc the fast way
# using the build in osc library
#

exports.makeOsc = (context)->

  #Create buffer with two channels
  # buffer = context.createBuffer(1, 44100, 44100);
  # channelData = buffer.getChannelData(0);

  # Create source node
  #source = context.createBufferSource();
  # source.loop = true; # Make sure that sound will repeat over and over again
  # source.buffer = buffer; # Assign our buffer to the source node buffer


  raw = context.createOscillator()
  raw.connect(context.destination)

  raw:
    raw
  destroy: ->
    raw.disconnect()
  setF: (f)->
    raw.frequency.value = f
  engage: ()->
    raw.start(0)
    
