<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

 

        <style>
            *{
                margin: 0;
                padding: 0;
                /* border: 1px solid red; */
                box-sizing: border-box;
            }

            .write_form_wrap {
                width: 900px;
                height: 1100px;
                padding: 40px;
                margin: 0 auto;
                border: 1px solid red;
               	margin-top: 150px;
            }

            .write_form_wrap input[type="text"] {
                padding-left: 15px;
            }

            #form_title{
                display: inline-block;
                font-size: 20px;
                font-weight: bold;
            }
        
            .write_input_form {
                padding: 30px;
                height: 1000px;
            }
        
            .input_form_header {
                width: 100%;
                height: 30px;
                padding: 0;
                margin-bottom: 20px;
            }
            
            #board_head {
                width: 15%;
                height: 100%;
                display: inline-block;
                margin-right: 30px;
                top: 0;
                bottom: 0;
                vertical-align: middle;
            }

            .board_title {
                width: 80%;
                height: 100%;
                margin-top: 0;
                top: 0;
                bottom: 0;
                vertical-align: middle;
                
            }

            .ms_file {
                width: 100%;
                height: 30px;
                margin-bottom: 20px;
            }

            .ms_file_label {
                display: inline-block;
                width: 10%;
                height: 30px;
                vertical-align: middle;
                top: 0;
                bottom: 0;
                margin-right: 30px;
                padding-top: 5px;
            }

            .ms_file input {
                display: inline-block;
                vertical-align: middle;
                width: 80%;
            }

            .ms_price {
                width: 100%;
                height: 30px;
                margin-bottom: 20px;
            }

            .ms_price div{
                float: left;
                width: 50%;
                height: 100%;
            }
            .ms_price input[type="number"] {

                margin-left: 20px;
            }
            .input_form_msInfo {
                width: 100%;
                height: 180px;
            }

            .msInfo_header {
                display: block;
                font-weight: bold;
                font-size: 14px;
                margin-bottom:10px;
            }

            .msInfo_content_area {
                width: 100%;
                height: 70%;
            }

            .msInfo_line {
                width: 100%;
                height: 30px;
                display: block;
            }

            .msInfo_label {
                display: inline-block;
                width: 15%;
                height: 100%;
                /* padding-left: 30px; */
                color: gray;
                font-size: 15px;
                /* border-right: 1px solid gray; */
            }

            .msInfo_line input {
                width: 84%;
                right: 0;
            }
            
            .board_content_area {
                width: 100%;
                height: 500px;
            }

            .write_input_footer {
                width: 100%;
                height: 140px;
                padding-top: 60px;
            }

            .write_btn_area {
                width: 205px;
                height: 30px;
                display: block;
                margin: 0 auto;

            }

            .write_btn_area button {
                width: 80px;
                height: 100%;
                background-color: rgb(5, 5, 32);
                color: white;
                border: none;
                /* border-radius: 5px; */
                outline: 0;
            }
            
           
            
            #write_cancle_btn {
                margin-right: 40px;
                
            }
        </style>
        
        


</head>
<body>

	<%@ include file="../common/nav.jsp" %>

    <!-- 악보공유 글쓰기 화면 -->
    <div class="write_form_wrap">
        <!-- 화면 정보 -->
        <span id="form_title">글쓰기</span>
        <!-- 악보공유 글쓰기 폼 -->
        <div class="write_input_form">
            <form action="<%=request.getContextPath()%>/playgroupWrite.in" method="post">
                <!-- header: 말머리, 제목 -->
                <div class="input_form_header">
                
                    <select name="header" id="board_head">
                        <option value="0" selected>말머리</option>
                        <option value="7">전국</option>
                        <option value="8">수도권</option>
                        <option value="9">강원도</option>
                        <option value="10">전라도</option>
                        <option value="11">대전/충청</option>
                        <option value="12">대구/경북</option>
                        <option value="13">부산/경남</option>
                    </select>

                    <input type="text" name="BTITLE" class="board_title" placeholder="제목">
                </div>

                

                <!-- 본문 글쓰기 -->
                <div class="board_content_area">

					<%@ include file="playgroupWrite.jsp" %>


                </div>

                <div class="write_input_footer">
                    <div class="write_btn_area">
                        <button type="button" id="write_cancle_btn">취소</button>
                        <button type="submit" id="write_submit_btn" name ="submit">등록</button>
                    </div>
                </div>

            </form>

        </div>

    </div> 
  

</body>
</html>