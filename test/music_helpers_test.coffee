
# Application helpers.
helpers = require '../lib/music_helpers/music_helpers'
# _ = require '../node_modules/lodash/lodash'

# Test for reasonable values.
exports.humanEar = (test)->
  test.ok(helpers.humanEar.run(0) < 30)
  test.ok(helpers.humanEar.run(0) > 0)
  test.ok(helpers.humanEar.run(1) > 4000)
  test.ok(helpers.humanEar.run(1) < 6000)
  test.done()

# Test for reasonable values.
exports.filteredPoints = (test)->
  test.deepEqual(
    helpers.filteredPoints.run(
      [
        val: 1
      ,
        val: 1
      ]).length
    2)
  test.deepEqual(
    helpers.filteredPoints.run(
      [
        val: 1,
        position: 0.3
      ], 0.4, 0.01).length
    0)
  test.deepEqual(
    helpers.filteredPoints.run(
      [
        val: 1,
        position: 0.3
      ], 0.3, 0.01).length
    1)
  test.deepEqual(
    helpers.filteredPoints.run(
      [
        val: 1,
        position: 0.31
      ], 0.3, 0.01).length
    1)
  test.deepEqual(
    helpers.filteredPoints.run(
      [
        val: 1,
        position: 0.3
      ], 0.29, 0.01).length
    1)
  test.done()
