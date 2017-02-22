// $(document).ready(function () {
//   // Escribe tu código aquí
// });

$(document).ready(function(){
	
	$('.tabs li.active').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('.tabs li.active ').removeClass('current');
		$('.tab').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})