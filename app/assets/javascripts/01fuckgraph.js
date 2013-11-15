    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {
  $('#chart').prepend('<img id="theImg1" src="assets/ajax-loader.gif">')

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
                    fillColor : "rgba(151,187,205,0.5)",
                    strokeColor : "rgba(151,187,205,1)",
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
  $(document).ajaxSuccess(function() {
    // alert("An individual AJAX call has completed successfully");
    $("#theImg1").hide();
    })
  })