$(document).ready(function(){
	$('input[type=submit]').on("click", function(event){
		event.preventDefault();
		var sel = $('input[name=selector]').val();		
		console.log(sel);
		var prop = $('input[name=property]').val();
		console.log(prop);
		var val = $('input[name=value]').val();	
		console.log(val);
		$(sel).css(prop, val);
	});
});
