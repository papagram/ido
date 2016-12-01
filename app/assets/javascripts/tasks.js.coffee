window.IDO = {}
window.IDO.tasks = {}

IDO.tasks.init = ->
  IDO.tasks.request(
    type: 'GET',
    url: '/tasks.json',
    timeout: 10000,
  ).then(
    (response) ->
      template = _.template($('#tasks-template').text())
      tbody = $('#tasks-data')
      _.each response, (task) ->
        $(template(task)).appendTo tbody
  )

IDO.tasks.request = (params) ->
  $.ajax(params).fail(
    (xhr, statusText, errorThrown) ->
      alert "#{statusText}: データの取得に失敗しました。"
      console.log errorThrown
  ).always(
    (response, statusText, obj) ->
      console.log '通信が完了しました。'
  )
