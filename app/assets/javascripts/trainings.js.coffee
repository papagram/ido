ajax = (jqXHR, successDo) ->
  jqXHR().done(
    (response, statusText, xhr) ->
      successDo(response)
  ).fail(
    (xhr, statusText, errorThrown) ->
      alert "#{statusText}: データの取得に失敗しました。"
      console.log errorThrown
  ).always(
    (response, statusText, obj) ->
      console.log '通信が完了しました。'
  )

test = ->
  $.ajax {
    type: 'GET',
    url: '/trainings/message.json',
    timeout: 10000
  }

testSuccessDo = (response) ->
  $('#message').text(response.message)

$ ->
  $('#test').on 'click', ->
    ajax(test, testSuccessDo)

tasks = ->
  $.ajax {
    type: 'GET',
    url: '/trainings/tasks.json',
    timeout: 10000,
  }

taskSuccessDo = (response) ->
  for task in response
    $('#task-list').append $('<li>').text(task.subject)

$ ->
  alert 'タスクを全件取得します。'
  ajax(tasks, taskSuccessDo)
