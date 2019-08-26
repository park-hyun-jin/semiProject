<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> </title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        

	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

        
    </head>

    <style>
	body {
        padding: 20px;
        margin: 0;
    }
    #admin_nav_wrap * {
        /* padding: 0;
        margin: 0; */
        /* border: 1px solid red; */
        box-sizing: border-box;
    }
    
    #admin_nav_wrap{
        /* border: 1px solid red; */
        width: 100%;
        height: 1000px;
    }
    
    #admin_nav_wrap .main_nav_aside {
        width: 20%;
        height: 100%;
        background-color:  rgb(57, 109, 219);
        padding: 10px 30px 10px 30px;
        /* display: flex; */
        float: left;
        flex-direction: column;
        
    }

    /* 내비 사이 구분선 */
    .nav_divide_line {
        display: inline-block;
        width: 100%;
    }
    .nav_divide_line hr{
        color: white;
        border-width: 1px;
    }

    /* 로고영역 */
    #nav_aside_logo_area {
        width: 100%;
        height: 100px;
        padding-top:30px;
        
    }

    #main_logo_siteName {
        display: block;
        font-size: 30px;
        font-weight: bold;
        color: white;
        margin: 0 auto;
        text-align: center;
    }
    
    #nav_aside_list{
		padding: 0;
		margin: 0;
	}
    

    #nav_aside_list li {
        width: 100%;
        height: 80px;
        list-style: none;
        padding-top: 30px;
    }
    
    .main_nav_aside li:hover a {
		cursor: pointer;
		color: lightgray;
	}

    #nav_aside_list li>a {
        display: block;
        text-decoration: none;
        color: white;
        font-weight: bold;
        font-size: 18px;
        
    }
    
    /* 내비 헤더. 검색창, 알림 등 버튼. */
    .main_nav_header {
        width: 80%;
        height: 130px;
        float:left;
        border-bottom: 3px solid gray;
        /* padding-left: 300px; */
    }
    
    .nav_header_search_area {
        width: 75%;
        height: 100%;
        float: left;
        
    }

    .nav_header_admin_area {
        width: 25%;
        height: 100%;
        float: left;
    }



    /* 본문. 컨텐트 영역 */
    #page_content {
        padding-top: 8rem;
        position: absloute;
        margin-left: 350px;
    }


    @media (max-width: 1600px) {
        body{
            width: 1600px;
            height: 1000px;
            padding: 20px;
        }
        
        #admin_nav_wrap{
            margin: 0 auto;
        }

        .main_nav_aside {
            width: 300px;
            height: 100%;
        }

        .main_nav_header {
            width: 1280px;
            height: 130px;
        
        }
        .nav_header_search_area {
           width: 950px;
           float: left;
       }

       .nav_header_admin_area {
           width: 328px;
           float: left;
       }

        #page_content {
            width: 1280px;
            height: 900px;
            padding: 40px;
        }
    } 
    
    @media (max-width: 1000px ) {
        body{
            width: 1000px;
            height: 1000px;
            padding: 20px;
        }
        
        #admin_nav_wrap{
            width: 100%;
            height: 100%;
        }

        .main_nav_aside {
            width: 260px;
            height: 100%;
        }

        #main_logo_siteName {
            display: block;
            font-size: 22px;
            font-weight: bold;
            color: white;
            margin: 0 auto;
            text-align: center;
        }

		#nav_aside_list{
			padding: 0;
			margin: 0;
		}

		

        #nav_aside_list li>a {
            display: block;
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 18px;
            
        }
        
       .main_nav_header {
            width: 700px;
            height: 130px;
       }
       .nav_header_search_area {
           width: 490px;
           float: left;
       }

       .nav_header_admin_area {
           width: 208px;
           float: left;
       }

      

    } 
    
    </style>
    <body>


        <div id="admin_nav_wrap">
            <!-- 로고, 내비 바 -->
            <div class="main_nav_aside">
                <!-- 로고. 메인으로 이동 -->
                <div id="nav_aside_logo_area">
                    <!-- <img src="#" id="main_logo"> -->
                    <span id="main_logo_siteName">Note & Rest</span>
                </div>
                <span class="nav_divide_line"><hr></span>
                <!-- 내비 -->
                <ul id="nav_aside_list">
                    <li id="nav_go_main">
                        <a href="<%=request.getContextPath()%>/updatedInfo.ad">메인 페이지</a>
                    </li>
                    
                    <span class="nav_divide_line"><hr></span>
                    
                    <li id="nav_user_management">
                        <a href="<%= request.getContextPath() %>/userList.ad">유저 관리</a>
                    </li>
                    
                    <span class="nav_divide_line"><hr></span>
                    
                    <li id="nav_board_management">
                        <a href="#">게시판 관리</a>
                    </li>
                    
                    <span class="nav_divide_line"><hr></span>
                    
                    <li id="nav_profit_state">
                        <a href="#">수익 관리</a>
                    </li>
                    
                    <span class="nav_divide_line"><hr></span>
                    
                    <li id="nav_atrist_management">
                        <a href="#">아티스트</a>
                    </li>
                    
                    <span class="nav_divide_line"><hr></span>
                    
                    <li id="nav_report_state">
                        <a href="#">신고 관리</a>
                    </li>

                    <span class="nav_divide_line"><hr></span>
                </ul>

            </div>

            <!-- 검색창, 알림 등.. -->
            <div class="main_nav_header">
                <div class="nav_header_search_area">

                </div>
                <div class="nav_header_admin_area">
                    
                </div>
                
            </div>

    </body>
</html>