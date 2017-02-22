$(function () {
  $(document).scroll(function () {
	  var $nav = $(".top-nav");
	  $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
	});
});

