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
