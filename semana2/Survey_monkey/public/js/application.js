$(document).ready(function() {
  $("#btn_add_question").hide();
  $('#btn_done_question').hide();
  $('#btn_add_choice').hide();
  $("#btn_complete_survey").hide();
 
  var name = [];
  var Q_array = [];
  var P_array = []; 
  var counter_Quest = 0;
  var counterOp = 0;
  
  $('#btn_start').on("click", function(){
    start();
  });

  $('#btn_add_question').on("click", function(){
    $("#btn_done_question").show();
    $("#btn_add_question").hide();
    $("#btn_add_choice").show(); 
    addOp();
  });

  $('#btn_add_choice').on('click', function(){
    addOp();
  });

  $('#btn_done_question').on('click', function(){
    $(this).hide();
    $("#btn_add_choice").hide();
    $("#btn_add_question").show();
    $('#last_input').remove();
    P_array.push(Q_array);
    Q_array=[];
    addQ();
  });

  $('#btn_complete_survey').on('click', function(event){
    event.preventDefault();
      $.post('/create/survey', {P_array}, function(data){
      
      });
  });

  function start(){
    $("#email_user").remove();
    var newinput = "<input type='text' placeholder='Type Question Here " + (counter_Quest + 1) + "' id='last_input' name='Title" + (counter_Quest + 1) + "'><ol  id='olQ" + (counter_Quest + 1) + "'></ol>";
    $('#dynamicInput').append(newinput);  
    var input = $('#last_input').val();
    $('#last_input').replaceWith("<p id='name'>" + input + "</p>");
    $('#btn_start').hide();
    $('#btn_add_question').show();
    $('#btn_complete_survey').show();         
    name.push(input);
    P_array.push(name);
    counter_Quest++;
  }

  function addOp(){      
    var input = $('#last_input').val()
    $('#last_input').replaceWith("<li id='" + $('#last_input').attr('name') + "'>" + input + "</li>");
    Q_array.push(input);
    var newinput = "<input type='text' placeholder='Type Choice Here" + (counterOp + 1) + "' id='last_input' name='option" + counter_Quest + (counterOp + 1) + "'>";
    $("#dynamicInput #olQ" + counter_Quest + "").append(newinput);
    counterOp++;         
  }

  function addQ(){
    $("#btn_done_question").attr("value", "Done with Question");
    var option = $('#last_input').val()
    $('#last_input').replaceWith("<li id=" + $('#last_input').attr('name') + ">" + option + "</li>");
    counterOp = 0;
    var newinput = "<input type='text' placeholder='Question " + (counter_Quest + 1) + "' id='last_input' name='question" + (counter_Quest + 1) + "'><ol id='olQ" + (counter_Quest + 1) + "'></ol>";
    $('#dynamicInput').append(newinput);
    $('#nxt_q').replaceWith("<input id='nxt_op' type='button' name='nxt_op' value='AddOption'>");
    counter_Quest++;             
  }
});
