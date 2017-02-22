$(document).ready(function() {
	$("#ingresar").on("click", function(event){
    event.preventDefault();
    var name = $("#name").val(); 
    var email = $("#email").val();
    var password = $("#password").val(); 
    $('#error p').children().remove;
    $('#error p').replaceWith("<p></p>");
    if (name == "" || email == "" || password == ""){
      $('#error p').append("Please fill in all fields.");
    } else if (email.match(/^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/) == null){
      $('#error p').append("Please enter a valid email.");
    } else if (password.length < 8){
      $('#error p').append("Please enter an 8 digit password.");
    } else if (password.match(/\d/) == null){
      $('#error p').append("Password must contain at least 1 number.");
    } else if (password.match(/[A-Z]/) == null){
      $('#error p').append("Password must contain at least 1 capital letter.");
    }
  });
});
