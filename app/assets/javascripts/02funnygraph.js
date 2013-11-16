    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {
  $('#chart').prepend('<img id="theImg2" src="assets/ajax-loader.gif">')

  $.getJSON("/funny")
    .done(function(data2){
    console.log("Fetched Funny")
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
                    fillColor : '#F7464A',
                    strokeColor : '#FFF',
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
});
  $(document).ajaxSuccess(function() {
    // alert("An individual AJAX call has completed successfully");
    $("#theImg2").hide();
    })
  })