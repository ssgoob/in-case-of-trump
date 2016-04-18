app.match = {
  model: {
    new: (function(){
      counter = 0
      var match = function Match(citizen_id, international_id, status) {
        this.citizen_id = citizen_id;
        this.international_id = international_id;
        this.status = status;
        var that = this;
        function initialize() {
          counter++
          that.id = counter;
          app.match.all.push(that);
        };
        initialize();
      }
      return match;
    }()),
  findBy: function findBy(attributeHash){
    var key = Object.keys(attributeHash)[0]
    var value = attributeHash[key]
    return grep(app.match.model.all, function(match){
      return match[key] == value;
    })
  }
},
  controller: {
    init: function(){
        $('.like').click(function(event){
          event.preventDefault();
          event.stopPropagation();
          var url;
          url = $(this).attr('href')
          if($(this).text() !== 'Chat'){
            $.ajax({
              url: url,
              type: 'POST',
              success: function(data){
                if (data.match.status === "pending i" || data.match.status === "pending c"){
                  $('.like').html('<a class="like" href="#"> <i class="fa fa-fire fa-2x" style="color: rgb(253, 82, 82);"></i><br style="color: rgb(253, 82, 82);">Liked</a>');
                  console.log("test")
                      return false
                } else if (data.match.status === "Matched") {
                  $('.like').html('<a class="like" href="#"> <i class="fa fa-fire fa-2x" style="color: rgb(253, 82, 82);"></i><br style="color: rgb(253, 82, 82);">Liked</a>');
                  console.log("test")
                  $('.like').parent().html('<a class="pro_buttons convo" href="#"> <i class="fa fa-comments fa-2x" style="color: rgb(253, 82, 82);"></i><br style="color: rgb(253, 82, 82);">Chat</a>')
                  $('.convo').attr('href','/conversations/' + data.conversation_id);
                }          
            }
          })
        }
      });
      $('.dislike').click(function(event){
        event.preventDefault();
        // event.stopPropagation();
        var url;
        url = $(this).attr('href')
        $.ajax({
          url: url,
          type: "POST"
        })
      });
      $(".pro_buttons").hover(
        function(){
          $(this).children().css("color", "white");
        },
        function () {
          $(this).children().css("color", "#FD5252");
        }
      );  
    }
}
}

 
  








