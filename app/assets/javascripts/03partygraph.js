//////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {

  $.getJSON("/party")
    .done(function(data2){
    console.log("Fetched Party-Arty")
    var array_values3= new Array();
      for (var key in data2) {
        array_values3.push(data2[key])
      }
    console.log(array_values3)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

//////////////////////RADAR GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx3 = $("#myChart3").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data3 = {
      labels : ["Meh. MAYBE","SOCIAL","HERMIT"],
      datasets : [
        {
          fillColor : "rgba(255,0,0,0.5)",
          strokeColor : "rgba(255,0,0,1)",
          pointColor : "rgba(255,0,0,1)",
          pointStrokeColor : "#fff",
          data : array_values3
        }
      ]
    }

    //Create the chart
    new Chart(ctx3).Radar(data3);
});
  })