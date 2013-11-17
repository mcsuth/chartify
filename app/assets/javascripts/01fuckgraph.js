    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {

  $.getJSON("/vulgar")
    .done(function(data){
    console.log("Fetched Vulgar!!!")
    // console.log(data);
    var array_values = new Array();
      for (var key in data) {
        array_values.push(data[key])
      }
    console.log(array_values)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

    //////////////////////BAR GRAPH//////////////////////
    //Get the context of the canvas element we want to select
    var ctx = $("#myChart").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data = {
      labels : ["FUCK", "SHIT", "CUNT", "MOTHER FUCKER"],
      datasets : [
                  {
                    fillColor : '#F7464A',
                    strokeColor : '#FFF',
                    data : array_values
                  },
                 ]
    };

    //The options we are going to pass to the chart
    options = {
    };

    //Create the chart
    new Chart(ctx).Bar(data, options);
    // console.log(ctx)

});
  })