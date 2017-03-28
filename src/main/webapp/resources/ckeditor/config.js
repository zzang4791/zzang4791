/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.enterMode = CKEDITOR.ENTER_BR
	/*config.toolbarLocation = 'bottom';*/
	config.toolbar = [
	                  ['Font', 'FontSize'],
	                  ['BGColor', 'TextColor' ],
	                  ['Bold', 'Italic', 'Strike', 'Superscript', 'Subscript', 'Underline', 'RemoveFormat'],   
	                  ['BidiLtr', 'BidiRtl'],
	                  '/',
	                  ['Image', 'SpecialChar', 'Smiley'],
	                  ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
	                  ['Blockquote', 'NumberedList', 'BulletedList'],
	                  ['Link', 'Unlink'],
	                  ['Source'],
	                  ['Undo', 'Redo']
	          ];
	

};
