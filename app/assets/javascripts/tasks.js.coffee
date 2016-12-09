window.IDO.tasks = {}

IDO.tasks.init = ->
  IDO.request(
    type: 'GET',
    url: '/tasks.json',
    timeout: 10000,
  ).then((response) ->
    IDO.tasks.insertTask(response)
  )

  IDO.readyDatetimepicker()

  $('#new-form-link').on('click', (e) ->
    e.preventDefault()
    $('#new-task-wrapper').toggleClass('hidden')
  )

  $('#post-new-task').on('click', (e) ->
    e.preventDefault()
    IDO.tasks.post()
  )

IDO.tasks.initNew = ->
  IDO.readyDatetimepicker()

IDO.tasks.post = ->
  IDO.request(
    type: 'POST',
    url: '/tasks.json',
    dataType: 'json',
    data: $('#new_task').serialize(),
    timeout: 10000,
  ).then((response) ->
    IDO.tasks.insertTask(response)
  )

IDO.tasks.insertTask = (response) ->
  template = _.template($('#tasks-template').text())
  tbody = $('#tasks-data')
  insert = (task) ->
    $(template(task)).appendTo tbody

  if Array.isArray(response)
    _.each response, (task) ->
      insert(task)
  else
    insert(response)
