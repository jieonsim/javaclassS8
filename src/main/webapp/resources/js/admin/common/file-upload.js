/*
js/admin/common/file-upload.js
템플릿 파일 업로드 스크립트
*/
(function($) {
	'use strict';
	$(function() {
		$('.file-upload-browse').on('click', function() {
			var file = $(this).parent().parent().parent().find('.file-upload-default');
			file.trigger('click');
		});
		$('.file-upload-default').on('change', function() {
			$(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
		});
	});
})(jQuery);