toursQueueActual.push(new Tour({
	backdrop: true,
	backdropPadding: 20,
	steps: [
	  {
	    element: ".form-search",
	    title: ptt('search-for-reports'),
	    content: ptc('search-for-reports'),
	    placement: 'bottom',
	    onShow: function() { setTimeout(function(){$('li#tab_favs a').click();},1); }
	  },
	  {
	    element: "li#setup",
	    title: ptt('adjust-menu-settings'),
	    content: ptc('adjust-menu-settings'),
	    placement: 'right',
	    onShow: function() { setTimeout(function(){$('li#tab_favs a').click();},1); },
	    onNext: function() { 
	    	$('li#tab_stg a').click();
	    }
	  },
	  {
	    element: ".filter div.btn-group:eq(1)>a",
	    title: ptt('filters'),
	    content: ptc('filters'),
	    placement: 'bottom'
	  },
	  {
	    element: "#filter-settings ~ul",
	    title: ptt('filter-settings'),
	    content: ptc('filter-settings'),
	    onShow: function() { $('#filter-settings ~ul').show(); },
	    onHide: function() { $('#filter-settings ~ul').hide(); },
	  },
	  {
	    element: "div.bulk-filter-actions",
	    title: ptt('bulk-actions'),
	    content: ptc('bulk-actions'),
	    placement: 'bottom',
	    onShow: function() {
            checkRowsTrue($('.board-table').attr('id'));
			var checkBox = $('input[id*=to_delete_all]');
			checkBox.attr('checked',!checkBox.attr('checked'));
			checkRows($('.wishes-table[uid]').attr('id'));
		},
	    onHide: function() {},
	  },
	  {
	    element: "div.filter-actions>div:last>ul",
	    title: ptt('filter-actions'),
	    content: ptc('filter-actions'),
	    placement: 'left',
	    onShow: function() { $('div.filter-actions>div:last>ul').css({'display':'block'}); },
	    onHide: function() { 
	    	$('div.filter-actions>div:last>ul').css({'display':''});
	    }
	  },
	  {
	    element: "a#navbar-project ~ ul",
	    title: ptt('project-creation'),
	    content: ptc('project-creation'),
	    onShow: function() { $('a#navbar-project ~ ul').css({'display':'block'}); },
	    onHide: function() { $('a#navbar-project ~ ul').css({'display':''}); },
	  }
	],
	name: "devpromTour",
	duration: 1000 * 120,
	template: 
		"<div class='popover tour' style='max-width:450px;'>"+
		  "<div class='arrow'></div>"+
		  "<h3 class='popover-title' style='color:#fff;background-color: #428bca;border: 2px solid #428bca;'></h3>"+
		  "<div class='popover-content'></div>"+
		  "<div class='popover-navigation text-center' style='padding: 9px 14px;'>"+
		    "<button class='btn btn-default pull-left' data-role='prev'><span class='ui-button-text'><i class='icon-backward'></i></span></button>"+
		    "<button class='btn btn-default' data-role='stop' title='"+ptt('end-tour')+"'><span class='ui-button-text'><i class='icon-stop'></i></span></button>"+
		    "<button class='btn btn-default pull-right' data-role='next'><span class='ui-button-text'><i class='icon-forward'></i></span></button>"+
		    "<div class='clearfix'></div>"+
		  "</div>"+
		"</div>",
	onShow: function(tour) {
		$('.with-tooltip').popover('disable');
	},
	onEnd: function(tour) {
		$('.with-tooltip').popover('enable');
	},
	onShown: function(tour) {
		$('[data-role=stop]').click( function() {
			tour.end();
        });
	}
}));
