## 名前空間宣言 ##
## クラスや関数はこの下に置く ##
window.IDO.tasks = {}

## クラス定義 ##
## CRUDに相当するメソッドを実装する ##
## 通信に必要なパラメーターはクラス自身が知っているべき ##
## promiseオブジェクトを返却する ##
class IDO.tasks.TaskService
  getAll: ->
    IDO.request(
      type: 'GET',
      url: '/tasks.json',
      timeout: 10000
    )

  create: (formData) ->
    IDO.request(
      type: 'POST',
      url: '/tasks.json',
      dataType: 'json',
      data: formData,
      timeout: 10000
    )

## 関数定義 ##
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

IDO.tasks.afterCreating = ->
  # フォームをクリア
  $('#new_task').find('textarea, :text, select').val('')
  $('#task_status').find('option:first').prop('selected', true)

  # フォームを隠す
  $('#new-task-wrapper').toggleClass('hidden')

  # 通知を出してあげる
  toastr.options = {
    timeOut: 2000,
    positionClass: 'toast-top-center'
  }
  toastr.success('新しいタスクを登録しました！')

## 初期化関数は各画面で一度だけ呼ばれる！ ##

# /tasksの初期化関数
IDO.tasks.init = ->
  taskService = new IDO.tasks.TaskService()

  taskService.getAll().then((response) ->
    IDO.tasks.insertTask(response)
  )

  IDO.readyDatetimepicker()

  $('#new-form-link').on('click', (e) ->
    e.preventDefault()
    $('#new-task-wrapper').toggleClass('hidden')
  )

  $('#post-new-task').on('click', (e) ->
    e.preventDefault()

    formData = $('#new_task').serialize()
    taskService.create(formData).then((response) ->
      IDO.tasks.insertTask(response)
      IDO.tasks.afterCreating()
    )
  )

# /tasks/newの初期化関数
IDO.tasks.initNew = ->
  IDO.readyDatetimepicker()
