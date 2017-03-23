function revealOnScroll(){
	var scrolled = $(window).scrollTop();
	$(".slider").each(function() {
    var current = $(this), // 当前元素
        w_height = $(window).outerHeight(), //视窗高度
     	offsetTop = current.offset().top; //当前元素离顶部的高度
	    if (scrolled + w_height - 50 > offsetTop) {
	      current.addClass("animation");
	    }
  });
}
$(window).on("scroll", revealOnScroll);
$(function(){
	$("#slider1").addClass("animation");
})