<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>



 

        <style>
            *{
                margin: 0;
                padding: 0;
                /* border: 1px solid red; */
                box-sizing: border-box;
            }
            html{
            	height: 1100px;
            }

            #iframeWrap {
                width: 900px;
                /* height: 1100px;
                	margin-top: 150px; 
                	padding: 40px;
                	border: 1px solid red;*/
                
                margin: 0 auto;
                
               
            }
            
            #writeForm {
            	border-style: none;
            	margin-top: 20px;
            	margin: 0 auto;
            	position: relative;
            }
        </style>
        
        


</head>
<body>

	<%@ include file="../common/nav.jsp" %>


				<div id="iframeWrap">
					<iframe id="writeForm" src="sheetShareForm.jsp" width="1200px" height="1300px" scrolling="no"></iframe>   
				 </div>
				 

   


</body>
</html>