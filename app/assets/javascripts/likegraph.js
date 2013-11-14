$(document).ready(function() {
  $.getJSON("/likes", function(data){
    var value = @likes[:likes].length
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