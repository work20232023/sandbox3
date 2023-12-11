var toursQueue = [];
var toursQueueActual = [];
var tourObject = null;

$(document).ready(function() {
	if ( $(window).width() < 1024 ) return;
    startTour();
    $(document).keyup(function (event) {
        if (event.which === 27) {
            tourObject.end();
            $.each(toursQueueActual, function(key,value) {
                value.end();
            });
        }
    });
});

function startTour() {
	tourObject = toursQueueActual.shift();
	$.each(toursQueueActual, function(key,value) {
		tourObject._options.steps = tourObject._options.steps.concat(value._options.steps);
	});
    toursQueueActual = [];
	if ( tourObject ) {
        tourObject.init();
        if ( !tourObject.ended() ) {
            tourObject.start();
        }
	}
}

function startNextTour() {
    if ( !tourObject ) return;
	tourObject.next();
}

function reStartTour() {
    if ( !tourObject ) return;
	tourObject.init();
	tourObject.restart();
}