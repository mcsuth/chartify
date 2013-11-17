    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {

  $.getJSON("/user_likes")
    .done(function(data7){
    console.log("Fetched What You Liked")
    var array_values7= new Array();
      for (var key in data7) {
        array_values7.push(data7[key])
      }
    console.log(array_values7)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

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
  })


