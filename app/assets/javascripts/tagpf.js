$(document).ready(function() {
  tags_per_friend();
  
  $("body").on("click", ".friend", function() {
    tags_per_friend_with_id(this.getAttribute("data-id"));
  });
});

tags_per_friend_with_id = function(friend_id) {
  $.getJSON("/tags_per_friend?friend_id=" + friend_id, function(datatpf){
    console.log(datatpf);
    var valuetpf = datatpf;


    console.log(valuetpf)


    var ctxtagspf = $("#tagpf").get(0).getContext("2d");

    var datatpf = {
      labels : valuetpf[0],
      datasets : [
                  {
                      fillColor : "#F7464A",
                      strokeColor : "#F7464A",
                      data : valuetpf[1]
                  },
                 ]
    };


    options = {

    showLabelsOnBars:true,
    barLabelFontColor:"blue",


    };

    new Chart(ctxtagspf).Bar(datatpf, options);


  });
}

tags_per_friend = function() {
  $.getJSON("/tags_per_friend", function(datatpf){
    console.log(datatpf);
    var valuetpf = datatpf;


    console.log(valuetpf)


    var ctxtagspf = $("#tagpf").get(0).getContext("2d");

    var datatpf = {
      labels : valuetpf[0],
      datasets : [
                  {
                      fillColor : "#F7464A",
                      strokeColor : "#F7464A",
                      data : valuetpf[1]
                  },
                 ]
    };


    options = {

    showLabelsOnBars:true,
    barLabelFontColor:"blue",


    };

    new Chart(ctxtagspf).Bar(datatpf, options);


  });
}
