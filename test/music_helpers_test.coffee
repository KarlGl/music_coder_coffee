
# Application helpers.
helpers = require '../lib/music_helpers/music_helpers'

# Test for reasonable values.
exports.humanEar = (test)->
  test.ok(helpers.humanEar.run(0) < 30)
  test.ok(helpers.humanEar.run(0) > 0)
  test.ok(helpers.humanEar.run(1) > 4000)
  test.ok(helpers.humanEar.run(1) < 6000)
  test.done()
