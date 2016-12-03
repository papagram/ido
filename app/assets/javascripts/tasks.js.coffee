window.IDO.tasks = {}

IDO.tasks.init = ->
  IDO.request(
    type: 'GET',
    url: '/tasks.json',
    timeout: 10000,
  ).then((response) ->
    template = _.template($('#tasks-template').text())
    tbody = $('#tasks-data')
    _.each response, (task) ->
      $(template(task)).appendTo tbody
  )

IDO.tasks.post = ->
  IDO.request(
    type: 'POST',
    url: '/tasks.json',
    dataType: 'json',
    data: new FormData($('#new_task')).get(0),
    timeout: 10000,
  ).then((response) ->
    console.log response
  )

$ ->
  $('#post-new-task').on('click', (e) ->
    e.preventDefault()
    IDO.tasks.post()
  )
