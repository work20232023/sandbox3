var cket = underi18n.MessageFactory(ckeditor_resources);
hljs.configure({
	tabReplace: '    '
});
hljs.initHighlightingOnLoad();
var mentions = [];
var editorPersister = null;

var ALM_toolbars = {
	"MiniToolbar": [
		{ name: 'clipboard', items : ['Paste','PasteText' ] },
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','RemoveFormat','TextColor','BGColor' ] },
		{ name: 'paragraph', items : [ 'Outdent','Indent','NumberedList','BulletedList','Blockquote' ] },
		{ name: 'insert', items : [ 'Table','InsertMultipleImages','Diagrams', 'Plantuml', 'Mathjax', 'CodeSnippet','Link','Anchor','searchArtifact',,'EmbedHTML','Embed' ] },
		{ name: 'tools', items : [ 'Maximize','Source','-','Undo','Redo' ] },
		{ name: 'styles', items : [ 'Format','Font','FontSize','Markdown' ] }
	],
	"FullToolbar": [
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','-','Subscript','Superscript','-', 'TextColor','BGColor','-','CopyFormatting','RemoveFormat' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Blockquote' ] },
		{ name: 'insert', items : [ 'Table','InsertMultipleImages','Diagrams', 'Plantuml', 'Mathjax','CodeSnippet','Link','Anchor','searchArtifact','includeArtifact','EmbedHTML','Embed' ] },
		{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		{ name: 'editing', items : [ 'Scayt' ] },
		{ name: 'tools', items : [ 'Maximize', 'ShowBlocks' ] },
		{ name: 'forms', items : [ 'Checkbox' ] },
		{ name: 'document', items : [ 'Source' ] },
		{ name: 'styles', items : [ 'Styles','Format','Font','FontSize','Markdown' ] },
		{ name: 'others' }
	],
	"": []
};
var removePlugins = 'autogrow,elementspath,autoembed,tableresize';
var removePluginsEmptyToolbar = 'pastefromword,pastetext,includepage,pastetools,clipboard,notificationaggregator,notification,mathjax,diagrams,image2,embed,embedbase,codesnippet,widget,toolbar,' + removePlugins;

CKEDITOR.disableAutoInline = true;

function setupDialogTable( dialogDefinition )
{
    var infoTab = dialogDefinition.getContents('info');
    var cellSpacing = infoTab.get('txtCellSpace');
    cellSpacing['default'] = "1";
    var cellPadding = infoTab.get('txtCellPad');
    cellPadding['default'] = "1";
    var tableWidth = infoTab.get('txtWidth');
    tableWidth['default'] = "100%";
    
    var advTab = dialogDefinition.getContents('advanced');
    var tableStyle = advTab.get('advStyles');
    tableStyle['default'] = "border-collapse:collapse;";
    var tableClass = advTab.get('advCSSClasses');
    tableClass['default'] = "docs-table";
}

function html_entity_decode(str)
{
	var tarea=document.createElement('textarea');
  	tarea.innerHTML = str;
	var value = tarea.value;
	$(tarea).remove();
	return value;
}
 
function setupEditor( editor )
{
	editor.on( 'focus', function( e ) {
		$('.wysiwyg-welcome[for-id='+e.editor.custom.id+']').hide();
		$('.wysiwyg-hover').removeClass('wysiwyg-hover');
		return true;
	});
    editor.on( 'key', function( event ) {
        if ( event.data.keyCode == 13 ) {
            var textComplete = $(this.editable().$).data('textComplete');
            if( textComplete && textComplete.dropdown && textComplete.dropdown.shown ) {
                textComplete.dropdown._enter(event.data);
                event.cancel();
            }
        }

		var edt = $(this.editable().$);
		if ( editor.custom.objectclass == 'TestScenario' || editor.custom.objectclass == 'TestCaseExecution' ) {
			var skip = false;
			edt.find('table').first().find('>tbody>tr').children('td:nth-child(1)').each(function(index) {
				if ( index == 0 ) {
					skip = $(this).text() != "1";
				}
				if ( !skip ) {
					$(this).html(index + 1);
				}
			});
		}

		originalEvent = event.data.domEvent.$;
		if ( this.editable().$.ownerDocument != window.document ) Mousetrap.handleKeyEvent(originalEvent);
    });

    editor.on( 'contentDom', function() {
        var editable = editor.editable();
        editable.attachListener( editable, 'mousedown', function( evt ) {
            var target = evt.data.getTarget(),
                clickedAnchor = ( new CKEDITOR.dom.elementPath( target, editor.editable() ) ).contains( 'a' ),
                href = clickedAnchor && clickedAnchor.getAttribute( 'href' ),
                modifierPressed = evt.data.$.ctrlKey || evt.data.$.shiftKey;

            if ( href && modifierPressed ) {
                window.open( href, target );
                evt.data.preventDefault();
            }
			annotationShowComment($(target.$));
        });
    } );
    $('.wysiwyg-welcome:not(.armed)').addClass('armed').click(function() {
		var editor = CKEDITOR.instances[$(this).attr('for-id')];
		if ( editor ) {
			setTimeout(function(){
				$('.wysiwyg-welcome[for-id='+editor.custom.id+']').hide();
				$('.wysiwyg-hover').removeClass('wysiwyg-hover');
				$(editor.element.$).trigger('focus');
			}, 50);
		}
    });
}

function setupDialogLink( def )
{
    var infoTab = def.getContents( 'info' );
    var linkTypeItems = infoTab.get( 'linkType' ).items;
    if ( linkTypeItems.length > 0 ) {
        var items_no_anchor = linkTypeItems.slice(0, 1).concat( linkTypeItems.slice(2, linkTypeItems.length) );
        infoTab.get( 'linkType' ).items = items_no_anchor;
    }
}

function setupEditorGlobal( filesTitle )
{
	CKEDITOR.on('dialogDefinition', function( ev )
	{
		var dialogName = ev.data.name;
		var dialogDefinition = ev.data.definition;

		if ( dialogName === 'table' ) {
		  setupDialogTable( dialogDefinition );
		}
	});

	CKEDITOR.on('instanceReady', function( ev ) {
		$('.wiki-page-document .cke_inner:first').resize(function() {
			if ( $(this).height() > 10 && $(this).parents('.wiki-page-document').length> 0 ) {
				$('.wiki-page-document .documentToolbar').css({
					'min-height': $(this).height() + 1
				})
			}
		});
		$('.cke_inner:first').trigger('resize');
	});
}

function setupWysiwygEditor( editor_id, toolbar, rows, modify_url, appVersion, project )
{
	if ( typeof CKEDITOR == 'undefined' ) return;
	CKEDITOR.timestamp = appVersion;
		
	var element = document.getElementById(editor_id);

	if ( $(element).hasClass('cke_editable') ) return true;
		
	if ( $(element).attr('contenteditable') != 'true' )
	{
		var editor = CKEDITOR.replace( element, {
			toolbar: ALM_toolbars[toolbar],
			removePlugins: toolbar == '' ? removePluginsEmptyToolbar : removePlugins,
			height: rows,
			enterMode: CKEDITOR.ENTER_P,
			resize_enabled : false,
			language: devpromOpts.language == '' ? 'en' : devpromOpts.language,
			contentsCss: ['/pm/'+project+'/scripts/css/?v='+appVersion],
			startupFocus: $(element).is(':focus')
		});
		if ( editor == null ) {
			reportBrowserError(element);
			return;
		}

		editor.on('instanceReady', function(e) 
		{
			e.editor.updateElement();
			
	      	registerBeforeUnloadHandler($(element).parents('form').attr('id'), function() 
	      	{
		      	e.editor.updateElement();
		      	return true;
	      	});

	      	registerFormValidator($(element).parents('form').attr('id'), function() 
	      	{ 
		      	e.editor.updateElement();
		      	return true;
	      	});
	      	
	      	registerFormDestructorHandler($(element).parents('form').attr('id'), function () {
	      		e.editor.destroy();
	      	});
	      	
			e.editor.dataProcessor.writer.setRules('p', {
                breakAfterClose: false
            });

            var editableElement = $(e.editor.editable().$);
            buildPastable(editableElement);
			makeupEditor(e.editor, editableElement, 'body', $('#cke_'+editor_id+' .cke_wysiwyg_frame').offset());

			if ( !$.browser.msie ) {
				e.editor.updateElement();
				originalFormState = $('#modal-form form[id]').formSerialize();
			}
		});
	}
	else
	{
		var editor = CKEDITOR.inline( element, {
			toolbar: ALM_toolbars[toolbar],
			removePlugins: toolbar == '' ? removePluginsEmptyToolbar : removePlugins,
			enterMode: toolbar == '' ? CKEDITOR.ENTER_BR : CKEDITOR.ENTER_P,
			allowedContent: toolbar != '',
			language: devpromOpts.language == '' ? 'en' : devpromOpts.language,
			sharedSpaces: {top: 'documentToolbar'}
		});
		if ( editor == null ) {
			reportBrowserError(element);
			return;
		}

		editor.persist = function( async )
		{
			var element = $('#' + this.name ); 
			var editorInstance = this;
			if ( typeof $(element).attr('objectClass') == 'undefined' ) {
				$('#'+$(element).attr('id')+'Value').val( editorInstance.getData() );
			}
			else if ( editorInstance.checkDirty() && !editorPersister )
			{
				try {
					var editorData = editorInstance.getData();
					if ( editorData == '' && $(element).attr('attributeName') == 'Caption' ) return;
					editorPersister = $.ajax({
						type: "POST",
						url: modify_url,
						dataType: "html",
						data: {
							'class': $(element).attr('objectClass'),
							'object': $(element).attr('objectId'),
							'attribute': $(element).attr('attributeName'),
							'version': $(element).attr('version'),
							'value': editorData,
							'parms': {ContentEditor: 'WikiRtfCKEditor'}
						},
						proccessData: false,
						async: true,
						success: function (result, status, xhr) {
							try {
								var resultJson = jQuery.parseJSON(result);
								if (typeof resultJson.message != 'undefined' && resultJson.message == 'denied' ) {
									throw resultJson.description;
								}
								if (typeof resultJson.modified != 'undefined') {
									$(element).parents('[modified]').attr('modified', resultJson.modified);
								}
								if (typeof resultJson.version != 'undefined') {
									$('.cke_editable[version][objectid='+$(element).attr('objectid')+']').each(function(){
										$(this).attr('version', resultJson.version);
									});
									$(element).attr('version', resultJson.version);
									$(element).parents('[object-id]')
										.find('.cke_editable[version]')
										.attr('version', resultJson.version);

								}
								if ( editorData == editorInstance.getData() ) {
									// reset dirty state if data was not changed during persistance
									editorInstance.resetDirty();
								}
							}
							catch(e) {
								reportError(e.toString());
							}
						},
						error: function (xhr, status, error) {
							reportError(ajaxErrorExplain(xhr, error));
						},
						complete: function(xhr, status, error) {
							editorPersister = null;
						},
						statusCode: {
							500: function (xhr) {
								window.location = '/500';
							}
						}
					});
				}
				catch(e) {
					reportError(e.toString());
				}
			}
		};

		editor.persisterInterval = setInterval(
			function(e) {
				e.persist(true);
			},
			1500, editor
		);

		editor.on('instanceReady', function(e)
		{
	      	registerBeforeUnloadHandler('global', function() {
				if ( e.editor.checkDirty() ) return text('form-modified');
	      	});
	    			
			if ( $(element).hasClass('wysiwyg-field') || $(element).parents('.embedded_form').length > 0 ) {
		      	registerFormValidator($(element).parents('form').attr('id'), function() {
					e.editor.persist(true);
		      		return true;
			    });
		      	
		      	registerFormDestructorHandler($(element).parents('form').attr('id'), function () {
		      		e.editor.destroy();
		      	});
			}

			$(element).attr('title', '');
            $(element).removeAttr('style');
			
			$(element).find('a[href]').click( function(e) {
				e.stopImmediatePropagation();
				window.location = $(this).attr('href');
			});
			
			e.editor.dataProcessor.writer.setRules('p', {
                breakAfterClose: false
            });

			var editor = $(e.editor.editable().$);
			buildPastable(editor);
            makeupEditor(e.editor, editor, 'body');
		});

		editor.on('panelShow', function(e) {
			var panelElement = $(e.data.element.$);
			var stickedParent = panelElement.parents('.sticked');
			if (stickedParent.length < 1) return;
			panelElement.css({
				'left': panelElement.position().left + stickedParent.position().left
			});
		});
	}
	
	editor.custom = { 
		id: $(element).attr('id'),
		objectclass: $(element).attr("objectclass")
	};
	
	setupEditor( editor );
}

function reportBrowserError(element)
{
	$(element).replaceWith('<div class="alert alert-danger" role="alert">'+cket('wrong-browser')+'<br/>'+$(element).html()+'</div>');
}

function pasteImage(ev, data)
{
    var elem = $(ev.target);
    var originalImage = new Image;
    if ( data.blob.size > 1048576 ) {
        originalImage.onload = function() {
            var maxWidth = 1024;
            var canvas = document.createElement('canvas')
            var ctx = canvas.getContext('2d');
            var scaledWidth = Math.min(maxWidth, originalImage.width);
            var scaledHeight = (scaledWidth / originalImage.width ) * originalImage.height;
            canvas.width = scaledWidth;
            canvas.height = scaledHeight;
            ctx.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight);

            var scaledImage = new Image;
            scaledImage.onload = function() {
                $(scaledImage)
                    .attr("height",scaledImage.height)
                    .attr("width",scaledImage.width);
                if ( CKEDITOR.currentInstance ) {
                    CKEDITOR.currentInstance.insertHtml(scaledImage.outerHTML)
				}
				else {
                    elem.canContainText()
                        ? elem.append(scaledImage)
                        : $(scaledImage).insertAfter(elem);
				}
            };
            scaledImage.src = canvas.toDataURL();
        };
    }
    else {
        originalImage.onload = function() {
            $(originalImage)
                .attr("height",originalImage.height)
                .attr("width",originalImage.width);
            if ( CKEDITOR.currentInstance ) {
                CKEDITOR.currentInstance.insertHtml(originalImage.outerHTML);
            }
            else {
                elem.canContainText()
                    ? elem.append(originalImage)
                    : $(originalImage).insertAfter(elem);
            }
        };
    }
    originalImage.src = data.dataURL;
}

function makeupEditor( editor, e, container, offset )
{
	var project = editor.element.getAttribute('project');
	var objectClass = editor.element.getAttribute('objectclass');

	var templates = [];
	var templatesUrl = '/pm/'+project+
		'/module/wrtfckeditor/searchtexttemplate?export=list&objectclass=' + objectClass;
	var mentionsUrl = '/pm/'+project+'/mentions?class=' + objectClass;

    editor.dataProcessor.htmlFilter.addRules( {
        elements: {
            a: function( element ) {
                element.attributes.target = '_blank';
            }
        }
    });

	makeupAnnotations(e);
    if (typeof window.makeupTerms !== 'undefined') makeupTerms(e);

    if ( objectClass == 'TestCaseExecution' ) {
        e.find('table tr > th').each(function(index) {
            if ( $(this).hasClass('readonly-on-run') ) {
                e.find('table tr > td:nth-child('+(index+1)+')').attr('contenteditable', 'false');
			}
        });
    }

	var mentionsKey = project + objectClass;
    if ( !Array.isArray(mentions[mentionsKey]) ) {
        mentions[mentionsKey] = [];
	}

    e.textcomplete([
		{ // mentions
			mentions: mentions[mentionsKey],
			match: /\B@([^\s]*)\s?$/,
			search: function (term, callback) {
				if ( mentions[mentionsKey].length < 1 ) {
					$.getJSON(mentionsUrl, function(data) {
                        mentions[mentionsKey] = data;
						callback($.map(mentions[mentionsKey], function (mention) {
							return mention.Id.toLowerCase().indexOf(term.toLowerCase()) === 0 ? mention.Caption : null;
						}));
					});
				}
				else {
					callback($.map(mentions[mentionsKey], function (mention) {
						return mention.Id.toLowerCase().indexOf(term.toLowerCase()) === 0 ? mention.Caption : null;
					}));
				}
			},
			index: 1,
			replace: function (selectedMention) {
				var selected = $.map(mentions[mentionsKey], function (mention) {
					return mention.Caption == selectedMention ? mention.Id : null;
				});
				return '@' + selected.shift();
			},
			template: function (value) {
				var selected = $.map(mentions[mentionsKey], function (mention) {
					return mention.Caption == value ? mention : null;
				});
				if ( selected[0].PhotoColumn < 0 && selected[0].PhotoRow < 0 ) {
					return '<i class="icon-briefcase"></i>' + value;
				}
				else {
					return '<div class="user-mini-mention" style="background: url(/images/userpics-mini.png) no-repeat -'+(parseInt(selected[0].PhotoColumn) * 18)+'px -'+(parseInt(selected[0].PhotoRow) * 18)+'px;"></div>' + value;
				}
			}
		},
		{ // templates
			mentions: templates,
			match: /\B#([^\s]*)\s?$/,
			search: function (term, callback) {
				$.getJSON(templatesUrl, function(data) {
					templates = data;
					callback($.map(data, function (template) {
						return template.Id.toLowerCase().indexOf(term.toLowerCase()) === 0 ? template.Id : null;
					}));
				});
			},
			index: 1,
			replace: function (templateId) {
				var selected = $.map(templates, function (template) {
					return template.Id == templateId ? template.Caption : null;
				});
				return selected.shift();
			}
		}],
		{
			zIndex: 9000,
			appendTo: container,
			maxCount: 60,
			topOffset: offset ? offset.top : 0,
			leftOffset: offset ? offset.left : 0,
			onKeydown: function (e, commands) {
				if (e.ctrlKey && e.keyCode === 74) { // CTRL-J
					return commands.KEY_ENTER;
				}
			}
		}
	).on({
		'textComplete:select': function (e, value, strategy) {
			setTimeout(function() {
				editor.fire('change');
			}, 300);
		}
	});
}
(function ($) {
    var cannotContainText = ['AREA', 'BASE', 'BR', 'COL', 'EMBED', 'HR', 'IMG', 'INPUT', 'KEYGEN', 'LINK', 'MENUITEM', 'META', 'PARAM', 'SOURCE', 'TRACK', 'WBR', 'BASEFONT', 'BGSOUND', 'FRAME', 'ISINDEX'];
    $.fn.canContainText = function() {
        var tagName = $(this).prop('tagName').toUpperCase();
        return ($.inArray(tagName, cannotContainText) == -1);
    };
}(jQuery));

function buildPastable(editableElement) {
    if ($.browser.mozilla && $.browser.version >= '57' || detectIE()) return;
    editableElement.pastableContenteditable();
    editableElement.on( 'pasteImage', pasteImage);
}

$(document).ready( function()
{
	setupEditorGlobal( 'Files' );
});
