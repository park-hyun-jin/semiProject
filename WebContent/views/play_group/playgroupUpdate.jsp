<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("board"); // 넘긴 보드를 받아왔다  그거의 이름은 b이고 속성은 요거다  이거를 제목이나 이런거를 db에서 긁어올 수 있다. 

	String header = b.getheader(); // 보드에 있는 헤더를 헤더에 담고 헤더라고 하겠다 
	int horseHeader = 0;
	
	switch(header){ // 그 헤더를 가져와서 설정을 붙인다. db랑 똑같이 
	case "전국": horseHeader = 7; break;
	case "수도권": horseHeader = 8; break;
	case "강원도": horseHeader = 9; break;
	case "전라도": horseHeader = 10; break;
	case "대전/충청": horseHeader = 11; break;
	case "대구/경북": horseHeader = 12; break;
	case "부산/경남": horseHeader = 13; break;
	
	}
	String[] selected = new String[7]; // 선택된 것을 가져와야 하기에  selected 
	selected[horseHeader-7] = "selected";
	
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
            <form action="<%=request.getContextPath()%>/playgroupWrite.up" name="writeFormUpdate" method="post"> 
            <!-- 작성한것을 다시 업데이트 하기 위해서  -->
                <!-- header: 말머리, 제목 -->
                <div class="input_form_header">
                	<input type="hidden" name="bNo" value=<%= b.getbNo() %>></th> 
                	<!-- 글번호를 보여줄 필요 없으니 히든  -->
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

                    <input type="text" name="BTITLE" class="board_title" placeholder="제목" value ="<%=b.getbTitle()%>"> 
                    <!-- 내가 작성한 제목도 가져와야 하기에  -->
                    <!--그 보드의 제목을 가져오겠다  -->
                </div>

                <!-- 본문 글쓰기 -->
                <div class="board_content_area">

					<%@ include file="playgroupWrite.jsp" %>


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
	/* 수정을 할 때 내용을 다시 뜨는 걸 */
	/* function goSubmit() {
		document.writeFormUpdate.target="_parent";
		document.writeFormUpdate.submit();
	} */
	$("#write_cancle_btn").click(function(){
		alert("게시글 수정이 취소되었습니다.");
		location.href='<%= request.getContextPath() %>/playgroupWrite.de?bNo=<%= b.getbNo() %>';
	});
	</script>
</body>
</html>