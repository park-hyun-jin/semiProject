<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../style/sheetShareDetail.css">
</head>
<body>
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
                             <span>Way Back Home - 숀</span>
                        </div>
                        <div class="Detail_Header_Icon"><img src="../image/download.png"></div>
                        <div class="Detail_Header_Icon"><img src="../image/like.png" class = "changeImg" onclick="changeImg();"></div>
                        <div class="Detail_Header_Icon"><img src="../image/danger.png"></div>
                    </div>
                    <!-- 작성일 작성자 -->
                    <div class ="Detail_Header_WD">
                        <div class="Detail_Header_Writer">작성자</div>
                        <div class="Detail_Header_Date">작성일</div>
                    </div>
                   
    
                </div>
    
                <!-- detail안에 내용 들어오는 부분 -->
                <div class= "Detail_Content">
                    <div class = "Detail_Content_Comment">
                        <div class ="Comment_composer" > 작곡가 : </div>
                        <div class ="Comment_title" > 제목 : </div>
                        <div class ="Comment_genre" > 장르 : </div>
                        <div class ="Comment_instrument" > 악기 : </div>
                    </div>
                    <div class = "Detail_Content_SheetImg"> 악보 사진</div>
                    <div class="Detail_Content_Etc">설명</div>
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
                    <button class="List_Back_Btn" onclick="history:back();">목록</button>  
                </div>
            </div> 
    </section>

    <script>
        function changeImg(){
            var changeImg =document.getElementsByClassName("changeImg");
            changeImg[0].src="../image/liked.png";
        }
    </script>

</body>
</html>