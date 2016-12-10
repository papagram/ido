window.IDO.tasks = {}

class IDO.tasks.TaskService
  create: (params) ->
    IDO.request(params)

## 初期化関数は各画面で一度だけ呼ばれる！

# /tasksの初期化関数
IDO.tasks.init = ->
  taskService = new IDO.tasks.TaskService()

  taskService.create(
    type: 'GET',
    url: '/tasks.json',
    timeout: 10000
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

    taskService.create(
      type: 'POST',
      url: '/tasks.json',
      dataType: 'json',
      data: $('#new_task').serialize(),
      timeout: 10000
    ).then((response) ->
      IDO.tasks.insertTask(response)
    )
  )

# /tasks/newの初期化関数
IDO.tasks.initNew = ->
  IDO.readyDatetimepicker()

## 関数定義

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
