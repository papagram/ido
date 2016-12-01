window.IDO.trainings = {}

IDO.trainings.init = ->
  IDO.request(
    type: 'GET',
    url: '/trainings/tasks.json',
    timeout: 10000,
  ).then(
    (response) ->
      for task in response
        $('<li>').appendTo('#task-list').text(task.subject)
  )

IDO.trainings.getTestMessage = ->
  IDO.request(
    type: 'GET',
    url: '/trainings/message.json',
    timeout: 10000
  ).then(
    (response) ->
      $('#message').text(response.message)
  )

$ ->
  $('#test').on 'click', ->
    IDO.trainings.getTestMessage()
