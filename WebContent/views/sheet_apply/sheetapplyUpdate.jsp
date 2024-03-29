<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("board");

	String header = b.getheader();
	int horseHeader = 0;
	
	switch(header){
	case "피아노": horseHeader = 1; break;
	case "기타": horseHeader = 2; break;
	case "바이올린": horseHeader = 3; break;
	case "플루트": horseHeader = 4; break;
	case "하모니카": horseHeader = 5; break;
	case "ETC": horseHeader = 6; break;

	
	}
	String[] selected = new String[6];
	selected[horseHeader-1] = "selected";
	
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
            <form action="<%=request.getContextPath()%>/sheetapplyWrite.up" name="writeFormUpdate" method="post">
                <!-- header: 말머리, 제목 -->
                <div class="input_form_header">
                	<input type="hidden" name="bNo" value=<%= b.getbNo() %>>
                        <select name="header" id="board_head">
                        <option value="0" selected>말머리</option>
                        <option value="1" <%= selected[0] %>>피아노</option>
                        <option value="2" <%= selected[1] %>>기타</option>
                        <option value="3" <%= selected[2] %>>바이올린</option>
                        <option value="4" <%= selected[3] %>>플루트</option>
                        <option value="5" <%= selected[4] %>>하모니카</option>
                        <option value="6" <%= selected[5] %>>ETC</option>
                    </select>
                    

                    <input type="text" name="BTITLE" class="board_title" placeholder="제목" value ="<%=b.getbTitle()%>">
                </div>

                <!-- 본문 글쓰기 -->
                <div class="board_content_area">

					<%@ include file="../play_group/playgroupWrite.jsp" %>


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
		location.href='<%= request.getContextPath() %>/sheetapplyWrite.de?bNo=<%= b.getbNo() %>';
	});
	</script>
</body>
</html>