$(document).ready(function() {

  cultured();

  $("body").on("click", ".friend", function() {
    cultured_with_id(this.getAttribute("data-id"));
  });
});

cultured_with_id = function(friend_id) {
  console.log("Hello, world!")
  $.getJSON("/cultured?friend_id=" + friend_id, function(data6){
    console.log("Fetched Your languages")
    var array_values6= new Array();
      for (var key in data6) {
        array_values6.push(data6[key])
      }

    console.log(array_values6)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

//////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx6 = $("#myChart6").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data6 = [
      {
        value: array_values6[0][1],
        color:"#F7464A",
        label : array_values6[0][0],
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
      },
      {
        value : array_values6[1][1],
        color : "#E2EAE9",
        label : array_values6[1][0],
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
      },
      {
        value : array_values6[2][1],
        color : "#D4CCC5",
        label : array_values6[2][0],
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
      }
    ]

    //Create the chart
    new Chart(ctx6).Pie(data6);
});
}
//////
cultured = function() {
  $.getJSON("/cultured")
    .done(function(data6){
    console.log("Fetched Your languages")
    var array_values6= new Array();
      for (var key in data6) {
        array_values6.push(data6[key])
      }
    console.log(array_values6)
    // THIS WORKS AND SHOWS AN ARRAY OF SHITTY NUMBERS

//////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx6 = $("#myChart6").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data6 = [
      {
        value: array_values6[0][1],
        color:"#F7464A",
        label : array_values6[0][0],
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
      },
      {
        value : array_values6[1][1],
        color : "#E2EAE9",
        label : array_values6[1][0],
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
      },
      {
        value : array_values6[2][1],
        color : "#D4CCC5",
        label : array_values6[2][0],
            labelColor : 'white',
            labelFontSize : '15',
            labelAlign: 'center'
      }
    ]

    //Create the chart
    new Chart(ctx6).Pie(data6);
  });
}
