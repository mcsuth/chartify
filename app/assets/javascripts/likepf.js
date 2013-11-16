$(document).ready(function() {
  $.getJSON("/likes_per_friend", function(datalpf){
    console.log(datalpf);
    var valuelpf = datalpf;


    console.log(valuelpf)


    var ctxlikepf = $("#likepf").get(0).getContext("2d");

    var datalpf = {
      labels : valuelpf[0],
      datasets : [
                  {
                      fillColor : "rgba(151,187,205,0.5)",
                      strokeColor : "rgba(151,187,205,1)",
                      data : valuelpf[1]
                  },
                 ]
    };


    options = {

    showLabelsOnBars:true,
    barLabelFontColor:"blue",


    };

    new Chart(ctxlikepf).Bar(datalpf, options);


  })
})
