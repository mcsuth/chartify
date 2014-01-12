// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require chart.min.js
//= require jquery.touchSwipe.js
//= require sidebar.js
//= require likepf.js
//= require tagpf.js
//= require likegraph.js
//= require 06graph.js
//= require 07graph.js
//= require 08graph.js
//= require 09graph.js
//= require 10graph.js
//= require_self

$(document).ready(function() {
	setTimeout(
		function(){
			if($("#reload").html() == "0"){
				window.location.reload();
			}
		}
		, 30000);
});