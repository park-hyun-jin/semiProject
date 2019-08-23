<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="user.model.vo.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 관리</title>

<%
	request.setAttribute("user", request.getAttribute("user"));
	request.setAttribute("artist", request.getAttribute("artist"));

%>

</head>

<style>
   .page_content {
        width: 700px;
        height: 900px;
        padding: 40px;
        padding-top: 8rem;
        position: absloute;
        margin-left: 350px;
    }


    .main {
        min-width: 320px;
        max-width: 1200px;
        /* padding: 50px; */
        margin: 0 auto;
        background: #ffffff;
    }

    section {
        height: 600px;
        display: none;
        padding: 20px 0 0;
        border: 1px solid #ddd;
        width: 1200px;
    }


    /*라디오버튼 숨김*/
      input {
          display: none;
     }

    label {
        display: inline-block;
        margin: 0 0 -1px;
        padding: 10px 49px;
        font-weight: 600;
        text-align: center;
        color: #bbb;
        border: 1px solid transparent;
    }

    label:hover {
        color: rgb(57, 109, 219);
        cursor: pointer;}
    
    /* label[for="tab6"]{
        padding: 10px 70px; 
    } */

    /*input 클릭시, label 스타일*/
    input:checked + label {
          color: #555;
          border: 1px solid #ddd;
          border-top: 2px solid rgb(57, 109, 219);
          border-bottom: 1px solid #ffffff;
          }

    #tab1:checked ~ #content1,
    #tab2:checked ~ #content2,
    #tab3:checked ~ #content3,
    #tab4:checked ~ #content4,
    #tab5:checked ~ #content5,
    #tab6:checked ~ #content6 {
        display: block;
    }

    .section_wrap{
        width: 600px;
        margin: 0 auto;
        position: relative;
        
    }

	/* 유저정보 테이블 */
    .table_wrap{
        width: 500px;
        
        margin-top: 100px;
        float: left;
    }
    .profile_Img{
        width: 80px;
        margin-top: 100px;
        float: left;
        /* border: 1px solid black; */

    }
    .profile_Img>img{
        width: 50px;
        height: 50px;
    }

   .table_wrap th{
        width: 200px;
        height: 30px;
        text-align: center;
        background-color: rgba(211, 211, 211, 0.836);
        
    }
    
    .table_wrap td{
        width: 300px;
        height: 30px;
        text-align: center;
    }
    
    .user_profile>p {
        font-size: 20px;
        padding-left: 100px;
    }
    
    
    /* 작성게시글 테이블 */
    	   
 	.boardListArea {
 		width: 1010px;
		margin-left: 100px;
	}

	.boardListTable, .boardListTable td, .boardListTable th {
	    border: 1px solid black;  
	    border-collapse: collapse;
	
	}
	.boardListTable td {
	    width: 200px;
	    height: 40px;
	    padding: 10px;
	    font-size: 17px;
	    
	}
	
	.boardListTable th {
		background-color: lightgray;
		height: 50px;
		font-weight: bold;
		font-size: 18px;
		text-align: center;
	}
   
	.pagingArea {
		margin: 30px;
	}	
	
	.pagingBtn{
		text-decoration: none;
		color : black;
		display : inline-block;
		width : 25px;
		height : 25px;
		font-size: 15px;
	}
	
	
	
	/* 작성 댓글 테이블 */
 	.replyListArea {
 		width: 1010px;
		margin-left: 100px;
	}

	.replyListTable {
		width: 820px;
 		margin-left: 100px;
	}

	.replyListTable, .replyListTable td, .replyListTable th {
	    border: 1px solid black;  
	    border-collapse: collapse;
	
	}
	.replyListTable td {
	    width: 200px;
	    height: 40px;
	    padding: 10px;
	    font-size: 17px;
	    
	}
	
	.replyListTable th {
		background-color: lightgray;
		height: 50px;
		font-weight: bold;
		font-size: 18px;
		text-align: center;
	}

</style>

<body>

	<%@ include file="../adminNav.jsp" %>

	<!-- 본문 -->
	<div id="page_content">
	    <div class="user_profile">
	        <p> [ 아이디 / 포인트 / 캐시 ]</p>
	        <!-- <span class="user_Id">[ 아이디</span>
		<span class= "user_Point"> / 포인트 /</span>
		<span class= "user_Cash">캐시 ]</span> -->
		</div>
		<div class="main">
		    <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
	            <label for="tab1">유저정보</label>
	        
	            <input id="tab2" type="radio" name="tabs">
	            <label for="tab2">업로드 악보</label>
	        
	            <input id="tab3" type="radio" name="tabs">
	            <label for="tab3">디운로드악보</label>
	        
	            <input id="tab4" type="radio" name="tabs" value="1">
	            <label for="tab4">작성한 게시글</label>
	        
	            <input id="tab5" type="radio" name="tabs" value="1">
	            <label for="tab5">작성한 댓글</label>
	        
	            <input id="tab6" type="radio" name="tabs">
	            <label for="tab6">보유 포인트 / 캐시</label> 
	        
	            <section id="content1">
	            	<jsp:include page="userInfo.jsp" /> 
	            </section>
	            <section id="content4">
            		<div class="boardListArea">
		            	<table class="boardListTable" border="1" style="text-align:center">
							<thead>
								<th class="boardTypeArea">게시판 이름</td>
					            <th class="titleArea">게시글 제목</td>
					            <th class="contentArea">내용</td>
					            <th class="writerArea">작성자</td>
					            <th class="createDateArea">게시일</td>
							</thead>
							<tbody>
							
							</tbody>
						</table>
						<div class="pagingArea" align="center">
						</div>
					</div>	
		        </section>
	            <section id="content5">
            		<div class="replyListArea">
		            	<table class="replyListTable" border="1" style="text-align:center">
							<thead>
								<th class="replyTypeArea">게시판 이름</td>
					            <th class="titleArea">게시글 제목</td>
					            <th class="contentArea">댓글 내용</td>
					            <th class="createDateArea">게시일</td>
							</thead>
							<tbody>
							
							</tbody>
						</table>
						<div class="pagingArea" align="center">
						</div>
					</div>	
		        </section>
	        </div>
	    </div>
	
	</div>
	
	<script>
	
	$(function() {
		$("#nav_user_management a").css("color", "rgb(235, 199, 91)");
		
		
		// 작성게시글 탭 선택시 목록조회 메소드 호출
		$("#tab4").click(function() {
			var movePage = $(this).val();
			console.log("이동할 페이지 : " + movePage);
			$(this).boardListShow(movePage);
		});
		
		
		
		// 작성댓글 탭 선택시 목록조회 메소드 호출
		$("#tab5").click(function() {
			var movePage = $(this).val();
			console.log("이동할 페이지 : " + movePage);
			$(this).replyListShow(movePage);
		});
		
		
		
		
		// 게시글 목록 조회 & 페이징처리 메소드
		$.fn.boardListShow = function(currNum) {
			$.ajax({
				url: "<%=request.getContextPath()%>/boardList.ad",
				type: "get",
				data: {uno: "<%=((User)request.getAttribute("user")).getuNo() %>", currentPage: currNum },
				dataType : "json",
				success: function(bMap) {
					var bList = bMap["bList"];
					var pInf = bMap["pInf"];
					
					
					var $tableBody = $(".boardListTable tbody");
					$tableBody.html("");
					var result = "";
					
					var $pagingArea = $(".boardListArea .pagingArea");
					var pResult = "";
					$pagingArea.html("");
					
					if(bList.length > 0) {
						$.each(bList, function(i) {

							result += "<tr>"
								+ "<td>"
								+ "<input type='hidden' value='" + bList[i].bNo + "' name='bNo'>" 
								+ "<input type='hidden' value='" + String(bList[i].bType).split(",")[0] + "' name='bType'>" 
								+  String(bList[i].bType).split(",")[1] + "</td>" 
								+ "<td>" + bList[i].bTitle + "</td>";
							var content = bList[i].bContent;
							
							content = content.replace(/(<([^>]+)>)/ig,"");
							
							if(content.length > 15) {
								result += "<td>" +content.substring(0, 14) + "... </td>";
							} else { 
								result += "<td>" + content + "</td>";
							}
							result += "<td>" + String(bList[i].writer).split(",")[1] + "</td>" 
								+ "<td>" + bList[i].createDate + "</td>"
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
					$(".clickBtn").mouseenter(function(){
						$(this).css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).css({"background":"white"});
					});
					
					// 페이징 처리. 목록조회 메소드 호출
					$(".boardListArea .pagingBtn").click(function() {
						var movePage = $(this).attr('name');
						console.log("이동할 페이지 : " + movePage);
						if(movePage == -1) return;
						
						$(this).boardListShow(movePage);
					});
					
					// 게시판 상세보기
					$(".boardListTable td").mouseenter(function(){
						$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).parent().css({"background":"white"});
					}).click(function(){
						var bno = $(this).parent().children().eq(0).children().eq(0).val();
						var bType = $(this).parent().children().eq(0).children().eq(1).val();
						console.log(bno);
						window.open('<%= request.getContextPath() %>/detailBoard.ad?bno=' + bno + '&bType=' + bType, '_blank'); 
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
				url: "<%=request.getContextPath()%>/replyList.ad",
				type: "get",
				data: {uno: "<%=((User)request.getAttribute("user")).getuNo() %>", currentPage: currNum },
				dataType : "json",
				success: function(rMap) {
					var rInfo = rMap["rInfo"];
					var pInf = rMap["pInf"];
					
					var $tableBody = $(".replyListTable tbody");
					$tableBody.html("");
					var result = "";
					
					var $pagingArea = $(".replyListArea .pagingArea");
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
								+ "<input type='hidden' value='" + reply.bNo + "' name='bNo'>" 
								+ "<input type='hidden' value='" + String(board.bType).split(",")[0] + "' name='bType'>" 
								+ "<input type='hidden' value='" + reply.rNo + "' name='rNo'>" 
								+  String(board.bType).split(",")[1] + "</td>" 
								+ "<td>" + board.bTitle + "</td>";
							var content = String(reply.rContent);
							
							content = content.replace(/(<([^>]+)>)/ig,"");
							
							if(content.length > 15) {
								result += "<td>" +content.substring(0, 14) + "... </td>";
							} else { 
								result += "<td>" + content + "</td>";
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
					$(".replyListTable td").mouseenter(function(){
						$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).parent().css({"background":"white"});
					}).click(function(){
						var bno = $(this).parent().children().eq(0).children().eq(0).val();
						var bType = $(this).parent().children().eq(0).children().eq(1).val();
						console.log(bno);
						window.open('<%= request.getContextPath() %>/detailBoard.ad?bno=' + bno + '&bType=' + bType, '_blank'); 
						<%-- location.href="<%= request.getContextPath() %>/detail.bo?bid="+bid; --%>
					});
					
				},
				error: function(err) {
					console.log(err);
				}
				
			});
			
		}
		
		
		
		
	
	
	});
	
	
	
	</script>
</body>
</html>