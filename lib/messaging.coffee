# 
# This is where we subscribe to messages from the frontend.
# e.g. on isPlaying button changing state, do what callback?
# 

if (window?)

  # restart playback. The callback for everything.
  restartPlayback = (message)->
      console.log(message)
      area = message.area
      if area.isPlaying
        args = 
          points: area.units.map (unit)->
            position: unit.x
            val: unit.y
          bpm: area.bpm

          # how many blocks possible in a row without touching basically.
          quality: 1 / area.blockSize
          blockSize: area.blockSize
          beatsPerBar: 1
          startPos: area.playSlider
          endPos: 1
          isLoop: area.isLooping

          eachPlayStartCallback: (newPos)->
            area.playIndicator.setX(newPos)

        window.core.run(args)
      else
        window.core.kill()
  window.callbacks = 
    
    #sliders
    playSlider: restartPlayback
    bpm: restartPlayback

    #buttons
    isLooping: restartPlayback
    isPlaying: restartPlayback
    isFreeplay: restartPlayback
    changedUnits: restartPlayback
