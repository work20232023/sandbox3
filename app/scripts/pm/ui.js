var uiOptions = {
    x: 0,
    y: 0,
    left: 0,
    down: false
};

function makeUpApp()
{
    buildNavigationTree();

    filterLocation.makeup();

    $('.autosave-input').change( function() {
        var data = $.parseJSON($(this).attr('data-save'));
        data = $.extend(data, {value: $(this).val()});
        runMethod( $(this).attr('data-href'), data, 'donothing', '' );
    });

    if ( !devpromOpts.uiExtensionsEnabled ) return;

    var jqe = $(document);

    var clipboard = new Clipboard('.clipboard');
    clipboard.on('success', function(event) {
        var target = $(event.trigger);
        try {
            target.popover({
                'content': target.attr('data-message'),
                'title': function() {
                    return '';
                },
                'placement': 'top',
                'container': 'body'
            });
            target.popover('show');
        }
        catch(e) {
        }
        setTimeout(function() {target.popover('hide');}, 4000);
        event.clearSelection();
    });

    var defaultSliderPos = cookies.get('list-slider-pos') != null
        ? cookies.get('list-slider-pos') : 2;
    $('#list-slider').slider({
        value: defaultSliderPos,
        min: 1,
        max: 2,
        step: 1,
        slide: function( event, ui ) {
            setDocumentListSize(ui.value);
        }
    });

    jqe.find('.dropdown-item-search input')
        .on('click', function(e) {
            e.stopImmediatePropagation();
            return false;
        })
        .on('keyup', function(e) {
            var parentNode = $(this).parents('ul.dropdown-menu');
            var items = parentNode.find('li:not([uid=none]):not([uid=all]):not([uid=search]):not([uid=show-all]):not(.divider):not(:has(a.checked))');
            var text = $(this).val();
            if ( text == "" ) {
                var visibleItems = items;
            }
            else {
                var visibleItems = items.filter(function(i, el) {
                    return $(el).text().match(new RegExp(escapeRegExp(text), "ig"));
                });
            }
            items.hide();
            visibleItems.show();
        })
        .trigger('keyup');

    jqe.find('.dropdown-item-all a')
        .on('click', function(e) {
            $(this).parents('ul.dropdown-menu').find('li').show();
            $(this).parent().hide();
            e.stopImmediatePropagation();
            return false;
        });

    jqe.find('#rightTab a:first').tab('show');
    jqe.find('#rightTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

    jqe.find('.search-query').each( function() {
        quickSearchAutoComplete($(this));
    });

    jqe.resize( function(e) {
        var tbl = $('.wiki-page-document .table-inner-div');
        if ( tbl.length > 0 ) {
            var height = $(window).height() - tbl.offset().top - 15;
            var hintHolder = $('.wiki-page-document .hint-holder');
            if ( hintHolder.length > 0 ) {
                height -= hintHolder.height();
            }
            tbl.height(height);
            if ( documentOptions.scrollbar ) {
                documentOptions.scrollbar.update();
            }
        }
    });

    setInterval(function() {
        var txt = cookies.get('last-action-message');
        if ( txt && txt != "" ) {
            if ( !lastActionBar ) {
                lastActionBar = new $.peekABar({
                    cssClass: 'alert alert-success',
                    backgroundColor: '#dff0d8',
                    animation: {
                        type: 'fade',
                        duration: 450
                    },
                    delay: 8000,
                    html: txt.replace(/\+/g, ' '),
                    autohide: true,
                    closeOnClick: true,
                    onHide: function() {
                        cookies.set('last-action-message', '');
                        lastActionBar = null;
                    }
                });
            }
            if ( !$('.peek-a-bar').is(':visible') ) {
                var width = Math.max($(window).width() * 1 / 3, 600);
                $('.peek-a-bar').css({
                    width: width,
                    left: ($(window).width() - width) / 2
                });
                lastActionBar.show();
            }
        }
    }, 1000);

    $('#quick-search').popover({
        placement: 'bottom',
        container: 'body',
        html: true,
        trigger: 'click'
    });
    $('.vertical-menu-short a').tooltip({
        placement: 'right',
        container: 'body'
    });
    $('#main-sidebar ul a').tooltip({
        placement: 'right',
        container: 'body'
    });
    $('.vertical-menu-short a:not([module])').popover({
        placement: 'right',
        container: 'body',
        html: true
    });

    $("body").on("contextmenu", "#tablePlaceholder .table-inner tr[object-id]", function(e)
    {
        if ( $(e.target).closest('a, .btn-group').length > 0 ) return;
        $('.dropdown-fixed.open, .btn-group.open').removeClass('open');
        var row = $(this).find('td#operations');
        var item = row.find('.dropdown-menu')
        if ( item.length > 0 ) {
            row.find('.dropdown-fixed').detach();
            var cont = $('<div class="btn-group dropdown-fixed open"></div>').prependTo(row);
            item.first().clone().prependTo(cont);
            cont.css({
                left: e.originalEvent.clientX,
                top: e.originalEvent.clientY,
            });
            if ( !cont.find('ul>li:last').isInViewport() ) {
                cont.find('ul').css({
                    top: 'unset',
                    bottom: 0
                });
            }
            if ( !cont.find('ul>li:first').isInViewport() ) {
                cont.find('ul').css({
                    top: '',
                    bottom: ''
                });
                cont.css({
                    top: 0
                });
            }
            return false;
        }
    })
    .on("keydown", function(e) {
        if ( e.which == 39 || e.which == 37 ) {
            $('.table-master:visible, .wysiwyg:not([contenteditable])').animate({
                scrollLeft: e.which == 39 ? '+=50' : '-=50'
            }, 0, 'swing');
        }
    });

    $('td#search-area input')
        .on('keypress', function(e) {
            filterLocation.hidePopover();
            if(e.which == 13) {
                filterLocation.setup('search='+$(this).val());
            }
        });

    if ( $('.page-details .details-body').length > 0 ) {
        const detailsPerfect = new PerfectScrollbar('.page-details .details-body', {
            suppressScrollX: true
        });
        $('.page-details .details-body').on('keydown', function(e) {
            e.stopImmediatePropagation();
        })
    }
    if ( $('#tablePlaceholder.placeholder-fixed .table-master').length > 0 ) {
        const tableMasterPerfect = new PerfectScrollbar('#tablePlaceholder.placeholder-fixed .table-master');
    }
    $('.form-container').each(function() {
        var scrollbar = new PerfectScrollbar($(this).get(0), {
            suppressScrollX: $(this).find('#preview').length < 1 ? true : false
        });
    });
    if ( $('.treeview-container').length > 0 ) {
        const treeContainerPerfect = new PerfectScrollbar('.treeview-container');
    }
    if ( $('ul.navbar-menu').length > 0 ) {
        const menuPerfect = new PerfectScrollbar('ul.navbar-menu');
    }
    if ( $('.right-side-tab .tab-pane').length > 0 ) {
        $('.right-side-tab .tab-pane').each(function() {
            new PerfectScrollbar(this);
        });
    }

    $('#tablePlaceholder.placeholder-fixed .table-master')
        .mousedown(function(e){
            if ( !$(e.target).is('tr,td,th,.list_cell') ) return true;
            uiOptions.down = true;
            uiOptions.x = e.pageX;
            uiOptions.y = e.pageY;
            uiOptions.left = $(this).scrollLeft();
        });

    $("body").mousemove(function(e){
            if( uiOptions.down ) {
                $("#tablePlaceholder.placeholder-fixed .table-master").scrollLeft(uiOptions.left - e.pageX + uiOptions.x);
            }
        })
        .mouseup(function(e) {
            uiOptions.down = false;
        });
}

function completeChartsUI( jqe )
{
    jqe.find('.plot[url]').bind("plotclick", function (event, pos, item) {
        window.location = $(this).attr('url');
    }).css('cursor', 'pointer');

    jqe.find('.plot-wide').each(function(index) {
        $(this).css('width', $('#tablePlaceholder').width() - 20);
    });

    jqe.find('.plot').each(function(index) {
        $(this).bind("plotclick", function (event, pos, item) {
            if (!item) return;
            if ( typeof item.series.urls != 'undefined' )
            {
                var url = item.series.urls[item.datapoint[0]];
                if ( typeof url != 'undefined' ) window.location = url;
            }
        });
        $(this).bind("plothover", function (event, pos, item) {
            if ( pos && pos.x ) $("#x").text(pos.x.toFixed(2));
            if ( pos && pos.y ) $("#y").text(pos.y.toFixed(2));
            if ( item ) {
                var xValue = '';
                var yValue = '';
                switch( typeof item.datapoint[0] )
                {
                    case 'number':
                        if ( item.datapoint[0] > 1000000 ) {
                            var dt = new Date(item.datapoint[0]);
                            xValue = dt.toString(devpromOpts.datejsformat);
                        }
                        else {
                            xValue = item.datapoint[0];
                        }
                        break;
                    default:
                        xValue = item.datapoint[0];
                }
                if ( typeof bar_labels != 'undefined' ) {
                    xValue = bar_labels[item.datapoint[0]];
                }
                if ( xValue == "" && typeof item.series.xaxis.ticks != 'undefined' && item.series.xaxis.ticks.length > 0 ) {
                    if ( typeof xValue == 'number' ) xValue = item.series.xaxis.ticks[xValue].label;
                }
                else if ( typeof item.series.label != 'undefined' ) {
                    yValue = item.series.data[item.dataIndex][1];
                }
                else {
                    yValue = "";
                }

                if ( typeof item.series.axisDescription != 'undefined' ) {
                    if ( typeof item.series.axisDescription.xaxis != 'undefined' ) {
                        xValue = item.series.axisDescription.xaxis + ": " + xValue;
                    }
                    else {
                        xValue = "";
                    }
                    if ( typeof item.series.axisDescription.yaxis != 'undefined' ) {
                        yValue = item.series.axisDescription.yaxis + ": " + item.series.data[item.dataIndex][1];
                    }
                    else {
                        yValue = "";
                    }
                }
                var text = (typeof item.series.label != 'undefined' ? item.series.label + ": " : "")
                    + yValue + ( xValue != '' ? " [" + xValue + "]" : "" );

                showFlotTooltip(item.pageX, item.pageY, text, 'flottooltip' + item.dataIndex + item.seriesIndex);
            }
            else {
                $(".charttooltip").remove();
            }
        });
    });
}

function completeUICustomFields( formId, anchor, fields, values )
{
    $('#'+formId+' '+anchor).change( function() {
        jQuery.each(fields, function(key, value) {
            $('#'+formId+' #fieldRow'+value).hide();
        });
        var selected = '';
        var option = $(this).find('option[value="'+$(this).val()+'"]');
        if ( option.length > 0 ) {
            selected = option.attr('referenceName');
        }
        else {
            selected = $(this).attr('referenceName');
        }
        jQuery.each(fields, function(key, value) {
            if ( selected == values[key] ) $('#'+formId+' #fieldRow'+value).show();
        });
    });
    $(anchor).change();
}


function completeUIView(jqe)
{
    jqe.find('.treeview.sticks-top').css({
        height: $(window).height()
    });

    toggleLoadMoreButton();

    var options = $.extend({},devpromOpts.datepickerOptions);
    jqe.find( ".datepicker-filter" ).datepicker(
        $.extend( options, devpromOpts.datepickerFilterOptions )
    );
    jqe.find("img.wiki_page_image").each( function() {
        if ( $.browser.msie ) {
            this.setAttribute('href', $(this).attr('src'));
        } else {
            this.href = $(this).attr('src');
        }
    });
    jqe.find("img.wiki_page_image").fancybox({
        hideOnContentClick: true
    });

    jqe.find('td').each(function()
    {
        $(this).find('.diff-html-added').css('background', '#90EC90');
        $(this).find('.diff-html-removed').css('background', '#F59191');
    });

    jqe.find('.comments-toolbar-btn').click(function() {
        $(this).parent().is('.collapsed')
            ? $(this).parent().removeClass('collapsed')
            : $(this).parent().addClass('collapsed');
    });
}

function completeUIControls(jqe)
{
    jqe.find('textarea.wysiwyg,div[contenteditable]').each(function() {
        if ( $(this).parents('#documentCache,.embedded_form').length < 1 ) {
            if ( $(this).is('.wysiwyg-text') ) {
                $(this).parent()
                    .hover(function() {
                            if ( !$(this).find('.wysiwyg-text').is('.cke_focus') ) $(this).addClass('wysiwyg-hover');
                            $('.wysiwyg-welcome[for-id='+$(this).attr('id')+']').css('border-top', '2px solid white');
                        },
                        function() {
                            $(this).removeClass('wysiwyg-hover');
                            $('.wysiwyg-welcome[for-id='+$(this).attr('id')+']').css('border', 'none');
                        });
            }
            setupWysiwygEditor($(this).attr('id'), $(this).attr('toolbar'),
                $(this).attr('userHeight'), $(this).attr('modifyUrl'),
                $(this).attr('appVersion'), $(this).attr('project'));
        }
    });

    setTimeout(function() {
        jqe.find("img[alt]:visible").imageLens({ lensSize: 311 });
    }, 1000);

    jqe.find("[data-fancybox='gallery']:visible").fancybox({
        'hideOnContentClick': true
    });

    jqe.find('.with-popover').popover({
        placement: 'bottom',
        html: true
    });

    jqe.find('.with-tooltip').popover({
        placement: function() {
            if ( $(this.$element).is('[placement]') ) return $(this.$element).attr('placement');
            return $(this.$element).offset().left < $(window).width() / 2 ? 'right' : 'left';
        },
        html:true,
        trigger: 'manual',
        container: 'body'
    });

    var intervalId = 0;
    jqe.find('a.with-tooltip[info]')
        .hover(
            function(e) {
                var self = $(this);
                clearInterval(intervalId);
                showTooltip(self, function() {
                    self.data('popover').tip().hover(
                        function(e) {
                            clearInterval(intervalId);
                        },
                        function (e) {
                            self.data('popover').hide();
                        }
                    );
                });
            },
            function(e) {
                var self = $(this);
                intervalId = setInterval(function() {
                    var popover = self.data('popover');
                    if (popover) popover.hide();
                }, 1500);
            }
        )
        .bind('contextmenu', function(e) {
            e.stopPropagation();
        });

    jqe.find("a.modify_image").click( function(e) {
        window.location = $(this).attr('href');
        e.stopImmediatePropagation();
    });

    jqe.find('.collapse')
        .on('show', function() {
            var element = $(this);
            window.setTimeout( function() { if ( element.hasClass('in') ) { element.css('overflow', 'visible'); }}, 500 );
        })
        .on('hide', function() {
            $(this).css('overflow', 'hidden');
        });

    jqe.find('[data-toggle="popover"]').popover({
        trigger: 'hover'
    });
    $('[data-toggle="tooltip-bottom"]').tooltip({
        placement: 'bottom',
        container: 'body'
    });
}

function completeUIForm(jqe)
{
    jqe.find('.form-container,.details-body').scroll( function(e) {
        processStickedLayout($(this));
    });

    $('select.dictionary[multiple]').multiselect({
        buttonClass: 'btn btn-light',
        numberDisplayed: 0,
        enableFiltering: true,
        enableCaseInsensitiveFiltering: true,
        filterPlaceholder: text('ms-search'),
        nonSelectedText: '...',
        buttonContainer: '<div class="btn-group input-block-level" />',
        templates: {
            filterClearBtn: ''
        },
        buttonText: function(options, select) {
            var labels = [];
            var separator = $(select).is('[newline]') ? "\r\n" : ', ';
            options.each(function () {
                labels.push($(this).text());
            });
            if ( labels.length < 1 ) return '...';
            return labels.join(separator);
        },
        onInitialized: function(select, container) {
            $(container).find('ul').css({
                'position': 'fixed',
                'top': 'auto',
                'left': 'auto'
            });
            var attributeName = $(select).attr("name").replace(/[\[\]]+/,'');
            $('<input type="hidden" name="'+attributeName+'OnForm">').appendTo($(container));
        }
    });

    jqe.find('[name*=Capacity]').keydown(function() {
        updateLeftWork($(this));
    });

    jqe.find('.file-browse').each(function() {
        uploadFiles($(this));
    });

    jqe.find('.file-drop-target').bind('dragover', function(){
        $(this).addClass('drag-over');
    });
    jqe.find('.file-drop-target').bind('dragleave', function(){
        $(this).removeClass('drag-over');
    });

    jqe.find( ".datepicker" ).datepicker(devpromOpts.datepickerOptions);

    jqe.find("input[placeholder!=''], textarea[placeholder!='']").each( function() {
        $(this).keypress( function() {
            if ( $(this).val() != $(this).attr('placeholder') ) {
                $(this).removeClass('ac_welcome');
            }
            else {
                $(this).addClass('ac_welcome');
            }
        })
            .blur( function() {
                if ( $(this).val() == $(this).attr('placeholder') ) {
                    $(this).addClass('ac_welcome');
                }
            });

        if ( $(this).val() == $(this).attr('placeholder') ) $(this).addClass('ac_welcome');
    });

    if ( !$.browser.msie ) {
        jqe.find("input:file:not([multiple])").filestyle({
            classInput: 'custom-file',
            classButton: 'btn btn-light custom-file',
            buttonText: '',
            icon: true,
            classIcon: 'icon-folder-open'
        });
    }
    else {
        jqe.find("input:file").css({'width':'100%'});
    }

    $(document).on('change', '#Photo', function () {
        var file = $(this)[0].files[0];
        var url = window.URL.createObjectURL(file);
        $('body').append('<div id="modal-form" style="display:none;"><div><img id = "avatar-creator" src="' + url + '" alt="custom-img"></div></div>');

        const image = document.getElementById('avatar-creator');
        var cropper = new Cropper(image, {
            aspectRatio: 1,
        });

        var form = $(this).parents('form');

        $('#modal-form').dialog({
            width: getDialogWidth(),
            modal: true,
            resizable: false,
            closeText: "",
            open: function()
            {
                $(this).parents('.ui-dialog').css('top', '10vh');
                workflowMakeupDialog();
            },
            create: function()
            {
                workflowBuildDialog($(this),{form_title: text('title-crop-dialog')});
            },
            beforeClose: function(event, ui)
            {
                return workflowHandleBeforeClose(event, ui);
            },
            dragStart: function(event, ui) {
                workflowDragDialog(event, ui);
            },
            buttons: [
                {
                    tabindex: 1,
                    text: text('form-submit'),
                    id: 'avatarCreatorSubmitBtn',
                    click: function() {
                        canvas = cropper.getCroppedCanvas({
                            width: 350,
                            height: 350
                        });

                        canvas.toBlob(function(blob){
                            url = URL.createObjectURL(blob);
                            var reader = new FileReader();
                            reader.readAsDataURL(blob);
                            reader.onloadend = function(){
                                var base64data = reader.result;

                                form.append('<input type = "hidden" name = "cropImageBase64" value = "' + base64data + '">');
                            };
                        });

                        workflowCloseDialog();
                        cropper.destroy();
                        cropper = null;
                    }
                },
                {
                    tabindex: 2,
                    text: text('form-close'),
                    id: 'avatarCreatorCancelBtn',
                    click: function()
                    {
                        cropper.destroy();
                        cropper = null;
                        $(this).dialog('close');
                    }
                },
            ]
        });
    });

    jqe.find('.fieldautocompleteobject').each( function() {
        if ( $(this).attr('object') == '' || $(this).attr('id') == '' ) return true;

        objectAutoComplete(
            $(this),
            $(this).attr('object'),
            $(this).attr('caption'),
            $(this).attr('searchattrs').split(','),
            $(this).attr('project')
        );
    });

    jqe.find('[alm-widget-url]').each(function() {
        var self = $(this);
        var width = self.parent().width();
        $.get( self.attr('alm-widget-url') + '&' + $(this).attr('alm-widget-query'),
            {
                tableonly: true,
                dashboard: true,
                header: true,
                height: self.parent('.cell').attr('data-height') - 50,
                width: self.parent('.cell').attr('data-width') - 10
            },
            function(data) {
                self.html($(data).find('.table-master'));
                self.find('.table-master').removeClass('table-master');
                if ( width > 0 ) self.width(width);
            }
        )

    });
}

function completeUIExt( jqe )
{
    completeChartsUI(jqe);
    completeUIView(jqe);
    completeUIForm(jqe);
    completeUIControls(jqe);
    makeupAnnotations(jqe, false);
    if (typeof window.makeupTerms !== 'undefined') makeupTerms(jqe);
    highlightComment();

    var storedCommentsSettings = localStorage.getItem('comments-filter-settings');
    if ( typeof storedCommentsSettings == 'array' ) {
        setupFilterComments(JSON.parse(storedCommentsSettings));
    }

    if ($('.text-scroll').length > 0) {
        let width = $('.form-container').width();
        $('.text-scroll').css('width', width - 15 + 'px');
        $('.text-scroll').each(function() {
            new PerfectScrollbar(this);
        });
    }
}

function buildNavigationTree()
{
    var el = $("#projects-tree");
    el.fancytree({
        extensions: ["persist","filter"],
        checkbox: false,
        icon: false,
        debugLevel: 0,
        source: {
            url: "/projects/tree",
            cache: false
        },
        filter: {
            highlight: false
        },
        persist: {
            expandLazy: false,
            store: "local",
            types: "active expanded focus selected"
        },
        strings: {
            loadError: text('project-tree-error'),
            noData: text('project-tree-nodata')
        },
    });
    el.on("click", "", function(e){
        var node = $.ui.fancytree.getNode(e);
        if ( node && node.data.code ) {
            //window.location = '/pm/' + node.data.code;
        }
    });

    $('.project-search input')
        .on('keyup', function(e) {
            $.ui.fancytree.getTree("#projects-tree").filterNodes($(this).val(), {
                autoExpand: true,
                mode: 'hide'
            });
        });
}

function storeFormCheckboxes( form )
{
    var options = {};
    form.find('input:checkbox.checkbox[name][id]').each(function() {
        var item = $(this);
        options[item.attr('id')] = item.prop('checked');
    });
    localStorage.setItem(form.attr('module'), JSON.stringify(options));
}

function restoreFormCheckboxes( form )
{
    var formOptions = localStorage.getItem(form.attr('module'));
    if ( !formOptions ) return;
    try {
        formOptions = JSON.parse(formOptions);
        form.find('input:checkbox.checkbox[name][id]').each(function() {
            var item = $(this);
            if ( formOptions.hasOwnProperty(item.attr('id')) ) {
                item.prop('checked', formOptions[item.attr('id')]);
            }
        });
    }
    catch(e) {}
}

function setFormCheckboxes( form, selectElement )
{
    try {
        var select = $(selectElement);
        var options = JSON.parse(select.attr('default'));
        if ( !options.hasOwnProperty(select.val()) ) return;

        var selectedOptions = options[select.val()];
        form.find('input:checkbox').each(function() {
            var item = $(this);
            item.prop('checked', false);
            $.each(selectedOptions, function(key,option) {
                if ( item.attr('id').toLowerCase().includes(option) ) {
                    item.prop('checked', true);
                }
            })
        });
    }
    catch(e) {}
}

function updateStateAttributeData(frm, el, readonlyItems)
{
    var readonly = $.inArray(el.val(), readonlyItems) != -1;
    frm.find('[name*="IsRequired"]').prop('disabled', readonly);
    frm.find('[name*="IsReadonly"]').prop('disabled', readonly);
    frm.find('[name*="IsVisibleOnEdit"]').prop('disabled', readonly);
    frm.find('[name*="IsAskForValue"]').prop('disabled', readonly);
    if ( readonly ) {
        frm.find('[name*="IsReadonly"]').prop('checked', 'checked');
        frm.find('[name*="IsRequired"]').prop('checked', '');
        frm.find('[name*="IsVisibleOnEdit"]').prop('checked', '');
        frm.find('[name*="IsAskForValue"]').prop('checked', '');
    }
}

function showTooltip(el, callback)
{
    $('.dropdown-menu').parent('.open').toggleClass('open');

    var tooltip = el;
    if ( !tooltip.data('popover').enabled ) return;

    if ( typeof tooltip.attr('loaded') != 'undefined' ) {
        $('.popover').toggleClass('in').remove();
        if ( tooltip.parents('.open').length < 1 ) {
            tooltip.data('popover').show();
            var parentNode = tooltip.parents('.board_item_body');
            if ( parentNode.length > 0 ) {
                var popover = tooltip.data('popover');
                popover.tip().addClass('in-focus');
                if ( tooltip.offset().left < $(window).width() / 2 ) {
                    popover.tip().css({
                        'left': parentNode.length > 0 ? parentNode.offset().left + parentNode.width() : tooltip.offset().left + tooltip.width()
                    });
                }
            }
        }
        return;
    }

    $.ajax({
        url: tooltip.attr('info'),
        dataType: 'html',
        error: function (xhr, status, error) {
            if (xhr.status === 0) return;
            tooltip.attr('data-content', ajaxErrorExplain(xhr, error));
        },
        success: function (data, status, xhr) {
            if (xhr.getResponseHeader('status') == '500') {
                window.location = '/500';
            }
            if (xhr.getResponseHeader('status') == '404') {
                return;
            }

            tooltip.attr('data-content', data);
            tooltip.attr('loaded', 'true');

            var popover = tooltip.data('popover');
            if (typeof popover != 'undefined') {
                popover.tip().find('.popover-content').css({
                    'width': $(window).width() / 3
                });
            }
            if (tooltip.is(':hover') && tooltip.parents('.open').length < 1) {
                $('.popover').toggleClass('in').remove();
                tooltip.data('popover').show();
                var parentNode = tooltip.parents('.board_item_body');
                if ( parentNode.length > 0 ) {
                    popover.tip().addClass('in-focus');
                    if ( tooltip.offset().left < $(window).width() / 2 ) {
                        popover.tip().css({
                            'left': parentNode.length > 0 ? parentNode.offset().left + parentNode.width() : tooltip.offset().left + tooltip.width()
                        });
                    }
                }
            }
            callback();
        }
    });
}

function replaceAjaxHtml( element, url )
{
    $.ajax({
        url: '/pm/'+devpromOpts.project + '/' + url,
        dataType: 'html',
        error: function (xhr, status, error) {
            reportError(ajaxErrorExplain(xhr, error));
        },
        success: function (data, status, xhr) {
            $(element).html(data);
            completeUIExt($(element));
        }
    });
}
