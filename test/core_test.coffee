test = true
exports.testSomething = (test) ->
  test.expect(1)
  test.ok(true, "this should pass")
  test.done()
