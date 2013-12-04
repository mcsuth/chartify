$(document).ready(function(){

  //GET BROWSER WINDOW HEIGHT
  var currHeight = $(window).height();
  //SET HEIGHT OF SIDEBAR AND CONTENT ELEMENTS
  $('#sidebar, .main-content').css('height', currHeight);

  //ON RESIZE OF WINDOW
  $(window).resize(function() {

    //GET NEW HEIGHT
    var currHeight = $(window).height();
    //RESIZE BOTH ELEMENTS TO NEW HEIGHT
    $('#sidebar, .main-content').css('height', currHeight);

  });


  //JQUERY MASONRY

  var container = document.querySelector('#yield');
   msnry = new Masonry( container, {
    columnWidth: 339,
    itemSelector: '.chart-box'
  });



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

  var searchField = $('#chartifysearch').val();
  var myExp = new RegExp(searchField, "i"); //search function: looks for a string and finds text inside the string and returns its position. Can search for txt inside a string or use a regular expression, which allows for case insensitive
  $.getJSON('friends_on_chartify', function(data) {
    var output = '<ul class="chartifyresults">';
    $.each(data, function(key, val) {
      if ((val.username.search(myExp) != -1)) {
        output += '<li class="friend" data-id=' + val["facebook_id"] + '>';
        output += '<img src="' + val["profile_picture"] + '">'
        output += '<div id="searchresults-name">' + '<a href="#">' + val["username"] + '</a>' +'</div>';
        output += '</li>';
      }
    });
    output += '</ul>';
    console.log(output)
    $('#chartifyField').html(output);
  }); //get JSON

  $('#chartifysearch').keyup(function() {

    var searchField = $('#chartifysearch').val();
    console.log($('#chartifysearch').val())
    var myExp = new RegExp(searchField, "i"); //search function: looks for a string and finds text inside the string and returns its position. Can search for txt inside a string or use a regular expression, which allows for case insensitive
    $.getJSON('friends_on_chartify', function(data) {
      var output = '<ul class="searchresults">';
      $.each(data, function(key, val) {
        if ((val.username.search(myExp) != -1)) {
          output += '<li>';
          output += '<img src="' + val["profile_picture"] + '">'
          output += '<div id="searchresults-name">' + '<a href="#">' + val["username"] + '</a>' +'</div>';
          output += '</li>';
        }
      })
      output += '</ul>';
      console.log("The output is", output)
      $('#chartifyField').html(output);
    }); //get JSON
  });

FB.init({
  appId:'500853090012906',
  cookie:true,
  status:true,
  xfbml:true
});

function FacebookInviteFriends() {
  FB.ui({
  method: 'apprequests',
  message: 'Chartify makes charts and graphs out of your facebook stuff, pretty cool! http://chartify.me'
  });
}



//   var searchField = $('#search').val();
//   var myExp = new RegExp(searchField, "i"); //search function: looks for a string and finds text inside the string and returns its position. Can search for txt inside a string or use a regular expression, which allows for case insensitive
//   $.getJSON('friends_off_chartify', function(data) {
//     var output = '<ul class="searchresults">';
//     $.each(data, function(key, val) {
//       if ((val.username.search(myExp) != -1)) {
//         output += '<li>';
//         output += '<img src="' + val["profile_picture"] + '">'
//         output += '<div id="searchresults-name">' + '<a href="#">' + val["username"] + '</a>' +'</div>';
//         output += '<input type="checkbox" name="test" id="searchresults-checkbox">';
//         output += '</li>';
//       }
//     });
//     output += '</ul>';
//     console.log(output)
//     $('#searchField').html(output);
//   }); //get JSON

//   $('#search').keyup(function() {

//     var searchField = $('#search').val();
//     var myExp = new RegExp(searchField, "i"); //search function: looks for a string and finds text inside the string and returns its position. Can search for txt inside a string or use a regular expression, which allows for case insensitive
//     $.getJSON('friends_off_chartify', function(data) {
//       var output = '<ul class="searchresults">';
//       $.each(data, function(key, val) {
//         if ((val.username.search(myExp) != -1)) {
//           output += '<li>';
//           output += '<img src="' + val["profile_picture"] + '">'
//           output += '<div id="searchresults-name">' + '<a href="#">' + val["username"] + '</a>' +'</div>';
//           output += '<input type="checkbox" name="test" id="searchresults-checkbox">';
//           output += '</li>';
//         }
//       });
//       output += '</ul>';
//       console.log(output)
//       $('#searchField').html(output);
//     }); //get JSON
//   });


// //binding friend search field

// //keyup happens when someone lifts up a key on the keyboard




});

