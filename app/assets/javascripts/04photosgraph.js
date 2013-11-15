    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {
  $('#chart2').prepend('<img id="theImg4" src="assets/ajax-loader.gif">')

  $.getJSON("/photos")
    .done(function(data4){
    console.log("Fetched Your Photos")
    var array_values4= new Array();
      for (var key in data4) {
        array_values4.push(data4[key])
      }
    console.log(array_values4)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

//////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx4 = $("#myChart4").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data4 = [
          {
            value : array_values4[0],
            color : "#F38630",
            label : 'U WERE TAGGED',
            labelColor : 'white',
            labelFontSize : '9',
            labelAlign: 'center'
          },
          {
            value : array_values4[1],
            color : "#E0E4CC",
            label : 'WHO LIKED UR SHIT',
            labelColor : '#444',
            labelFontSize : '9',
            labelAlign: 'center'
          },
          {
            value : 5,
            color : "#69D2E7",
            label : 'YOUR ALBUMS',
            labelColor : 'rgb(0,0,0)',
            labelFontSize : '9',
            labelAlign: 'center'
          }
      ]

    //Create the chart
    new Chart(ctx4).Pie(data4);

});
  $(document).ajaxSuccess(function() {
    // alert("An individual AJAX call has completed successfully");
    $("#theImg4").hide();
    })
  })