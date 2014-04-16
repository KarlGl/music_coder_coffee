# 
# This sets all the callbacks for the frontend.
# It's our messaging system.
# 

if (typeof(window) != 'undefined')
  cb = (message)->
      console.log(message)
      area = message.area
      if area.isPlaying
        args = 
          points: area.units.map (unit)->
            position: unit.x
            val: unit.y
          bpm: 60

          # how many blocks possible in a row without touching basically.
          quality: 1 / area.blockSize
          
          beatsPerBar: 1
          startPos: area.upto
          endPos: 1
          isLoop: area.isLooping
        window.core.run(args)
      else
        core.kill()
  window.callbacks = 
    playBar: cb
    playBtn: cb
    loopBtn: cb
