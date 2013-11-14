$(document).ready(function() {
  $.getJSON("/likes", function(count){
    var value = new Array();
      for (var key in count) {
        array_values.push(count[key])
      }
    console.log(value)


    var ctx = $("likes").get(0).getContext("2d");

    var data = {
      labels : ["Likes"],
      datasets : [
                  {
                      fillColor : "rgba(151,187,205,0.5)",
                      strokeColor : "rgba(151,187,205,1)",
                      data : value
                  },
                 ]
    };

    options = {
    };

    new Chart(ctx).Bar(data, options);


  })
})