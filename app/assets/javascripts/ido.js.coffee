window.IDO = {}

IDO.request = (params) ->
  $.ajax(params).fail((xhr, statusText, errorThrown) ->
    alert "#{statusText}: データの取得に失敗しました。"
    console.log errorThrown
  ).always((response, statusText, obj) ->
    console.log '通信が完了しました。'
  )
