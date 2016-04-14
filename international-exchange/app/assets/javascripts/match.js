// app.match = {
//   model: {
//     new: (function(){
//       counter = 0
//       var match = function Match(citizen_id, international_id, status) {
//         this.citizen_id = citizen_id;
//         this.international_id = international_id;
//         this.status = status;
//         var that = this;
//         function initialize() {
//           counter++
//           that.id = counter;
//           app.match.all.push(that);
//         };
//         initialize();
//       }
//       return match;
//     }()),
//   findBy: function findBy(attributeHash){
//     var key = Object.keys(attributeHash)[0]
//     var value = attributeHash[key]
//     return grep(app.match.model.all, function(match){
//       return match[key] == value;
//     })
//   }
// },
//   controller: {
// <<<<<<< HEAD
//     init: function(){
//         debugger;
//         $(".like_box a").click(function(){
          
// =======
//     init: {
//         var $like = $('a');
//         $("body").click(function(){
// >>>>>>> 6d815a2006fcb2ae13c264c6b372a2bb3270ce03
//           event.preventDefault();
//           event.stopPropagation();
//           var url;

//           url = this.attr('href')
//           $.ajax({
//             url: url,
//             type: 'POST',
//             success: function(data){
//               if (data.status === "pending i" || "pending c"){
//                 $("body > div > div > div > ul.nav.nav-pills > li:nth-child(3) > a").text("Liked")
//                     return false

//               }


//               // $("body > div > div > div > ul.nav.nav-pills > li:nth-child(3) > a").text('Liked');
//             }


//             // success: function(data){
//             //   for(var i = 0; i < data.all_lists.length; i++) {
//             //     $('#select_list').append(data.all_lists[i])
//             //   }
//             // }
//         })
//       })
//     }
      
//   }  
// }