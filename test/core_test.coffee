# For test mocking.
sinon = require 'sinon'

# Application core.
core = require '../lib/core'

# Mock Browser Objects
window = {}

# Can init
exports.test1 = (test)->
  core.init(window)
  test.ok(window.core, 'no access to window')
  test.done()
