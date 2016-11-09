App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data.action == "new_notification"
        $("#notification").html(data.message)
        $("#notification").css("visibility", "visible")
    #Recibe las respuestas de una nueva solicitud de amistad
    if data.action == "new_friend_request"
      $("#friendships").html(data.message)
      $("#friendships").css("visibility", "visible")
