$(document).ready(function() {
  likes_per_friend();

  $("body").on("click", ".friend", function() {
    likes_per_friend_with_id(this.getAttribute("data-id"));
  });
});

likes_per_friend_with_id = function(friend_id) {
  $.getJSON("/likes_per_friend?friend_id=" + friend_id, function(datalpf){
    var valuelpf = datalpf;

    var ctxlikepf = $("#likepf").get(0).getContext("2d");

    var datalpf = {
      labels : valuelpf[0],
      datasets : [
                  {
                      fillColor : "#F7464A",
                      strokeColor : "#F7464A",
                      data : valuelpf[1]
                  },
                 ]
    };


    options = {

    showLabelsOnBars:true,
    barLabelFontColor:"blue",


    };

    new Chart(ctxlikepf).Bar(datalpf, options);
  });
}

likes_per_friend = function() {
  $.getJSON("/likes_per_friend", function(datalpf){
    var valuelpf = datalpf;

    var ctxlikepf = $("#likepf").get(0).getContext("2d");

    var datalpf = {
      labels : valuelpf[0],
      datasets : [
                  {
                      fillColor : "#F7464A",
                      strokeColor : "#F7464A",
                      data : valuelpf[1]
                  },
                 ]
    };


    options = {

    showLabelsOnBars:true,
    barLabelFontColor:"blue",


    };

    new Chart(ctxlikepf).Bar(datalpf, options);
  });
}