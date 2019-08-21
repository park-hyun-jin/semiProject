<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="board.model.vo.PageInfo"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>  
<%

 /*   	ArrayList<Board> list =(ArrayList<Board>)request.getAttribute("list"); // 그냥 게시물에 대한 정보
     
    PageInfo pInf = (PageInfo)request.getAttribute("pInf");
    
    int boardCount = pInf.getBoardCount();
    int currentPage = pInf.getCurrentPage();
    int maxPage = pInf.getMaxPage();
    int startPage = pInf.getStartPage();
    int endPage = pInf.getEndPage();
    int limit = pInf.getLimit();
    int pagingBarSize = pInf.getPagingBarSize();
     */
  
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
        
        #listArea1{
            width: 100%;
        }

        #listArea2{
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
        .table1 th:nth-of-type(1), .table1 td:nth-of-type(1){
            width: 7.2%;
        }
        .table1 th:nth-of-type(2), .table1 td:nth-of-type(2){
            width: 10%;
        }
        .table1 th:nth-of-type(3), .table1 td:nth-of-type(3){
            width: 15%;
        }
        .table1 th:nth-of-type(4), .table1 td:nth-of-type(4){
            width: 45%;
        }
        .table1 th:nth-of-type(5), .table1 td:nth-of-type(5){
            width: 10%;
        }
        .table1 th:nth-of-type(6), .table1 td:nth-of-type(6){
            width: 15%;
        }
        
        .table2 th:nth-of-type(1), .table2 td:nth-of-type(1){
            width: 7.2%;
        }
        .table2 th:nth-of-type(2), .table2 td:nth-of-type(2){
            width: 10%;
        }
        .table2 th:nth-of-type(3), .table2 td:nth-of-type(3){
            width: 25%;
        }
        .table2 th:nth-of-type(4), .table2 td:nth-of-type(4){
            width: 35%;
        }
        .table2 th:nth-of-type(5), .table2 td:nth-of-type(5){
            width: 10%;
        }
        .table2 th:nth-of-type(6), .table2 td:nth-of-type(6){
            width: 15%;
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
	<%@ include file="myPageFrame.jsp"%>
	
	
        <div class="content">
			<div class="tab-section">
				<span id="tab-1" class="tab-btn"></span>
				<a href="#tab-1" class="tab-link tab1" value="1">내가 작성한 게시글 보기</a>
				<div class="tab-content table1">
					<table align="center" id ="listArea1">
						<thead>
							<tr>
								<th><input type="checkbox" id="#ck_all" class="allcheck"></th>
								<th width="100px">게시판</th>
								<th width="120px">말머리</th>
								<th width="530px">제목</th>
								<th width="100px">조회수</th>
								<th width="150px">작성일</th>
							</tr>
						</thead>
						<tbody>
						
                           
                    	</tbody>
					</table>
				</div>
                        
				<span id="tab-2" class="tab-btn"></span>
				<a href="#tab-2" class="tab-link tab2" value="1">내가 작성한 댓글 보기</a>
				<div class="tab-content table2">
				<table align="center" id ="listArea2">
				    <thead>
				    <tr>
				        <th><input type="checkbox" class="allcheck2"></th>
				        <th >게시판</th>
				        <th >게시글 제목</th>
				        <th colspan='2'>댓글내용</th>
				        <th >작성일</th>
				    </tr>
				    </thead>
				  	<tbody>
				  	
				  	</tbody>
				</table>
			</div>
		</div>
		<div id="pagWrap">
		   <!-- <a href="#">페이징 처리</a> -->
			<button id="writeBtn">선택삭제</button>
		
		
	        <!------- 페이징 바 ------->
			<!-- 페이징 처리 시작! -->
			<div class="pagingArea" align="center">
				
			</div>
	                
		</div>
		
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
			location.href="<%= request.getContextPath() %>/playgroupWrite.de?bNo="+bNo;
			
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
	    
	    
		// 작성게시글 탭 선택시 목록조회 메소드 호출
		$(".tab1").click(function() {
			var movePage = $(this).val();
			console.log("이동할 페이지 : " + movePage);
			$(this).boardListShow(movePage);
		});
		
	
		// 작성댓글 탭 선택시 목록조회 메소드 호출
		$(".tab2").click(function() {
			var movePage = $(this).val();
			console.log("이동할 페이지 : " + movePage);
			$(this).replyListShow(movePage);
		});
		 
		
		
		
		// 게시글 목록 조회 & 페이징처리 메소드
		$.fn.boardListShow = function(currNum) {
			var curr;
			if (currNum == null || currNum == "") curr = 1;
			else curr = currNum;
			console.log("이동할 페이지 :: " + curr);
			$.ajax({
				url: "<%=request.getContextPath()%>/myPageList.me",
				type: "get",
				data: {currentPage: curr},
				dataType : "json",
				success: function(bMap) {
					var bList = bMap["bList"];
					var pInf = bMap["pInf"];
					
					console.log(bList);
					
					var $tableBody = $("#listArea1 tbody");
					$tableBody.html("");
					var result = "";
					
					var $pagingArea = $(".pagingArea");
					var pResult = "";
					$pagingArea.html("");
					
					if(bList.length > 0) {
						$.each(bList, function(i) {

							result += "<tr>"
								+ "<td><input type='checkbox' value='" + bList[i].bNo + "' name='isDelete'></td>" 
								+ "<td><input type='hidden' value='" + String(bList[i].bType).split(",")[0] + "' name='bType'>" 
								+  String(bList[i].bType).split(",")[1] + "</td>" 
								+ "<td>" + bList[i].header + "</td>"
								+ "<td>" + bList[i].bTitle + "</td>"
								+ "<td>" + bList[i].bCount + "</td>" 
								+ "<td>" + bList[i].createDate + "</td>"
								+ "</tr>";
								
							console.log(result);
						});
						
						// 페이징 바 
						// 페이징 처리 시작!
						
						//<!-- 맨 처음으로(<<) -->
						pResult += "<span class='pagingBtn clickBtn' name='1'>&lt;&lt;</span>";
						
						if(pInf.startPage <= 1) { 
							pResult += "<span class='pagingBtn' name='-1'>&lt;</span>";
							
						} else {
							pResult = "<span class='pagingBtn clickBtn' name='" + pInf.startPage - pInf.pagingBarSize + "'>&lt;</span>";
						}
							
						for(var p = pInf.startPage; p <= pInf.endPage; p++) {
							if(p == pInf.currentPage) { 
									pResult += "<span class='pagingBtn selectBtn' name='-1'>" + p + " </span>";
							} else {
								pResult += "<span class='pagingBtn clickBtn' name='" + p + "'>" + p + "</span>";
							} 
						} 
							
						//<!-- 다음 페이지로(>) -->
						if(pInf.endPage >= pInf.maxPage) {
							pResult += "<span class='pagingBtn' name='-1'> &gt; </span>";
						} else {
							pResult += "<span class='pagingBtn clickBtn' name='" + pInf.startPage + pInf.pagingBarSize + "'>&gt;</span>";
						}
						
						//<!-- 맨 끝으로(>>) -->
						pResult += "<span class='pagingBtn clickBtn' name='" + pInf.maxPage + "'>&gt;&gt;</span>";
					
					} else {
						result += "<tr><td colspan='6'>작성된 게시글이 없습니다.</td></tr>";
						pResult += "";
					}
					
					// 테이블에 목록조회 결과, 페이징바 삽입
					$tableBody.append(result);
					$pagingArea.append(pResult);
					
					// 페이징 버튼 css
					$(".clickBtn").mouseenter(function(){
						$(this).css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).css({"background":"white"});
					});
					
					// 페이징 처리. 목록조회 메소드 호출
					$(".pagingBtn").click(function() {
						var movePage = $(this).attr('name');

						if(movePage == -1) return;
						
						$(this).boardListShow(movePage);
					});
					
					// 게시판 상세보기
					$("#listArea1 td").mouseenter(function(){
						$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).parent().css({"background":"white"});
					}).click(function(){
						var bno = $(this).parent().children().eq(0).children().eq(0).val();
						var bType = $(this).parent().children().eq(1).children().eq(0).val();
						console.log(bno);
						location.href='<%= request.getContextPath() %>/detailBoard.ad?bno=' + bno + '&bType=' + bType; 
						<%-- location.href="<%= request.getContextPath() %>/detail.bo?bid="+bid; --%>
					});
					
				},
				error: function(err) {
					console.log(err);
				}
				
			});
			
		}
		
		
		// 댓글 목록 조회 & 페이징처리 메소드
		$.fn.replyListShow = function(currNum) {
			$.ajax({
				url: "<%=request.getContextPath()%>/replyList.me",
				type: "get",
				data: {currentPage: currNum },
				dataType : "json",
				success: function(rMap) {
					var rInfo = rMap["rInfo"];
					var pInf = rMap["pInf"];
					
					var $tableBody = $("#listArea2 tbody");
					$tableBody.html("");
					var result = "";
					
					var $pagingArea = $(".pagingArea");
					var pResult = "";
					$pagingArea.html("");
					
					if(rInfo.length > 0) {
						$.each(rInfo, function(i) {
							reply = rInfo[i][0];
							board = rInfo[i][1];
							console.log(reply);
							console.log(board);
							result += "<tr>"
								+ "<td>"
								+ "<input type='checkbox' name='isDelete' value='" + reply.bNo + "'>" 
								+ "<input type='hidden' value='" + String(board.bType).split(",")[0] + "' name='bType'>" 
								+ "<input type='hidden' value='" + reply.rNo + "' name='rNo'> </td>" 
								+ "<td>" + String(board.bType).split(",")[1] + "</td>" 
								+ "<td>" + board.bTitle + "</td>";
							var content = String(reply.rContent);
							
							content = content.replace(/(<([^>]+)>)/ig,"");
							
							if(content.length > 15) {
								result += "<td colspan='2'>" +content.substring(0, 14) + "... </td>";
							} else { 
								result += "<td colspan='2'>" + content + "</td>";
							}
							result += "<td>" + reply.rCreateDate + "</td>"
								+ "</tr>";
						});
						
						
						// 페이징 바 
						// 페이징 처리 시작!
						
						//<!-- 맨 처음으로(<<) -->
						pResult += "<span class='pagingBtn clickBtn' name='1'>&lt;&lt;</span>";
						
						if(pInf.startPage <= 1) { 
							pResult += "<span class='pagingBtn' name='-1'>&lt;</span>";
							
						} else {
							pResult = "<span class='pagingBtn clickBtn' name='" + pInf.startPage - pInf.pagingBarSize + "'>&lt;</span>";
						}
							
						for(var p = pInf.startPage; p <= pInf.endPage; p++) {
							if(p == pInf.currentPage) { 
									pResult += "<span class='pagingBtn selectBtn' name='-1'>" + p + " </span>";
							} else {
								pResult += "<span class='pagingBtn clickBtn' name='" + p + "'>" + p + "</span>";
							} 
						} 
							
						//<!-- 다음 페이지로(>) -->
						if(pInf.endPage >= pInf.maxPage) {
							pResult += "<span class='pagingBtn' name='-1'> &gt; </span>";
						} else {
							pResult += "<span class='pagingBtn clickBtn' name='" + pInf.startPage + pInf.pagingBarSize + "'>&gt;</span>";
						}
						
						//<!-- 맨 끝으로(>>) -->
						pResult += "<span class='pagingBtn clickBtn' name='" + pInf.maxPage + "'>&gt;&gt;</span>";
					
					} else {
						result += "<tr><td colspan='5'>작성된 게시글이 없습니다.</td></tr>";
						pResult += "";
					}
					
					// 테이블에 목록조회 결과, 페이징바 삽입
					$tableBody.append(result);
					$pagingArea.append(pResult);
					
					// 페이징 버튼 css
					$(".replyListArea .clickBtn").mouseenter(function(){
						$(this).css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).css({"background":"white"});
					});
					
					// 페이징 처리. 목록조회 메소드 호출
					$(".replyListArea .pagingBtn").click(function() {
						var movePage = $(this).attr('name');
						console.log("이동할 페이지 : " + movePage);
						if(movePage == -1) return;
						
						$(this).replyListShow(movePage);
					});
					
					// 게시판 상세보기
					$("#listArea2 td").mouseenter(function(){
						$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).parent().css({"background":"white"});
					}).click(function(){
						var bno = $(this).parent().children().eq(0).children().eq(0).val();
						var bType = $(this).parent().children().eq(0).children().eq(1).val();
						console.log(bno);
						location.href = '<%= request.getContextPath() %>/detailBoard.me?bno=' + bno + '&bType=' + bType, '_blank'); 
						<%-- location.href="<%= request.getContextPath() %>/detail.bo?bid="+bid; --%>
					});
					
				},
				error: function(err) {
					console.log(err);
				}
				
			});		
		
		}
		
		$(document).boardListShow(1);
		
		$(".myBoard").addClass("active");
		
	});	
							
    </script>

</body>
</html>