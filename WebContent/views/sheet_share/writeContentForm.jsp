<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 


<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>



</head>
<body>
<textarea name="content" id="summernote" ></textarea>

    <script>
	$(function(){
		$('#summernote').summernote({
	        height : 350,
	        onImageUpload: function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], editor, welEditable,this);
	            }
	        }
	    });

	});
	
	function sendFile(file, editor, welEditable,el) {
   // 파일 전송을 위한 폼생성
	form_data = new FormData();
	form_data.append("image", file);
	$.ajax({
        data: form_data,
        type: "post",
        url: "<%=request.getContextPath()%>/sheetSharePdf.ch",
        dataType: "text",
        cache: false,
        contentType: false,
        enctype: "multipart/form-data",
        processData: false,
        success: function(savename) {
        	$(el).summernote('editor.imsertImg',savename);
        	$("#imageBoard>ul").append('<li><img src ="' + savename +'width="250px" height= "250px" /></li>');
        },
        error: function() {
        	alert('error');
        }
	});
}

</script>
</body>
</html>