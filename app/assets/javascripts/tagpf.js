$(document).ready(function() {
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


  })
})
