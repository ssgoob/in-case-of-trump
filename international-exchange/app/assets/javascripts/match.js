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
          $.ajax({
            url: url,
            type: 'POST',
            success: function(data){
              if (data.match.status === "pending i" || "pending c"){
                $('.like').text("Liked")
                    return false
              }
            }
        })
      })
    }  
  }  
}