    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {

  $.getJSON("/gender")
    .done(function(data10){
    console.log("Fetched Your Friends' Sex")
    var array_values10= new Array();
      for (var key in data10) {
        array_values10.push(data10[key])
      }
    console.log(data10)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

//////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx10 = $("#myChart10").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data10 = [
      {
        value: array_values10[0],
        color:"#F7464A",
        label : 'Males',
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
      },
      {
        value : array_values10[1],
        color : "#E2EAE9",
        label : 'Females',
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
      }
    ]

    //Create the chart
    new Chart(ctx10).Pie(data10);
});
  })


