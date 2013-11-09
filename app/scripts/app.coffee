'use strict'

angular.module('AngularJsBerlin8App', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ezfb'
])
  .config ['$routeProvider', '$FBProvider', ($routeProvider, $FBProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'


    $FBProvider.setInitParams(
      appId: '256438047840331'
    )
  ]
