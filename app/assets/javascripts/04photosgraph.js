    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {

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
            color:"#F7464A",
            label : 'U WERE TAGGED',
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
          },
          // {
          //   value : array_values4[1],
          //   color : "#E2EAE9",
          //   label : 'WHO LIKED UR SHIT',
          //   labelColor : '#444',
          //   labelFontSize : '15',
          //   labelAlign: 'center'
          // },
          {
            value : 5,
            color : "#D4CCC5",
            label : 'YOUR ALBUMS',
            labelColor : 'rgb(0,0,0)',
            labelFontSize : '15',
            labelAlign: 'center'
          }
      ]

    //Create the chart
    new Chart(ctx4).Pie(data4);

});
  })