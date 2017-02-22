$(document).ready(function() {
  
  $("#slot-machine").submit(function(event){

    even.preventDefault();

     $.post("/rolls", function(data){
       $("#die").html(data);
     });
   });
});
