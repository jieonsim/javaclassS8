/**
 * 
 */
 
 CKEDITOR.replace("content", {
	height: 750,
	filebrowserUploadUrl: "${ctp}/imageUpload", /*파일(이미지)를 업로드시키기 위한 매핑 경로(메소드)*/
	uploadUrl: "${ctp}/imageUpload" /*여러개의 그림 파일을 드래그 앤 드랍해서 올릴 수 있다.*/
});