<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="board.model.vo.PageInfo"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<style>

 .form-control{
 
                width: 5rem;
            }

            .nav-hover{
                border-bottom: 4px solid #1a1a1a;
                border-top: 4px solid #1a1a1a;
                width: 96.88px;
                height: 58.88px;
            }

            .nav-hover:hover{
                border-bottom: 4px solid yellow;
            }

            .nav-link:hover, .nav-link:focus {
                text-decoration: none;
            }

            .detailList{
                display: none;
                border-bottom: 1px solid #adb5bd;
                
                box-sizing: border-box;
            }

            .detailList>li{
                display: inline;
                font-size: 1.2rem;
                padding: 0.715rem 1.2rem;
                margin: 0 1.4rem 0 0;
            }

            .detailList>li>a{
                text-decoration: none;
            }
            .detailList>li:hover a{
                border-bottom: 3px solid yellow;
            }

            .nav-margin{
                margin-right: 10rem !important;
            }

            .nav-margin:hover > .detailList{
                position: absolute;
                display: block;
                width: 760px;
                height: 40px;
                margin-top: 10px;
                padding: 0;
            } 

            .nav-margin:hover > .detailList2{
                width: 500px;
            }

            .detailList2>li>a{
                text-decoration: none;
            }
            .detailList2>li{
                padding-left: 0.5rem;
                margin-right: 3rem;
            }

            section{
                position: absolute;
                top: 8rem;
                left: 14rem;
            }
            aside{
                display: inline-block;
            }

             .vertical-menu {
                width: 220px;
                position: absolute;
                top: 15rem;
            }

        
            .vertical-menu a  {
            background-color: #eee;
            color: black;
            display: block;
            padding: 12px;
            text-decoration: none;
            font-size: 16px;
            }

            .vertical-menu a:hover {
            background-color: rgb(241, 196, 15);
            }

            .vertical-menu a.active3   {
            background-color: rgb(241, 196, 15);
            color: black;
            }
            
            


            .content{
                position: absolute;
                top: 15rem;
                left: 18rem;
                width: 1110px;
                height: 600px;
                border: 1px solid black;
            }

            .user-info{
                width: 1400px;
                height: 150px;
                border: 1px solid black;
            }
            
            .table-align {
                text-align: center;

            }
            
            .boardName{
                width: 340px;
            }        

            .title{
                width: 300px;
            }
            
            .table1 , .table2{
                width: 1100px;
                height: 550px;
            }

            #listArea{
                width: 100%;
                height: 100%;

            }
           .downNoteRow{
               width: 100%;
               height: 270px;
               /* padding: 20px 35px 5px 35px; */
           } 

          .eachNote{
              width: 25%;
              height: 270px;
              padding: 10px;
              
          } 

          .noteBox{
              position: relative;
              margin: 0 auto;
              width: 180px;
              height: 170px;
              margin-bottom: 25px;
              border: 1px solid black;
          }

          .noteBoxName{
            position: relative;
              margin: 0 auto;
             
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
                <a href="#tab-1" class="tab-link tab1">다운로드 악보</a>
                <div class="tab-content table1">
                    <table align="center" id ="listArea" class="table-align">
                          
                        <tr class="downNoteRow">
                            <td class="eachNote">
                                <div class="noteBox"></div>
                                <span><a href="#" class="noteBoxName">글제목</a></span> 

                            </td>
                            <td class="eachNote">
                                <div class="noteBox"></div>
                                <span><a href="#" class="noteBoxName">글제목</a></span> 
                            </td>
                            <td class="eachNote">
                                <div class="noteBox"></div>
                                <span><a href="#" class="noteBoxName">글제목</a></span> 
                            </td>
                            <td class="eachNote">
                                <div class="noteBox"></div>
                                <span><a href="#" class="noteBoxName">글제목</a></span> 
                            </td>
                            


                        </tr>
                         

                        <tr class="downNoteRow">

                            <td class="eachNote">
                                <div class="noteBox"></div>
                                <span><a href="#" class="noteBoxName">글제목</a></span> 
        
                            </td>

                            <td class="eachNote">
                                <div class="noteBox"></div>
                                <span><a href="#" class="noteBoxName">글제목</a></span> 
                            </td>

                            <td class="eachNote">
                                <div class="noteBox"></div>
                                <span><a href="#" class="noteBoxName">글제목</a></span> 
                            </td>

                            <td class="eachNote">
                                <div class="noteBox"></div>
                                <span><a href="#" class="noteBoxName">글제목</a></span> 
                            </td>


                        </tr>
                
                    </table>
                </div>
                
                <span id="tab-2" class="tab-btn"></span>
                <a href="#tab-2" class="tab-link tab2">찜한 악보</a>
                <div class="tab-content table2">
                    <table align="center" id ="listArea" class="table-align">
                           
                        <tr class="downNoteRow">
                                    <td class="eachNote">
                                        <div class="noteBox"></div>
                                        <span><ahref ="#" class="noteBoxName">글제목</a></span> 
        
                                    </td>
                                    <td class="eachNote">
                                        <div class="noteBox"></div>
                                        <span><a href="#" class="noteBoxName">글제목</a></span> 
                                    </td>
                                    <td class="eachNote">
                                        <div class="noteBox"></div>
                                        <span><a href="#" class="noteBoxName">글제목</a></span> 
                                    </td>
                                    <td class="eachNote">
                                        <div class="noteBox"></div>
                                        <span><a href="#" class="noteBoxName">글제목</a></span> 
                                    </td>
                                    
        
        
                                </tr>
                                 
        
                                <tr class="downNoteRow">
        
                                    <td class="eachNote">
                                        <div class="noteBox"></div>
                                        <span><a href="#" class="noteBoxName">글제목</a></span> 
                
                                    </td>
        
                                    <td class="eachNote">
                                        <div class="noteBox"></div>
                                        <span><a href="#" class="noteBoxName">글제목</a></span> 
                                    </td>
        
                                    <td class="eachNote">
                                        <div class="noteBox"></div>
                                        <span><a href="#" class="noteBoxName">글제목</a></span> 
                                    </td>
        
                                    <td class="eachNote">
                                        <div class="noteBox"></div>
                                        <span><a href="#" class="noteBoxName">글제목</a></span> 
                                    </td>
        
        
                                </tr>
                        
                            </table>
                        </div>

                    </table>
                </div>
		</div>

	</section>

	<script>
	/* 	$(document).ready(function(){
			
			$(".absence").addClass("active");
			
			
		});
		 */
		 
		 (function() {
		        // 처음 탭만 활성화 시켜놓음
		        if (!!location.hash) return;

		        var link = document.querySelector('.tab-section > .tab-link');
		        if (link) link.click();
		    });

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
	</script>



</body>
</html>