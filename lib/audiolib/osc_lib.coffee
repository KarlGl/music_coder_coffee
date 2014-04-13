exports.makeOsc = (context)->
  raw = context.createOscillator()
  raw.connect(context.destination)
  raw.noteOn(0)

  raw:
    raw
  destroy: ->
    raw.disconnect()
  setF: (f)->
    raw.frequency.value = f
