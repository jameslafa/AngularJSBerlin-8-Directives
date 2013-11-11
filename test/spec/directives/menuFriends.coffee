'use strict'

describe 'Directive: menuFriends', () ->

  # load the directive's module
  beforeEach module 'angularJsberlinApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<menu-friends></menu-friends>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the menuFriends directive'
