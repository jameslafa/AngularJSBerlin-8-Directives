'use strict'

angular.module('AngularJsBerlin8App')
  .controller 'MainCtrl', ['$scope', 'Facebook', '$routeParams', ($scope, Facebook, $routeParams) ->
    $scope.name = null
    $scope.photos = null

    Facebook.getFriendInfos($routeParams.userId).then(
      (infos) ->
        $scope.name = infos.name
        $scope.photos = infos.photos
    )
  ]
