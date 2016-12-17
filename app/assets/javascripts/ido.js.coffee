window.IDO = {}

IDO.request = (params) ->
  toggleLoader()
  $.ajax(params).fail((xhr, statusText, errorThrown) ->
    alert "#{statusText}: データの取得に失敗しました。"
    console.log errorThrown
  ).always((response, statusText, obj) ->
    toggleLoader()
    console.log '通信が完了しました。'
  )

IDO.readyDatetimepicker = ->
  flatpickr('.calendar', {
    enableTime: true
  })

toggleLoader = ->
  $('.submit-wrapper .now-loading').toggleClass('hidden')
  $('.submit-wrapper .loader').toggleClass('hidden')
