$(document).ready(function() {
  likes();

  $("body").on("click", ".friend", function() {
    likes_with_id(this.getAttribute("data-id"));
  });
});

likes_with_id = function(friend_id) {
  $.getJSON("/likes?friend_id=" + friend_id, function(datal){
   console.log(datal);
    var valuel = datal;
    $("#number").html(datal);
  });
}

likes = function() {
$.getJSON("/likes", function(datal){
   console.log(datal);
    var valuel = datal;
    $("#number").html(datal);
  });
}

