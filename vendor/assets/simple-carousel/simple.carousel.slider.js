/* Slideshow Control */
$(document).ready(function() {
  $(".slider.regular").simplecarousel({
  	width: 705,
  	height: 390,
  	visible: 1,
  	auto: 8000,
  	next: $('.slider-next'),
  	prev: $('.slider-prev'),
  	pagination: false,
  	layout: "regular",
  	fade: true
  });
});