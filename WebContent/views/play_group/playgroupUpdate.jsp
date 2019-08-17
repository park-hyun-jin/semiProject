<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("board");
	String horseHeader = b.getheader();
	
	int header = 0;
	switch(horseHeader){
	case "전국": header = 7; break;
	case "수도권": header = 8; break;
	case "강원도": header = 9; break;
	case "전라도": header = 10; break;
	case "대전/충청": header = 11; break;
	case "대구/경북": header = 12; break;
	case "부산/경남": header = 13; break;
	
	}
	String[] selected = new String[7];
	selected[header-7] = "selected";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/views/style/writeForm.css">
</head>
<body>
	<%@ include file="../common/nav.jsp" %>

    <!-- 악보공유 글쓰기 화면 -->
    <div class="write_form_wrap">
        <!-- 화면 정보 -->
        <span id="form_title">글쓰기</span>
        <!-- 악보공유 글쓰기 폼 -->
        <div class="write_input_form">
            <form action="<%=request.getContextPath()%>/playgroupWrite.up" method="post">
                <!-- header: 말머리, 제목 -->
                <div class="input_form_header">
                	<input type="hidden" name="bNo" value=<%= b.getbNo() %>></th>
                    <select name="header" id="board_head">
                        <option value="0" selected>말머리</option>
                        <option value="7" <%= selected[0] %>>전국</option>
                        <option value="8" <%= selected[1] %>>수도권</option>
                        <option value="9" <%= selected[2] %>>강원도</option>
                        <option value="10" <%= selected[3] %>>전라도</option>
                        <option value="11" <%= selected[4] %>>대전/충청</option>
                        <option value="12" <%= selected[5] %>>대구/경북</option>
                        <option value="13" <%= selected[6] %>>부산/경남</option>
                    </select>

                    <input type="text" name="BTITLE" class="board_title" placeholder="제목" value = "<%=b.getbTitle()%>">
                </div>

                <!-- 본문 글쓰기 -->
                <div class="board_content_area">

					<%@ include file="playgroupWrite.jsp" %>


                </div>

                <div class="write_input_footer">
                    <div class="write_btn_area">
                        <button type="button" id="write_cancle_btn" onclick="location.href='<%=request.getContextPath()%>/playgroupWrite.li'">취소</button>
                        <button type="submit" id="write_submit_btn" name ="submit">수정하기</button>
                    </div>
                </div>

            </form>

        </div>

    </div> 
	<script>
	$("#summernote").summernote('editor.pasteHTML','<%=b.getbContent()%>');
	
	</script>
</body>
</html>