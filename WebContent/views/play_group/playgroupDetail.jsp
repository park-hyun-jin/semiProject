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
        <style>
        .replyUpdate, .replyDelete{
        	  border-radius: 5px 5px 5px 5px;
        	   background-color :white;
        }
        </style>
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
                    <% if(nickName.equals(loginUser.getNickName())) { %>
						<button class="List_Back_Btn2" type="button" onclick="updateBoard();">수정</button>
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
        function goList(){
        	location.href='<%= request.getContextPath() %>/playgroupWrite.li';
        }
        function updateBoard(){
        	location.href='<%= request.getContextPath() %>/playgroupWriteForm.up?bNo=<%= b.getbNo() %>';
        }
        function deleteBoard(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href='<%= request.getContextPath() %>/playgroupWrite.del?bNo=<%= b.getbNo() %>';
			}
		}
        
        
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
    						var $writerTd=$("<td>").html(rList[i].rContent).css("width","500px");
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

</html>