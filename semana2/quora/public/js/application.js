$(document).ready(function() {

   $(".form_vote").on("submit", function(event){
    event.preventDefault();
    id = $(this).serialize();
    $.post('/count/question/votes',id, function(data){
      //$("#vq" + id.slice(-1)).text("[" + data + " votes]");
      $("#btn_vote" + id.slice(-1)).text(data);
   });
  });


   $(".form_vote_ans").on("submit", function(event){
    event.preventDefault();
    id = $(this).serialize();
    $.post('/count/answer/votes',id, function(data){
      //$("#vq" + id.slice(-1)).text("[" + data + " votes]");
      $("#btn_vote" + id.slice(-1)).text(data);
   });
  });



});



