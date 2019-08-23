<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.Board"%>
<%@page import="board.model.vo.Note"%>
<%

Board b = (Board)request.getAttribute("board");
Note n = (Note)request.getAttribute("note");
String filename = (String)request.getAttribute("pdfFilename");
int writer = Integer.parseInt(b.getwriter());
String divide = n.getDivide();
int price = n.getnPrice();
User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/sheetShareDetail.css">
 <style>
 	.imgPdf{
 		width:100%;
 		height:100%;
 	}
 	.List_Back_Btn2{
    border-radius: 5px 5px 5px 5px;
    background-color:  rgb(1,11,20);
    width: 100px;
    height: 40px;
    margin: 0 auto;
    position: relative;
    float: right;
    color: white;
    
} 
 
 </style>
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
                             <span><%=b.getbTitle() %></span>
                        </div>
                        <div class="Detail_Header_Icon"><img src="<%=request.getContextPath() %>/views/image/download.png" onclick="downloadPdf();"></div>
                        <div class="Detail_Header_Icon"><img src="<%=request.getContextPath() %>/views/image/like.png" class = "changeImg" onclick="changeImg();"></div>
                        <div class="Detail_Header_Icon"><img src="<%=request.getContextPath() %>/views/image/danger.png" class="danger"></div>
                    </div>
                    <!-- 작성일 작성자 -->
                    <div class ="Detail_Header_WD">
                    	<div class="Detail_Header_Date">작성일 : <%=b.getCreateDate() %></div>
                        <div class="Detail_Header_Writer">작성자 : <%=loginUser.getNickName() %></div>
                    </div>
                   
    
                </div>
    
                <!-- detail안에 내용 들어오는 부분 -->
                <div class= "Detail_Content">
                    <div class = "Detail_Content_Comment">
                        <div class ="Comment_composer" > 작곡가 : <br><%=n.getnComposer() %></div>
                        <div class ="Comment_title" > 제목 : <br><%=n.getnTitle() %></div>
                        <div class ="Comment_genre" > 장르 : <br><%=n.getnGenre() %></div>
                        <div class ="Comment_instrument" > 악기 : <br><%=n.getnInstrument() %></div>
                        <% if(divide.equals("P")){ %>
                        <div class ="Nprice"> 가격 : <br><%=price %>P</div>
                        <%} else{ %>
                        <div class ="Nprice"> 가격 : <br><%=price %>원</div>
                        <%} %>
                    </div>
                    <div class = "Detail_Content_SheetImg"><img src="<%=request.getContextPath() %>/sheetPdf/<%=n.getChangeName() %>.png" class="imgPdf"></div>
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
                            <table id = "reply_List_Content">
                                
                            </table>
                        </div>
                    </div>
                    <!-- 댓글 달기 -->
                    <div class="reply">
                        <div class="reply_Write">
                            <textarea name="reply" class= "reply_textarea" resize="none" id = "reply_textarea"></textarea>
                        </div>
                        <div class="reply_Btn">
                            <button type="submit" class="reply_Submit" id ="reply_Submit">댓글</button>
                        </div>
                    </div>
                </div>


                <!-- 목록 버튼 -->
                <div class= "Btn_Wrap">
                    <button class="List_Back_Btn" onclick="goList();">목록</button>  
                    <% if(writer == loginUser.getuNo()) { %>
						<button class="List_Back_Btn2" type="button" onclick="updateBoard();">수정</button>
						<button class="List_Back_Btn2" type="button" onclick="deleteBoard();">삭제</button>
					<%}%>
                </div>
            </div> 
    </section>

    <script>
    function downloadPdf(){
    	<% if(divide.equals("P")){ %>
    	<% if(price<=user.getUserPoint()){ %>
    		location.href="<%=request.getContextPath()%>/pdfDownload.bo?nNo=<%= n.getnNo()%>";
    	<%} else{%>
    		alert("포인트가 부족합니다!");
    	<%}%>
    	<%}else{%>
    	<% if(price<=user.getUserCash()){ %>
			location.href="<%=request.getContextPath()%>/pdfDownload.bo?nNo=<%= n.getnNo()%>";
    	<%} else{%>
    		alert("캐시가 부족합니다!");
    	<%}%>
   	<%}%>
    }
    
    function goList(){
    	location.href='<%= request.getContextPath() %>/sheetShare.bo';
    }
    function updateBoard(){
    	location.href='<%= request.getContextPath() %>/playgroupWriteForm.up?bNo=<%= b.getbNo() %>';
    }
    function deleteBoard(){
		if(confirm('정말 삭제하시겠습니까?')){
			location.href='<%= request.getContextPath() %>/playgroupWrite.del?bNo=<%= b.getbNo() %>';
		}
	}
    
        function changeImg(){
            var changeImg =document.getElementsByClassName("changeImg");
            changeImg[0].src="<%=request.getContextPath() %>/views/image/liked.png";
        }
        
     // 게시글 신고
    	$(".danger").click(function(){
    		var uNo = <%= loginUser.getuNo()%>
			var bNo = <%=b.getbNo()%>
    		var rpContent = prompt( '신고 사유를 작성해주세요');
    		
    		if(rpContent == null){
    			alert("게시글 신고 작성이 취소되었습니다.")
    			return false;
    		}
    		
    		$.ajax({
				url : "dangerWrite.in",
				type : "POST",
				data : {uNo : uNo, rpContent : rpContent , bNo:bNo},
				success : function(result){
					if(result>0){
						alert("신고 등록 완료");
					}else{
						console.log("신고 등록 에러 발생");
					}
				}
				
			});
    	      
    	});
     
    	 // 댓글 등록
        $("#reply_Submit").click(function(){
			var uNo = <%= loginUser.getuNo()%>
			var bNo = <%=b.getbNo()%>
			var content = $("#reply_textarea").val();
			
			if(content.trim() == ""){
				alert("빈 댓글은 입력 할 수 없습니다.");
				return false;
			}
			
			$.ajax({
				url : "playgroupReply.in",
				type : "POST",
				data : {uNo : uNo, content : content , bNo:bNo},
				success : function(result){
					if(result>0){
						$("#reply_textarea").val("");
						selectRlist();
					}else{
						console.log("댓글 등록 에러 발생");
					}
				}
				
			});
		});
     
    	// 댓글 출력 
    	function selectRlist(){
			var bNo = <%= b.getbNo()%>
			$.ajax({
				url: "playgroupReply.li",
				type:"POST",
				dataType:"json",
				data : {bNo : bNo},
				success : function(rList){
					var $reply_List_Content=$("#reply_List_Content");
					$reply_List_Content.html(""); // 기존 테이블 내용 초기화
					
					$.each(rList,function(i){
						var $tr = $("<tr>");
						var $writerTd=$("<td id ='rContentTd'>").html(rList[i].rContent).css("width","500px");
						var $contentTd =$("<td>").text(rList[i].nickName).css("width","150px");
						var $dateTd = $("<td>").text(rList[i].rCreateDate).css("width","150px");
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						 if(rList[i].nickName == "<%=loginUser.getNickName()%>") {
							var $update = $("<td>").html('<button type = "button" class ="replyUpdate">[수정]</button>').css("width","50px");
							var $delete = $("<td>").html('<button type = "button" class ="replyDelete">[삭제]</button>').css("width","50px");
							$tr.append($update);
    						$tr.append($delete);
						}
						
						$reply_List_Content.append($tr);
					});
				}
			});
		}
    	// 화면 로드 시 댓글 출력 부분 호출
		selectRlist();
		
		//일정 시간마다 댓글 출력부 갱신
		setInterval(function(){
			selectRlist();
		},3000);
        
        
        
    </script>

</body>
</html>