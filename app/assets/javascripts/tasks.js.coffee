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

IDO.tasks.init_form = ->
  flatpickr('.calendar', {
    enableTime: true
  })

IDO.tasks.post = ->
  IDO.request(
    type: 'POST',
    url: '/tasks.json',
    dataType: 'json',
    data: $('#new_task').serialize(),
    timeout: 10000,
  ).then((response) ->
    console.log response
    location.href= '/tasks'
  )

$ ->
  $('#post-new-task').on('click', (e) ->
    e.preventDefault()
    IDO.tasks.post()
  )

$ ->
  $('#new-form-link').on('click', (e) ->
    e.preventDefault()
    $('#new-task-wrapper').toggleClass('display-none')
  )
