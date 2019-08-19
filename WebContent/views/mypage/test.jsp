<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Insert title here</title>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/bootstrap.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <style>
    
    .certification_label{
    width: 100px;
    
    }
        
	
        </style>

</head>
<body>

	<%@ include file="../common/nav.jsp"%>

	<section>
		<%@ include file="myPageFrame.jsp"%>
		<div class="content">
		
	<form method="post" action="<%=request.getContextPath() %>/certificationInput.do" id="certification_form_input">
                <div id="certification_input_info">
                    
                   	<span id="url_label" class="certification_label">url을 입력해주세요</span>
                    <div id="url_input_name" class="certification_input_area">
                    <input type="text" class="info" id="urlName" name="urlName" required>
                    </div>
                              
                     <span id="accountNumber_label" class="certification_label">계좌번호를 입력해주세요</span>
                    <div id="accountNumber_input_name" class="certification_input_area">
                        <input type="text" class="info" id="accountNumber" name="accountNumber" required>
                    </div>       
                           
                        
                    <span id="content_label" class="certification_label">내용을 입력해주세요</span>
                    <div id="content_input_name" class="certification_input_area">
                        <input type="text" class="info" id="contenst" name="content" required>
                    </div>
                    

                     <span id="certificationPicture_label" class="certification_label">인증 사진을 첨부해주세요</span>
                    <div id="certification_input_name" class="certification_input_area">
                        <input type="file" class="info" id="pictureName" name="pictureName" required>
                    </div>
                    
                    
                   <div id="submission_btn_area" class="submission_btn_area">
                        <span id="middle_line"><hr></span>
                        <button type="submit" id="go_submission" class="submission_btn">제출하기</button>
                    </div>
                </div>
            
            </form>
        </div>
        
      
	
	</section>

	<script>
	$(document).ready(function(){
		
		$(".absence").addClass("active");

	});
	</script>

    
			


</body>
</html>