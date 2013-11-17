$(document).ready(function() {
  $.getJSON("/likes", function(datal){
    console.log(datal);
    var valuel = datal;


    console.log(valuel)


    var ctxlike = $("#likes").get(0).getContext("2d");

    var datal = {
      labels : ["Total Likes"],
      datasets : [
                  {
                      fillColor : "rgba(151,187,205,0.5)",
                      strokeColor : "rgba(151,187,205,1)",
                      data : [valuel]
                  },
                 ]
    };

    options = {

    showLabelsOnBars:true,
    barLabelFontColor:"blue",


    //Boolean - If we want to override with a hard coded scale
    scaleOverride : true,

    //** Required if scaleOverride is true **
    //Number - The number of steps in a hard coded scale
    scaleSteps : 1,
    //Number - The value jump in the hard coded scale
    scaleStepWidth : valuel,
    //Number - The scale starting value
    scaleStartValue : 0,


    };

    new Chart(ctxlike).Bar(datal, options);


  })
})
