$(function(){
  if($('.conversation').length > 0){
    $('.conversation').ready(function(){
      onTick();
      $('.new_message').on('submit', function(event){
        event.preventDefault();
        event.stopPropagation();
        var conversationId = window.location.pathname.split('/').pop();
        var user_id = $('a').filter(function(index) { return $(this).text() === "My Profile"; }).attr('href').split('/').pop();
        var content = $('#message_content').val();
        $.ajax({
          url: '/messages',
          method: 'POST',
          data: {message: {conversation_id: conversationId, content: content, user_id: user_id}}
        }).success(function(data){
          refreshChat(data.messages);
          $('#message_content').val("");
        })
      });
      $('.new_message').on('keydown', function(event){
        if(event.which == 13)
          $('.new_message').submit();
      });
      var refresher = setInterval(onTick, 3000);
    })
  }
})

function onTick() {
  if($('.conversation').length > 0){
    var conversationPath = window.location.pathname;
    $.ajax({
      url: conversationPath+'/messages'
    }).success(function(data){
      refreshChat(data.messages);
    })
  }
}

function refreshChat(data) {
  $('.chatbox').empty();
    for(var i = 0; i < data.length; i++){
      var html = data[i]+'<hr>';
      $('.chatbox').append(html);
    }
}