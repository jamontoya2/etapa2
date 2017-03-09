
$(document).ready(function() {
 $('.container').on("click", 'input[name=search]', function(event){
    event.preventDefault();
    user = {}
    user.name = $('input[name=username]').val();
    $.post('/fetch', user, function(check){
      if(check === "twitter"){
        $.get('/twitter/' + user.name, function(){
          window.location.href = "/db/" + user.name;
        });
      }else{
        window.location.href = "/db/" + user.name;
      }
    });
  });

  $('.container').on("click", 'input[name=tweet]', function(event){
    event.preventDefault();
    tweet = {}
    tweet.text = $('input[name=text]').val();
      $.post('/tweet', tweet, function(){
         $.get('/twitter/jamontoyam', function(){
             window.location.href = '/db/jamontoyam';
         });
      });
    }); 
 });