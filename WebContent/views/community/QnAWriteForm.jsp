<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
        margin: 0;
        padding: 0;
        /* border: 1px solid red; */
        box-sizing: border-box;
    }

    #iframeWrap {
        width: 1000px;
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
			<iframe id="writeForm" src="<%=request.getContextPath()%>/views/community/QnAWrite.jsp" width="1200px" height="900px" scrolling="no"></iframe>   
		</div>
</body>
</html>