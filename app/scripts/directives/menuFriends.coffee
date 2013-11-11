'use strict'

angular.module('AngularJsBerlin8App')
  .directive('menuFriends', (Facebook) ->
    templateUrl: '/views/directive-menu-friends.html'
    restrict: 'AE'

    link: (scope, element, attrs) ->
      scope.friendsList = []

      Facebook.getFriendsList().then(
        (friendsList) ->
          scope.friendsList = friendsList
      )
  )
