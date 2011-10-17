(function($){
	var container = '';
	
	$(function(){
		container = $('.mxunitResults');
		
		// Add the active toggle for the filters
		$('.summary a', container)
			.click(function() {
				var element = $(this);
				
				element.toggleClass('inactive');
				
				// Find what type of filter we are on
				type = element.parent().attr('className');
				
				// Toggle all the matching tests
				$('tr.' + type, container).toggle();
				
				return false;
			});
	});
})(jQuery);
