//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $("#slot-machine").on("submit", function(event) {
    event.preventDefault();
    $.post("rolls#rolling", function(data) {
    console.log(data);
    $( "#die" ).html(data);
    });
   });
});