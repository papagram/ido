window.TASKS = {}

TASKS.init = ->
  TASKS.request(
    type: 'GET',
    url: '/tasks.json',
    timeout: 10000,
  ).then(
    (response, statusText, obj) ->
      template = _.template($('#tasks-template').text())
      tbody = $('#tasks-data')
      _.each response, (task) ->
        row = template {
          id: task.id,
          subject: task.subject,
          body: task.body,
          status: task.status,
          start_at: task.start_at,
          closing_at: task.closing_at
        }
        $(row).appendTo tbody
  )

TASKS.request = (params) ->
  $.ajax(params).fail(
    (xhr, statusText, errorThrown) ->
      alert "#{statusText}: データの取得に失敗しました。"
      console.log errorThrown
  ).always(
    (response, statusText, obj) ->
      console.log '通信が完了しました。'
  )
