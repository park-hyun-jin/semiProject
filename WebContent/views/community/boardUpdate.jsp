<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("board");


	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/views/style/writeForm.css">
</head>
<body>
	<%-- <%@ include file="../common/nav.jsp" %> --%>

    <!-- 악보공유 글쓰기 화면 -->
    <div class="write_form_wrap">
        <!-- 화면 정보 -->
        <span id="form_title">글쓰기</span>
        <!-- 악보공유 글쓰기 폼 -->
        <div class="write_input_form">
            <form action="<%=request.getContextPath()%>/boardWrite.up" name="writeFormUpdate" method="post">
                <!-- header: 말머리, 제목 -->
                <div class="input_form_header">
                	<input type="hidden" name="bNo" value=<%= b.getbNo() %>></th>
                 

                    <input type="text" name="BTITLE" class="board_title" placeholder="제목" value = "<%=b.getbTitle()%>">
                </div>

                <!-- 본문 글쓰기 -->
                <div class="board_content_area">

					<%@ include file="boardgroupWrite.jsp" %>


                </div>

                <div class="write_input_footer">
                    <div class="write_btn_area">
                        <button type="button" id="write_cancle_btn" >취소</button>
                        <button type="submit" id="write_submit_btn" name ="submit">수정하기</button>
                        <!-- <button type="submit" id="write_submit_btn" name ="submit" onclick="goSubmit();">수정하기</button> -->
                    </div>
                </div>

            </form>

        </div>

    </div> 
	<script>
	$("#summernote").summernote('editor.pasteHTML','<%=b.getbContent()%>');
	/* function goSubmit() {
		document.writeFormUpdate.target="_parent";
		document.writeFormUpdate.submit();
	} */
	$("#write_cancle_btn").click(function(){
		alert("게시글 수정이 취소되었습니다.");
		location.href='<%= request.getContextPath() %>/boardgroupWrite.de?bNo=<%= b.getbNo() %>';
	});
	</script>
</body>
</html>