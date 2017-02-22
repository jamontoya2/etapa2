$(document).ready(function() {
	//creacion de la peticion para guradar los valores
	$("#testform").submit(function(event)
       {
       	//retener la informacion hasta que acabe el proceso
       	event.preventDefault();
       	//guarda llos valores que el usuario haya ingresado, solo se guarda los valores y no todo el form	
        var  form_data = $(this).serialize();
          console.log(form_data);
          //crea el ajax sobre el url que se quiere recargar y pasarle los valores que el usuario haya dado
          //con el funcion data se hara el call back de el metodo y se guaradan los valores que haya regresado el metdod del controlador
          $.post('/abuelita', form_data, function (data) {
            
           //agrega al div grandma lo que contenga ahora data y lo sobre escribe cada vez
            $("#grandma").html(data);
          });      

       });

});



