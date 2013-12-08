    //////////////////////GETTING JSON DATA//////////////////////
$(document).ready(function() {
  love();

  $("body").on("click", ".friend", function() {
    love_with_id(this.getAttribute("data-id"));
  });
});

love_with_id = function(friend_id){
  $.getJSON("/love?friend_id=" + friend_id).done(function(data9){
    var array_values9 = new Array();
      for (var key in data9) {
        array_values9.push(data9[key])
      }
      

    //////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx9 = $("#myChart9").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data9 = [
      {
        value: array_values9[0],
        color:"#F7464A",
        label : 'In a domestic partnership',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      },
      {
        value : array_values9[1],
        color : "#E2EAE9",
        label : 'Married',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      },
      {
        value : array_values9[2],
        color : "#D4CCC5",
        label : 'Single',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      },
      {
        value : 0,//array_values9[3],
        color : "#E2EAE9",
        label : 'In a relationship',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      },
      {
        value : 0,//array_values9[4],
        color : "#D4CCC5",
        label : 'Engaged',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      }
    ]

    //Create the chart
    new Chart(ctx9).Pie(data9);
    
  });
}

love = function(){
  $.getJSON("/love")
    .done(function(data9){
    var array_values9= new Array();
      for (var key in data9) {
        console.log(data9[key]);
        array_values9.push(data9[key])
      }
      

    //////////////////////PIE GRAPH//////////////////////
    //Get context with jQuery - using jQuery's .get() method.
    var ctx9 = $("#myChart9").get(0).getContext("2d");

    //Create the data object to pass to the chart
    var data9 = [
      {
        value: array_values9[0],
        color:"#F7464A",
        label : 'In a domestic partnership',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      },
      {
        value : array_values9[1],
        color : "#E2EAE9",
        label : 'Married',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      },
      {
        value : array_values9[2],
        color : "#D4CCC5",
        label : 'Single',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      },
      {
        value : 0,//array_values9[3],
        color : "#E2EAE9",
        label : 'In a relationship',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      },
      {
        value : 0,//array_values9[4],
        color : "#D4CCC5",
        label : 'Engaged',
            labelColor : 'white',
            labelFontSize : '10',
            labelAlign: 'center'
      }
    ]

    //Create the chart
    new Chart(ctx9).Pie(data9);

  });
}

