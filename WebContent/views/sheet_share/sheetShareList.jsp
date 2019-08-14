<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../style/sheetShareList.css">
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
    <section>
        <div class="tab-section">
                <span id="tab-1" class="tab-btn"></span>
                <a href="#tab-1" class="tab-link tab1">포인트</a>
                <div class="tab-content table1" >
                    <table align="center" class ="listArea">
                        <tr>
                            <th width="100px">말머리</th>
                            <th width="500px">제목</th>
                            <th width="100px">작성자</th>
                            <th width="100px">조회수</th>
                            <th width="200px">작성일</th>
                        </tr>
                        <tr>
                            <td width="100px">[피아노]</td>
                            <td width="500px"><a>Way Back Home - 숀</a></td>
                            <td width="100px">다우니</td>
                            <td width="100px">조회수</td>
                            <td width="200px">작성일</td>
                        </tr>
                    </table>
                </div>
                
                <span id="tab-2" class="tab-btn"></span>
                <a href="#tab-2" class="tab-link tab2" >캐시</a>
                <div class="tab-content table2">
                        <table align="center" class ="listArea">
                                <tr>
                                    <th width="100px">말머리</th>
                                    <th width="500px">제목</th>
                                    <th width="100px">작성자</th>
                                    <th width="100px">조회수</th>
                                    <th width="200px">작성일</th>
                                </tr>
                                <tr>
                                    <td width="100px">[기타]</td>
                                    <td width="500px"><a>집에가고싶어요</a></td>
                                    <td width="100px">ekdns</td>
                                    <td width="100px"></td>
                                    <td width="200px">sysdate</td>
                                </tr>
                            </table>                   
                </div>
        </div>
    <div class="pagWrap">
            <a href="#">페이징 처리</a>
        <button class="writeBtn">글쓰기</button>        
    </div>

    <div class = "search">
        <form class = "searchForm">
            <input type="text" class="searchInput">
            <span><button type="submit" class = "searchSubmit">검색</button></span>
        </form>
    </div>
    
</section>

<script>
        (function() {
        // 처음 탭만 활성화 시켜놓음
        if (!!location.hash) return;

        var link = document.querySelector('.tab-section > .tab-link');
        if (link) link.click();
    })();

    $(document).ready(function() {
        
        $(".table2").css("display", "none");
        $(".table1").css("display","block");
        $(".tab1").click(function(){
            $(".table2").css("display", "none");
            $(".table1").css("display", "block");
        });
        $(".tab2").click(function(){
            $(".table1").css("display", "none");
            $(".table2").css("display", "block");
        });
        
    });
</script>
</body>
</html>