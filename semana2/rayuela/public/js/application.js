$(document).ready(function() {

	$("#start_btn").on("click", function(){	
			restart();
			
	});	

	var p1;
  var p2;
  var opcion;
	var num = 3;
	var win = 0;
	
  function inicio(){
    if (num == 0){
      $("#count").text("Empieza!");
      $("#start_btn").text("Reintentar");
      coin_1();
      coin_2();
    } else {
      $('td').removeClass('active');
      $('#p1_1').addClass('active');
      $('#p2_1').addClass('active');
      $("#count").text(num);
      num--;
      setTimeout(inicio, 1000);
    };
  };

  function restart(){
    $("#result").text("");
    $("td").removeClass("active");
    $("td:nth-child(2)").addClass("active");
    $(".table tr").removeClass("winner");
    inicio();
  }

	function coin_1(){
		 var td = $('#Player1').find('td.active')
   	 if (td.is('#p1_100')) {
		 		opcion = 1;
     		result();	
     } else {
      	$(td).removeClass('active');
      	$(td).next().addClass('active');
      	p1= setTimeout(coin_1, 1);
    }
  };

 function coin_2(){
		 var td = $('#Player2').find('td.active')
   	 if (td.is('#p2_100')) {
     opcion = 1;
     result();	
     } else {
      $(td).removeClass('active');
      $(td).next().addClass('active');
      p2 = setTimeout(coin_2, 1);
    }
  };

	$(document).keypress(function(e) {
		if(e.which == 97){
			clearTimeout(p1);
			opcion = 2;
			result();	
		}
		if(e.which == 109){
			clearTimeout(p2);
			opcion = 2;
			result();
		}
	});

	function result(){
		p1_active = parseInt($("#Player1").find('td.active').attr('id').slice(3));
		p2_active = parseInt($("#Player2").find('td.active').attr('id').slice(3));
  	
  	if (opcion == 1){
			if (p1_active == 100 && p2_active == 100){
		 		$("#result").text("AMBOS JUGADORES PERDIERON");
				 win = 0;
			};
		};	
		if (opcion == 2){
			if (p1_active == p2_active){
				$("#result").text("EMPATE");
         win = 1; 
			};	
			if (Math.abs(90 - p1_active) > Math.abs(90 - p2_active)){
					$("#result").text("GANA EL JUGADOR DOS");
					$("#Player2").addClass("winner");
				 win = 2;
			};
			if (Math.abs(90 - p1_active) < Math.abs(90 - p2_active)){
					$("#result").text("GANAN EL JUGARDOR UNO");	
					$("#Player1").addClass("winner");
				 win = 3;
	
			};
		};

   var game_id = $('.game_id').attr('id');
    $.post("/result", {"game_id": game_id, "winner": win, "score_p1" :p1_active, "score_p2" : p2_active}, function(data){  
 
 		});
};

});

	