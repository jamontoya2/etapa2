$(document).ready(function(){
array = [];	
	$(".container").on("click", "#new_comment_button", function(event){
		event.preventDefault();
		create_form();
		$(this).hide();
			$('input[type=submit]').on("click", function(event){
				event.preventDefault();
				var text_comment = $('textarea[name="text_comment"]').val();
				var text_author = $('input[name="author"]').val();
				array.push(text_comment);
				array.push(text_author);
					$.post('/record', {array}, function(data){
    			});
				create_comment(text_comment, text_author);
				$("#new_comment").remove();
				$("#new_comment_button").show();
				array = [];	
			});	
	});	

	function create_form(){
		var newObject = "<form id='new_comment'><textarea name='text_comment'></textarea><input type='text' name='author' placeholder='Author'><input type='submit' value='enviar'></form>";
		$("li").last().after(newObject);
	};

	function create_comment(comment, author){
		var newObject = "<li>"+comment+" <span class='author'>"+author+"</span></li>";
		$("li").last().after(newObject);
	};
});


  
