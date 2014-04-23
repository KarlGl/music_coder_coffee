# 
# This is where we subscribe to messages from the frontend.
# e.g. on isPlaying button changing state, do what callback?
# 

if (window?)

  # restart and re-draw the whole area.
  restartEverything = (message)->
    area = message.area
    area.restart()

  # restart playback. The callback for everything.
  restartPlayback = (message)->
      console.log(message)
      area = message.area
      state = area.state

      # render state into the input box
      area.renderState()
      if state.isPlaying
        args = 
          points: state.units.map (unit)->
            position: unit.x
            val: unit.y
          bpm: state.bpm

          # how many blocks possible in a row without touching basically.
          quality: 1 / state.blockSize
          blockSize: state.blockSize
          beatsPerBar: 1
          startPos: state.playSlider
          endPos: 1
          isLoop: state.isLooping

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
    areaResize: restartPlayback

    # grid showing
    gridIsSnap_x: restartEverything
    gridIsSnap_y: restartEverything
    gridIsShow_y: restartEverything
    gridIsShow_x: restartEverything
    
    # state input box
    stateInput: restartEverything
    units: restartPlayback
