    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {
  console.log("funny graph is being built");
  $.getJSON("/funny", function(data2){
    // console.log(data2);
    var array_values2 = new Array();
      for (var key in data2) {
        array_values2.push(data2[key])
      }
    console.log(array_values2)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

    //////////////////////BAR GRAPH//////////////////////
    //Get the context of the canvas element we want to select
    var ctx2 = $("#myChart2").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data2 = {
      labels : ["FUNNY", "LOL", "HAHA", "LMAO"],
      datasets : [
                  {
                      fillColor : "rgba(151,187,205,0.5)",
                      strokeColor : "rgba(151,187,205,1)",
                      data : array_values2
                  },
                 ]
    };

    //The options we are going to pass to the chart
    options = {
    };

    //Create the chart
    new Chart(ctx2).Bar(data2, options);
    // console.log(ctx2)


  })
})