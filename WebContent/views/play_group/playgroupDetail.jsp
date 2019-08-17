<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.Board"%>

<%

Board b = (Board)request.getAttribute("board");

 String[] writer = b.getwriter().split(",");
int uNo = Integer.parseInt(writer[0]);
String nickName = writer[1]; 
%>
<!DOCTYPE html>
<html lang = "ko">
    <head>
    <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="views/style/playgroupDetail.css">
    </head>
	<%@ include file="../common/nav.jsp" %>
    <section>
    
            <!-- detail전체 감싸는 div -->
            <div class = "sheet_Detail_Wrap">
                <!-- detail안에 제목, 아이콘, 작성자 작성일 부분 -->
                <div class ="Detail_Header">
                    <!-- 제목, 아이콘 넣는 부분 -->
                    <div class ="Detail_Header_TI">
                        <!-- 제목  -->
                        <div class="Detail_Header_Title">
                        	<p>[<%= b.getheader() %>]</p>
                             <span><%= b.getbTitle() %></span>
                        </div>
                        <div class="Detail_Header_Icon"><img src="views/image/download.png"></div>
                        <div class="Detail_Header_Icon"><img src="views/image/like.png" class = "changeImg" onclick="changeImg();"></div>
                        <div class="Detail_Header_Icon"><img src="views/image/danger.png"></div>
                    </div>
                    <!-- 작성일 작성자 -->
                    <div class ="Detail_Header_WD">
                        <div class="Detail_Header_Writer"><%=nickName%></div>
                        <div class="Detail_Header_Date"><%=b.getCreateDate() %></div>
                    </div>
                   
    
                </div>
    
                <!-- detail안에 내용 들어오는 부분 -->
                <div class= "Detail_Content">
                    <div class="Detail_Content_Etc"><%=b.getbContent() %></div>
                </div>

                <!-- 댓글 -->
                <div class="reply_Wrap">
                    <!-- 댓글 리스트 -->
                    <div class = "reply_List">
                        <div class = "reply_List_TItle">
                            <table>
                                <tr>
                                    <td>댓글</td>
                                    
                                </tr>
                            </table>
                        </div>
                        <div class = "reply_List_Content">
                            <table>
                                <tr>
                                    <td>내용</td>
                                    <td>작성자</td>
                                    <td>작성일</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- 댓글 달기 -->
                    <div class="reply">
                        <div class="reply_Write">
                            <textarea name="reply" class= "reply_textarea" resize="none"></textarea>
                        </div>
                        <div class="reply_Btn">
                            <button type="submit" class="reply_Submit">댓글</button>
                        </div>
                    </div>
                </div>


                <!-- 목록 버튼 -->
                <div class= "Btn_Wrap">
                    <button class="List_Back_Btn" onclick="history.go(-1)">목록</button>
                    <% if(nickName.equals(loginUser.getNickName())) { %>
						<button class="List_Back_Btn2" type="button" onclick="updateBoard()">수정</button>
						<button class="List_Back_Btn2" type="button" onclick="deleteBoard();">삭제</button>
					<%}%>
                </div>
            </div> 
    </section>

    <script>
        function changeImg(){
            var changeImg =document.getElementsByClassName("changeImg");
            changeImg[0].src="views/image/liked.png";
        }
    </script>

</html>