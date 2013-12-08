    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {
  user_likes();

  $("body").on("click", ".friend", function() {
    user_likes_with_id(this.getAttribute("data-id"));
  });

});

user_likes_with_id = function(friend_id) {
  $.getJSON("/user_likes?friend_id=" + friend_id).done(function(data7){
    var array_values7= new Array();
      for (var key in data7) {
        array_values7.push(data7[key])
      }

    //////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx7 = $("#myChart7").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data7 = {
      labels : ["Music","Books","Movies"],
      datasets : [
        {
          fillColor : "rgba(255,0,0,0.5)",
          strokeColor : "rgba(255,0,0,1)",
          pointColor : "rgba(255,0,0,1)",
          pointStrokeColor : "#fff",
          data : array_values7
        }
      ]
    }
    //Create the chart
    new Chart(ctx7).Radar(data7);
  });
}

user_likes = function() {
  $.getJSON("/user_likes")
    .done(function(data7){
    var array_values7= new Array();
      for (var key in data7) {
        array_values7.push(data7[key])
      }

    //////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx7 = $("#myChart7").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data7 = {
      labels : ["Music","Books","Movies"],
      datasets : [
        {
          fillColor : "rgba(255,0,0,0.5)",
          strokeColor : "rgba(255,0,0,1)",
          pointColor : "rgba(255,0,0,1)",
          pointStrokeColor : "#fff",
          data : array_values7
        }
      ]
    }
    //Create the chart
    new Chart(ctx7).Radar(data7);
  });
}

