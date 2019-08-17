<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@page import="board.model.vo.PageInfo"%>
	<%@page import="board.model.vo.Board"%>
	<%@page import="java.util.ArrayList"%>  
     <%
    	ArrayList<Board> list =(ArrayList<Board>)request.getAttribute("list"); // 그냥 게시물에 대한 정보
     
    PageInfo pInf = (PageInfo)request.getAttribute("pInf");
    
    int boardCount = pInf.getBoardCount();
    int currentPage = pInf.getCurrentPage();
    int maxPage = pInf.getMaxPage();
    int startPage = pInf.getStartPage();
    int endPage = pInf.getEndPage();
    int limit = pInf.getLimit();
    int pagingBarSize = pInf.getPagingBarSize();
    
  
    
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageBoard</title>
<style>
section{
            position: relative;
            top: 8rem;
            left: 14rem;
            width: 74%;
            height: 900px;
        }
        header{
            width: 100%;
            height: 20%;
        }
        aside{
            display: inline-block;
            width: 15%;
            height: 60%;
            position: absolute;
            top: 18rem;
        }

            .vertical-menu {
            width: 100%;
            
            height: 100%;
        }
    
        .vertical-menu>a {
        background-color: #eee;
        color: black;
        display: block;
        padding: 12px;
        text-decoration: none !important;
        font-size: 16px;
        }

        .vertical-menu a:hover {
        background-color: rgb(241, 196, 15);
        }

        .vertical-menu a.active {
        background-color: rgb(241, 196, 15);
        color: white;
        }

        .content{
            position: absolute;
            top: 14rem;
            left: 19rem;
            width: 78.5%;
            height: 800px;
            
        }
        
       

        .content-list{
            width: 100%;
            height: 15%;
        }

        .user-info{
            width: 100%;
            height: 85%;
            border: 1px solid black;
        }

        .header-left{
            width: 18%;
            height: 100%;
            float: left;
            background-color: darkgrey;
            text-align: center;
            display: table;
        }
        .header-left>span{
            display: table-cell;
            vertical-align: middle;
            font-size: 1.5rem;

            color: whitesmoke;
        }
        .bg-primary{
            z-index: 2;
        }

        .header-right{
            float: left;
            width: 82%;
            height: 100%;
        }

        .header-right div{
            float: left;
            text-align: center;
            display: table;
        }

        .header-right div span{
            display: table-cell;
            vertical-align: middle;
        }
        .header-right>div>span>p{
            margin: 0.5rem;
        }

        .header-right>div:nth-child(1){
            width: 23%;
            height: 100%;
            font-size: 1.5rem;
        }
        .header-right>div:nth-child(2){
            width: 23%;
            height: 100%;
            font-size: 1.1rem;
        }
        .header-right>div:nth-child(3){
            width: 23%;
            height: 100%;
            font-size: 1.1rem;
        }
        .header-right>div:nth-child(4){
            width: 31%;
            height: 100%;
            font-size: 1.2rem;
        }
        
       .selectBtn{
		background-color: white;
		color : blue;
	}
	
	.pagingBtn{
		text-decoration: none;
		display : inline-block;
		width : 25px;
		height : 25px;
	}
	



        * {
                margin: 0;
                box-sizing: border-box;
            }

            *:before,
            *:after {
                box-sizing: border-box;
            }

            a {
                text-decoration: none;
            }

            .tab-section {
                margin: 0;
                position: relative;
                width: 100%;
                height: 550px;
                border: 1px solid #d0d0d0;
                font-size: 0;
            }
            .tab-section::before,
            .tab-section::after {
                display: table;
                content: "";
            }
            .tab-section::after {
                clear: both;
            }
            .tab-section .tab-content {
                width: 100%;
                font-size: 12px;
                position: absolute;
                float: left;
                padding: 10px;
                opacity: 0;
                color:black;
                -webkit-transition: all .4s ease;
                transition: all .4s ease;
            }
            .tab-section .tab-link {
                position: relative;
                display: inline-block;
                text-align: center;
                width: 50%;
                font-size: 15px;
                background: #e8e8e8;
                padding: 10px 0;
                border-bottom: 1px solid #d0d0d0;
                color: #5b5b5b;
                overflow: hidden;
            }
            .tab-section .tab-link:after {
                content: "";
                left: -75px;
                opacity: 1;
                position: absolute;
                top: 0;
                background: #fff;
                width: 50%;
                height: 100%;
                background: -webkit-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,.6) 100%);
                background: linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,.6) 100%);
                -webkit-transform: skewX(-25deg);
                transform: skewX(-25deg);
                -webkit-transition: all .55s cubic-bezier(0.19, 1, 0.22, 1);
                transition: all .55s cubic-bezier(0.19, 1, 0.22, 1);
            }
            .tab-section .tab-link:hover:after {
                -webkit-animation: shine .75s;
                animation: shine .75s;
            }
            @-webkit-keyframes shine {
                100% {
                    left: 125%;
                }
            }
            @keyframes shine {
                100% {
                    left: 125%;
                }
            }

            #listArea{
                width: 100%;
            }

            .tab-btn:target + .tab-link {
                background: #fff;
                font-weight: bold;
                color: #000;
            }
            .tab-btn:target + .tab-link:hover:after {
                -webkit-animation: -1s;
                animation: -1s;
            }
            .tab-btn:target + .tab-link + .tab-content {
                opacity: 1;
            }
            th{
                border-bottom: 1px solid gray;
                padding-bottom: 1%;
            }
            td{
            font-size: 15px;
            border-bottom: 1px solid lightgray;
            padding-top: 5px;
            color: rgb(99, 96, 96);
            }
            .tab-content th:nth-of-type(1), .tab-content td:nth-of-type(1){
                width: 7.2%;
            }
            .tab-content th:nth-of-type(2), .tab-content td:nth-of-type(2){
                width: 10%;
            }
            .tab-content th:nth-of-type(3), .tab-content td:nth-of-type(3){
                width: 50%;
            }
            .tab-content th:nth-of-type(4), .tab-content td:nth-of-type(4){
                width: 15%;
            }
            .tab-content th:nth-of-type(5), .tab-content td:nth-of-type(5){
                width: 10%;
            }
            .tab-content th:nth-of-type(6), .tab-content td:nth-of-type(6){
                width: 10%;
            }

            #writeBtn{
                float: right;
                margin-right: 0;
                margin-left: 0;
                border-radius: 5px 5px 5px 5px;
                background-color: rgba(0,0,0,0);
                width: 100px;
                height: 40px;
            }
            #pagWrap {
                /* border: 1px solid black; */
                margin: 0;
                margin-top: 3%;
                width:100%;
                height: 50px;
                position: relative;
                text-align: center;
            }




            #search{
                margin: auto;
                width:1000px;
                height: 50px;
                
                position: relative;
                text-align: center;
            }
            #searchForm{
                position: absolute;
                margin: auto;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;

            }
            #searchInput{
                width: 30%;
                height: 30px;
                box-sizing: border-box;
                border: none;
                background-color: lightgray;
            }
            #searchSubmit{
                border-radius: 5px 5px 5px 5px;
                background-color: rgba(0,0,0,0);
                width: 80px;
                height: 35px;
            }

</style>
</head>
<body>

	<%@ include file="../common/nav.jsp"%>
	
	<section>
        <header>
            <div class="content-list">
                <h5>마이페이지 > 출석체크</h5>
            </div>
            <div class="user-info">
                <div class="header-left"><span>User ID</span></div>
                <div class="header-right">
                    <div><span>닉네임</span></div>
                    <div>
                        <span>
                            <p>보유 포인트</p>
                            <p style="color:rgb(37, 223, 161)">4060p</p>
                        </span>
                    </div>
                    <div>
                        <span>
                            <p>보유 캐시</p>
                            <p style="color:rgb(37, 223, 161)">5010cash</p>
                        </span>
                    </div>
                    <div>
                        <span><button class="modified-btn">정보 수정</button></span>
                    </div>
                </div>
            </div>
        </header>

        <aside>
            <div class="vertical-menu">
                <a href="#" >출석체크</a>
                <a href="#" class="active">내가 쓴 글 확인</a>
                <a href="#">다운로드 악보/찜한 악보</a>
                <a href="#">업로드 악보</a>
                <a href="#">캐시 충전</a>
                <a href="#">인증하기</a>
                <a href="#">탈퇴</a>
            </div>
        </aside>

        <div class="content">
			<div class="tab-section">
				<span id="tab-1" class="tab-btn"></span>
				<a href="#tab-1" class="tab-link tab1">내가 작성한 게시글 보기</a>
				<div class="tab-content table1">
					<table align="center" id ="listArea1">
						<thead>
							<tr>
								<th><input type="checkbox" id="#ck_all" class="allcheck"></th>
					
								<th width="120px">말머리</th>
								<th width="530px">제목</th>
								<th width="100px">작성자</th>
								<th width="100px">조회수</th>
								<th width="150px">작성일</th>
							</tr>
						</thead>
							<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="6">등록된 게시글이 없습니다.</td>
						</tr>
						<% }else { %>

							<% for(Board b : list){ %> 
						<tr>
							<td class="b"> <input type="checkbox" name="isDelete" value="<%=b.getbNo() %>"> </td> 
							<td class="b"><%= b.getheader()%></td> 
							<td class="b"><%= b.getbTitle() %></td>         
							<td class="b"><%= b.getwriter() %></td> 
							<td class="b"><%= b.getbCount() %></td> 
							<td class="b"><%= b.getCreateDate() %></td> 
						
							     
						</tr>
							<% } %>	
						<% } %>	
                          
                           
                       
					</table>
				</div>
                        
				<span id="tab-2" class="tab-btn"></span>
				<a href="#tab-2" class="tab-link tab2">내가 작성한 댓글 보기</a>
				<div class="tab-content table2">
				<table align="center" id ="listArea">
				    <thead>
				    <tr>
				        <th><input type="checkbox" class="allcheck2"></th>
				        <th width="100px">말머리</th>
				        <th width="500px">제목</th>
				        <th width="100px">작성자</th>
				        <th width="100px">조회수</th>
				        <th width="200px">작성일</th>
				    </tr>
				    </thead>
				   
				</table>
			</div>
		</div>
		<div id="pagWrap">
		   <!-- <a href="#">페이징 처리</a> -->
			<button id="writeBtn">선택삭제</button>
		
		
	        <!------- 페이징 바 ------->
			<!-- 페이징 처리 시작! -->
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로(<<) -->
				<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/myPageList.me?currentPage=1'">&lt;&lt;</span>
			
				<!-- 이전 페이지로(<) -->
				<% if(currentPage <= 1) { %>
					<span class="pagingBtn">&lt;</span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/myPageList.me?currentPage=<%= currentPage-1 %>'">&lt;</span>
				<% } %>
				
				<!-- 페이지 목록 -->
				<% for(int p = startPage; p <= endPage; p++){ %>
					<% if(p == currentPage) { %>
						<span class="pagingBtn selectBtn"><%= p %></span>
					<% } else{ %>
						<span class="pagingBtn clickBtn" 
							onclick="location.href='<%= request.getContextPath() %>/myPageList.me?currentPage=<%= p %>'"><%=p%></span>
					<% } %>
				<%} %>
				
				<!-- 다음 페이지로(>) -->
				<% if(currentPage >= maxPage){ %>
					<span class="pagingBtn"> &gt; </span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/myPageList.me?currentPage=<%= currentPage+1 %>'">&gt;</span>
				<% } %>
				
				<!-- 맨 끝으로(>>) -->
				<span class="pagingBtn clickBtn"
					onclick="location.href='<%= request.getContextPath() %>/myPageList.me?currentPage=<%= maxPage %>'">&gt;&gt;</span>
			</div>
	                
		</div>
	        
	    <!-- <div id = "search">
	        <form id = "searchForm">
	            <input type="text" id="searchInput">
	            <span><button type="submit" id = "searchSubmit">검색</button></span>
	        </form>
		</div> -->
							
						
    </section>
    
    <script>
        (function() {
        // 처음 탭만 활성화 시켜놓음
        if (!!location.hash) return;

        var link = document.querySelector('.tab-section > .tab-link');
        if (link) link.click();
    })();

    $(".tab1").click(function(){
        $(".table2").css("display","none");
        $(".table1").css("display","block");
        $("input:checkbox").prop("checked",false);
    });

    $(".tab2").click(function(){
        $(".table1").css("display","none");
        $(".table2").css("display","block");
        $("input:checkbox").prop("checked",false);
    });

    $(".allcheck").on('change', function(){
        if($(this).is(":checked")){
            $("input[name=isDelete]").prop("checked",true);
        }else{
            $("input[name=isDelete]").prop("checked",false);
        }

    });
    
     
     $(function(){
		// 게시판 상세보기
		$("#listArea1 td").click(function(){
			var bNo = $(this).parent().children().children().val();
    		console.log(bNo);
			location.href="<%= request.getContextPath() %>/detail.bo?bNo="+bNo;
			
		}); 
    
    
    $('#writeBtn').click(function(){
        if(confirm("삭제하시겠습니까?")){
            var list = $("input[name=isDelete]");
            var checkedList = "";
            $.each(list, function(i){
            	if($(this).prop("checked")) {    
            		checkedList += $(this).val() +",";
            	}
            });
            checkedList = checkedList.slice(0, -1);
            console.log(checkedList);
           location.href="<%= request.getContextPath() %>/deleteMyBoardList.bo?deleteBoards="+checkedList;
        }else{
            return false;
        }
    });							
	
     });	
							
    </script>

</body>
</html>