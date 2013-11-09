'use strict'

describe 'Service: Facebook', () ->

  # load the service's module
  beforeEach module 'AngularJsBerlin8App'

  # instantiate service
  Facebook = {}
  beforeEach inject (_Facebook_) ->
    Facebook = _Facebook_

  it 'should do something', () ->
    expect(!!Facebook).toBe true
