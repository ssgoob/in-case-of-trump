app.interest = {
  model: {
    all: [],
    new: (function(){
      counter = 0
      var interest = function Interest(interest_name){
        this.interest_name = interest_name
        var that = this
        function initialize() {
          counter++
          that.id = counter;
          app.interest.all.push(that);
        };
        initialize();
      }
      return interest
    }()),

    findBy: function findBy(attributeHash){
      var key = Object.keys(attributeHash)[0]
      var value = attributeHash[key]
      return grep(app.interest.model.all, function(interest){
        return interest[key] == value;
      })    
    }
  }
}





