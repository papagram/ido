test = ->
  $.ajax({
    type: 'GET',
    url: '/trainings/message.json',
    timeout: 10000
  })

$ ->
  $ '#test'
    .on 'click', ->
      test()
        .done(
          (response, statusText, xhr) ->
            $('#message').text(response.message)
        ).fail(
          (xhr, statusText, errorThrown) ->
            alert "#{statusText}: データの取得に失敗しました。"
            console.log errorThrown
        ).always(
          (response, statusText, obj) ->
            console.log '通信が完了しました。'
        )
