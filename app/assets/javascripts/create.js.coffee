$ ->
  socket = new WebSocket "ws://#{window.location.host}/discussions/#{@discussion.id}"

  socket.onmessage = (event) ->
    if event.data.length
      $("#comments").append j(render(@comment))
