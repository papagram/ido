window.TRAININGS = {}

TRAININGS.init = ->
  TRAININGS.request(
    type: 'GET',
    url: '/trainings/tasks.json',
    timeout: 10000,
  ).then(
    (response, statusText, obj) ->
      for task in response
        $('<li>').appendTo('#task-list').text(task.subject)
  )

TRAININGS.request = (params) ->
  $.ajax(params).fail(
    (xhr, statusText, errorThrown) ->
      alert "#{statusText}: データの取得に失敗しました。"
      console.log errorThrown
  ).always(
    (response, statusText, obj) ->
      console.log '通信が完了しました。'
  )

TRAININGS.getTestMessage = ->
  TRAININGS.request(
    type: 'GET',
    url: '/trainings/message.json',
    timeout: 10000
  ).then(
    (response, statusText, obj) ->
      $('#message').text(response.message)
  )

$ ->
  $('#test').on 'click', ->
    TRAININGS.getTestMessage()
