$(document).ready(function() {
  $.getJSON("/comments", function(datac){
    console.log(datac);
    var valuec = datac;


    console.log(valuec)


    var ctxlike = $("#comments").get(0).getContext("2d");

    var datac = {
      labels : ["Total comments"],
      datasets : [
                  {
                      fillColor : "rgba(151,187,205,0.5)",
                      strokeColor : "rgba(151,187,205,1)",
                      data : [valuec]
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
    scaleStepWidth : valuec,
    //Number - The scale starting value
    scaleStartValue : 0,


    };

    new Chart(ctxlike).Bar(datac, options);


  })
})
