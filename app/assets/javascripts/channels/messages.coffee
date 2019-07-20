jQuery(() ->
  App.messages = App.cable.subscriptions.create {channel: 'MessagesChannel', id: $('#conversation_id').val() },
    received: (data) ->
      jQuery('#new_message')[0].reset()
      jQuery('#chat').append data.message
      updateScroll() 
)
