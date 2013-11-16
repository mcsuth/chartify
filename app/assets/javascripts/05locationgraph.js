    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {
  $('#chart2').prepend('<img id="theImg6" src="assets/ajax-loader.gif">')

  $.getJSON("/locations")
    .done(function(data5){
    console.log("Fetched Your locations")
    var array_values5= new Array();
      for (var key in data5) {
        array_values5.push(data5[key])
      }
    console.log(array_values5)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

//////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx5 = $("#myChart5").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data5 = [
      {
        value: array_values5[0],
        label: 'Your Checkins',
        color:"#F7464A",
        labelFontSize : '15',
        labelAlign: 'center'
      },
      {
        value : array_values5[1],
        label: 'Friends\' Checkins',
        color : "#E2EAE9",
        labelFontSize : '15',
        labelAlign: 'center'
      },
      // {
      //   value : 100,
      //   color : "#D4CCC5"
      // },
      // {
      //   value : 40,
      //   color : "#949FB1"
      // },
      // {
      //   value : 120,
      //   color : "#4D5360"
      // }

    ]

    //Create the chart
    new Chart(ctx5).Pie(data5);
});

  $(document).ajaxSuccess(function() {
    // alert("An individual AJAX call has completed successfully");
    $("#theImg6").hide();
    })


  })


