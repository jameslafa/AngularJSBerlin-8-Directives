'use strict'

angular.module('AngularJsBerlin8App', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ezfb'
])
  .config ['$routeProvider', '$FBProvider', '$locationProvider', ($routeProvider, $FBProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/user/:userId',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'


    $FBProvider.setInitParams(
      appId: '256438047840331'
    )

    $locationProvider.html5Mode(false)
  ]
