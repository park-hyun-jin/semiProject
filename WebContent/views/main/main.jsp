<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainPage</title>
<style>
	.detailList>li a{
            color: white !important;
        }

	.main-img{
        width: 100%;
        height: 100%;
        position: relative;
    }
    .main-img>img{
        z-index: -5;
        width: 100%;
        height: 100%;
        animation:blink 2.7s ease-in-out infinite alternate;
    }        

    @keyframes blink{
        0% {opacity:0.9;}
        100% {opacity:1;}
    }
    .star-box{
        width: 100%;
        height: 400px;
        position: absolute;
        top: 20%;
        left: 0;
        right: 0;
        bottom: 50%;
        margin: 0;
    }
    .star-box>img{
        width: 30px;
        height: 30px;
    }

    @keyframes twinkle1{
        0% {opacity: 0;}
        100% {opacity: 0.8;}
    }

    @keyframes twinkle2{
        0% {opacity: 0.8;}
        100% {opacity: 0;}
    }

    @keyframes twinkle3{
        0% {opacity: 0.8;}
        100% {opacity: 0;}
    }

    @keyframes twinkle4{
        0% {opacity: 0;}
        100% {opacity: 0.8;}
    }

    .star-box>img:nth-child(1){
        margin-left: 100rem;
        animation: twinkle1 2.3s ease-in-out infinite alternate;
    }

    .star-box>img:nth-child(2){
        margin-left: 90rem;
        animation: twinkle2 1.5s ease-in-out infinite alternate;
    }

    .star-box>img:nth-last-child(2){
        margin-left: 20rem;
        margin-top: 20rem;
        animation: twinkle3 2.3s ease-in-out infinite alternate;
    }

    .star-box>img:nth-last-child(1){
        margin-left: 60rem;
        margin-top: 30rem;
        animation: twinkle4 3.6s ease-in-out infinite alternate;
    }

    
    .main-text{
        text-align: center;
        width: 100%;
        height: 400px;
        z-index: 1;
        position: absolute;
        top: 20%;
        left: 0;
        right: 0;
        bottom: 50%;
        margin: 0;
    }
    .main-text>span{
        color:white;
        font-size: 8rem;
    }
    
    .main-text>span:nth-child(1), .main-text>span:nth-child(3){
        font-family: 'Times New Roman', Times, serif;
        font-style: italic;
    }
    .main-text>span:nth-child(2){
        font-family: 'Mr De Haviland', cursive;
    }
    .main-text>span:nth-child(5){
        padding-top: 0;
        font-family: 'Basic', sans-serif;
        font-size: 1.5rem;
    }
      
   .main-text>button{
       margin-top: 20px;
       font-size: 0.9rem;
       font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
   }	

</style>
<link href="https://fonts.googleapis.com/css?family=Basic|Mr+De+Haviland&display=swap&subset=latin-ext" rel="stylesheet">
</head>
<body>
	<%@ include file="../common/nav.jsp" %>
	
	<div class="main-div">
            <div class="main-img"><img src="<%=request.getContextPath()%>/views/image/cosmos.jpg"></div>
            <div class="star-box">
                <img src="<%=request.getContextPath()%>/views/image/star.png">
                <img src="<%=request.getContextPath()%>/views/image/star.png"><br><br><br>
                <img src="<%=request.getContextPath()%>/views/image/star.png">
                <img src="<%=request.getContextPath()%>/views/image/star.png">
            </div>
            <div class="main-text"> 
                <span>NOTE&nbsp;</span>
                <span>&&nbsp;</span>
                <span>REST</span>
                <br>
                <span>일상을 채워줄 악보공간</span><br><br>
                <button onclick="location.href='<%=request.getContextPath()%>/views/community/noticeList.jsp'">GET STARTED</button>
            </div>
            
        </div>



</body>
</html>