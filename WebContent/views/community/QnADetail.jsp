<%@page import="board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("board");
	
	 String[] writer = b.getwriter().split(",");
	int uNo = Integer.parseInt(writer[0]);
	String nickName = writer[1]; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                             <span><%= b.getbTitle() %></span>
                        </div>
                    	
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
                        <div class = "reply_List_Content" >
                            <table id = "reply_List_Content">
                               <!--  <tr>
                                    <th width="600px">내용</th>
                                    <th width="150px">작성자</th>
                                    <th width="150px">작성일</th>
                                </tr>  -->
                                
                            </table>
                        </div>
                    </div>
</html>