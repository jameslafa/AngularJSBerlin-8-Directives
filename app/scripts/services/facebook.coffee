'use strict'

angular.module('AngularJsBerlin8App')
  .service 'Facebook', ($FB, $q) ->

    facebook =
      publicServices : {}   # Contains every publically exposed services
      userID : null         # Store the current userID


    ####
    # Get the userID of the current user. If the user is not logged in on
    # Facebook or has never installed our application, he will be asked
    # to via a popup
    ####
    facebook.publicServices.login = () ->
      # Create an instance of deferred. It helps to handle asynchronous
      # request easily.
      # More informations on http://docs.angularjs.org/api/ng.$q
      deferred = $q.defer()

      # Via Angular-easyfb plugin with check if the user is connected
      $FB.getLoginStatus().then(
        (loginStatus) ->
          if 'connected' == loginStatus.status
            # User is connected to Facebook and already accepted to
            # install our application.

            # We extract the userID in case we need it for later
            facebook.userID = loginStatus.authResponse.userID

            # We resolve the deferred. The promise already returned
            # (see deffered.promise below) will notify that the
            # request has been revolve and return the value given
            # as parameter
            deferred.resolve(facebook.userID)

          else
            # User is not connected to Facebook or did not installed our
            # application yet. Calling login method will open a pop-up
            # to ask the user to install the application.
            $FB.login(null).then(
              (loginStatus) ->
                if 'connected' == loginStatus.status
                  # Now the user is connected, we extract his userID and
                  # resolve the deffered
                  facebook.userID = loginStatus.authResponse.userID
                  deferred.resolve(facebook.userID)
                else
                  # The user is still not connected. He could have refused to
                  # install the app of close the popup.
                  # We can't go further so we reject the deferred giving the
                  # reason
                  deferred.reject(loginStatus.status)
              ,
              (error) ->
                # Error returned while calling login method. It's unexpected
                # so we reject the deferred giving the error
                deferred.reject(error)
            )
      )

      # We create a promise to the caller. This promise will notify him when the
      # deferred will be resolved of rejected
      return deferred.promise


    ####
    # Get the list of friends of the current user.
    # The friends list will be requested only if the user is logged in.
    ####
    facebook.publicServices.getFriendsList = () ->
      deferred = $q.defer()

      # First we check the user is logged in.
      facebook.publicServices.login()
      .then(
        (success) ->
          # The user is successfuly logged in. We can now request for
          # his friends list
          $FB.api('/me/friends')
      )
      .then(
        (friendsList) ->
          # We know have the friends list, we can resolve the deferred
          # giving his friends list
          deferred.resolve(friendsList.data)
      )

      return deferred.promise

    # Return the list of public exposed services
    return facebook.publicServices
