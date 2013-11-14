//   $(document).ready(function() {

//     // $.getJson("/vulgarfun", function(data) {
//     //     console.log(data)
//     // })

//   // $.getJSON("/vulgarfun", function(data){
//   //   $.each(data, function(key, value){
//   //       // console.log(value);

//   //   });
//   // });

// //////////////////////LINE GRAPH//////////////////////

//     //Get context with jQuery - using jQuery's .get() method.
//     var ctx2 = $("#myChart2").get(0).getContext("2d");

//     //Create the data object to pass to the chart
//     var data2 = {
//       labels : ["Status #7","Status #6","Status #5","Status #4","Status #3","Status #2","Status #1"],
//       datasets : [
//         {
//           fillColor : "rgba(0,204,204,0.5)",
//           strokeColor : "rgba(0,204,204,1)",
//           pointColor : "rgba(0,204,204,1)",
//           pointStrokeColor : "#fff",
//           data : [1,2,3,4,5,6,7]
//         }
//       ]
//     }

//     //Create the chart
//     new Chart(ctx2).Line(data2);

//   // $.getJSON("/vulgarfun", function(data){
//   //   // debugger
//   //   console.log(data);
//   //   var a = data;
//   //   var array_values = new Array();
//   //   // $.each(data, function(key, value){
//   //     for (var key in data) {
//   //       array_values.push(data[key]);
//   //     }
//   //     console.log(array_values)
// //////////////////////BAR GRAPH//////////////////////
//     //Get the context of the canvas element we want to select
//     var ctx = $("#myChart").get(0).getContext("2d");

//     //Create the data object to pass to the chart
//     var data = {
//       labels : ["FUCK", "SHIT", "CUNT", "MOTHER FUCKER"],
//       datasets : [
//                   {
//                       fillColor : "rgba(151,187,205,0.5)",
//                       strokeColor : "rgba(151,187,205,1)",
//                       data : [1,2,3,4]
//                   },
//                  ]
//     };

//     //The options we are going to pass to the chart
//     options = {
//         scaleOverride : true,
//         //** Required if scaleOverride is true **
//         //Number - The number of steps in a hard coded scale
//         scaleSteps : null,
//         //Number - The value jump in the hard coded scale
//         scaleStepWidth : null,
//         //Number - The scale starting value
//         scaleStartValue : null,
//     };

//     //Create the chart
//     new Chart(ctx).Bar(data, options);
//     // console.log(ctx)

//     });
//   });

// //////////////////////RADAR GRAPH//////////////////////
//     //Get context with jQuery - using jQuery's .get() method.
//     var ctx3 = $("#myChart3").get(0).getContext("2d");

//     //Create the data object to pass to the chart
//     var data3 = {
//       labels : ["OUTGOING","HERMIT","BALANCED"],
//       datasets : [
//         {
//           fillColor : "rgba(255,0,0,0.5)",
//           strokeColor : "rgba(255,0,0,1)",
//           pointColor : "rgba(255,0,0,1)",
//           pointStrokeColor : "#fff",
//           data : [24,32,60]
//         }
//       ]
//     }

//     //Create the chart
//     new Chart(ctx3).Radar(data3);

// //////////////////////POLAR GRAPH//////////////////////
//     //Get context with jQuery - using jQuery's .get() method.
//     var ctx4 = $("#myChart4").get(0).getContext("2d");

//     //Create the data object to pass to the chart
//     var data4 = [
//       {
//         value : 30,
//         color: "#D97041"
//       },
//       {
//         value : 90,
//         color: "#C7604C"
//       },
//       {
//         value : 24,
//         color: "#21323D"
//       },
//       {
//         value : 58,
//         color: "#9D9B7F"
//       },
//       {
//         value : 82,
//         color: "#7D4F6D"
//       },
//       {
//         value : 8,
//         color: "#584A5E"
//       }
//     ]

//     //Create the chart
//     new Chart(ctx4).PolarArea(data4);

// //////////////////////PIE GRAPH//////////////////////
//     //Get context with jQuery - using jQuery's .get() method.
//     var ctx5 = $("#myChart5").get(0).getContext("2d");

//     //Create the data object to pass to the chart
//     var data5 = [
//       {
//         value: 30,
//         color:"#F38630"
//       },
//       {
//         value : 50,
//         color : "#E0E4CC"
//       },
//       {
//         value : 100,
//         color : "#69D2E7"
//       }
//     ]

//     //Create the chart
//     new Chart(ctx5).Pie(data5);

// //////////////////////POLAR GRAPH//////////////////////
//     //Get context with jQuery - using jQuery's .get() method.
//     var ctx6 = $("#myChart6").get(0).getContext("2d");

//     //Create the data object to pass to the chart
//     var data6 = [
//       {
//         value: 30,
//         color:"#F7464A"
//       },
//       {
//         value : 50,
//         color : "#E2EAE9"
//       },
//       {
//         value : 100,
//         color : "#D4CCC5"
//       },
//       {
//         value : 40,
//         color : "#949FB1"
//       },
//       {
//         value : 120,
//         color : "#4D5360"
//       }

//     ]

//     //Create the chart
//     new Chart(ctx6).Doughnut(data6);


// //   }
// // );