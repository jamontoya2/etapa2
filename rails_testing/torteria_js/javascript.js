$( document ).ready(function() {
	$('.create-oven').on('submit', function(event){
		event.preventDefault();
		$('.create-oven').css('visibility', 'hidden');
		$('.oven').css('visibility', 'visible');
		$('#history').css('visibility', 'visible');
    $('#cook').css('visibility', 'visible');

			$('.oven').on('submit', function(event){
				event.preventDefault();
				if(!$('#type').val() || !$('#time').val()){
      		$('#timer p').html('Please fill in all values');
 				}		

			});	
				
		
		function valid(field){	
			var textVal = document.getElementById(field).value;
			if (!textVal.match(/\S/)){
				alert("field is blank");
				return false;	
			}
			else{
				return true;
			}
		}  


		//class torta {
			function torta(type){
					this.type = type;
					this.milanesa = 10;
					this.jamon = 5;
					this.chorizo = 3;	
				};
		






	});	
		

});

