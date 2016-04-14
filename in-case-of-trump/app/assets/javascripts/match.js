app.match = {
  model: {
    // all: [],
    new: (function(){
      counter = 0
      var match = function Match(citizen_id, international_id, status) {
        this.citizen_id = citizen_id
        this.international_id = international_id
        this.status = status
        var that = this
        function initialize() {
          counter++
          that.id = counter;
          app.match.all.push(that);
        };
        initialize();
      }
      return match
    }()),

    findBy: function findBy(attributeHash){
      var key = Object.keys(attributeHash)[0]
      var value = attributeHash[key]
      return grep(app.match.model.all, function(match){
        return match[key] == value;
      })    
    }

    // update: function Update() 
    //app.match.model.new = function int
  },

  controller: {
    init: {
        var $like = $('a's);
        $("body").click(function(){
          event.preventDefault();
          var url;
          url = this.attr('href')
             debugger;
          $.ajax({
            url: url,
            type: 'POST'
            // success: function(data){
            //   for(var i = 0; i < data.all_lists.length; i++) {
            //     $('#select_list').append(data.all_lists[i])
            //   }
            // }
        })
      })
    }  
  }
}