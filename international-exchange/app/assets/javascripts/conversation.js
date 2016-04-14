$(function(){
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
    })
    setInterval(onTick, 3000);
  })
})

function onTick() {
  var conversationPath = window.location.pathname;
  $.ajax({
    url: conversationPath+'/messages'
  }).success(function(data){
    refreshChat(data.messages);
  })
}

function refreshChat(data) {
  $('.chatbox').empty();
    for(var i = 0; i < data.length; i++){
      var html = data[i]+'<hr>';
      $('.chatbox').append(html);
    }
}