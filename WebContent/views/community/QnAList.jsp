<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
    <head>
    <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/views/style/community.css">
    </head>
    <body>
            <aside>
                    <div class="vertical-menu">
                        <a href="#" class="active">공지사항</a>
                        <a href="#">자유게시판</a>
                        <a href="#">Q & A</a>
                    </div>
                </aside>
        <section class="community_content">
            <!-- 커뮤니티 게시판 -->
            <div class= "community_wrap">

                <!-- 페이지 이름 영역 -->
                <div class="commuity_header">
                    <span class="community_label"> 공지사항 </span>
                </div>
                <!-- 게시글 목록 -->
                <div class = "community_board_area">
                    <table align="center" class="community_table">
                        <tr class="table_header">
                            <th width="100px">번호</th>
                            <th width="500px">제목</th>
                            <th width="100px">작성자</th>
                            <th width="200px">작성일</th>
                        </tr>
                        <tr>
                            
                        </tr>
                    </table>
                </div>
                <!-- 페이징 처리 영역 -->
                <div class="pagWrap">
                    <a href="#">페이징 처리</a>     
                </div>
               <!-- 글쓰기 버튼 -->
               <div class="community_footer">
                    <button type = "button"class="writeBtn" onclick="location.href='<%=request.getContextPath()%>/qnaWrite.fo'">글쓰기</button> 
                </div>
                  <!-- 검색 영역 -->
               <div class = "search_area">
                   <form class = "searchForm">
                       <input type="text" class="searchInput">
                       <span><button type="submit" class = "searchSubmit">검색</button></span>
                   </form>
               </div>
            </div>

        </section>
    </body>
</html>