$(document).ready(function() {
  $("[data-toggle]").click(function() {
    var toggle_el = $(this).data("toggle");
    $(toggle_el).toggleClass("open-sidebar");
  });

$(".swipe-area").swipe({
    swipeStatus:function(event, phase, direction, distance, duration, fingers)
        {
            if (phase=="move" && direction =="right") {
                 $(".container").addClass("open-sidebar");
                 return false;
            }
            if (phase=="move" && direction =="left") {
                 $(".container").removeClass("open-sidebar");
                 return false;
            }
        }
});

$('#search').keyup(function() {
     //targets button element with id search, binds keyup element
    // console.log("nerklrnlek")
    console.log("basdfasdf")


      var searchField = $('#search').val(); //targets div with id of search and gets value in the field. console.log to see text appear in dom
     //var searchField =  $("#searchField").html(searchField);
     var myExp = new RegExp(searchField, "i"); //search function: looks for a string and finds text inside the string and returns its position. Can search for txt inside a string or use a regular expression, which allows for case insensitive
   $.getJSON('json', function(data) {
         var output = '<ul class="searchresults">';
          $.each(data, function(key, val) {
               if ((val.username.search(myExp) != -1)) {
                  output += '<li>';
                  output += '<img src="' + val["profile_picture"] + '">'
                  output += '<div id="searchresults-name">' + val.username +'</div>';
                  output += '</li>';
               }
          });
          output += '</ul>';
          console.log(output)
          $('#searchField').html(output);
     }); //get JSON
});


//binding friend search field

//keyup happens when someone lifts up a key on the keyboard




});

