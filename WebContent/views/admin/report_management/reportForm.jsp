<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.model.vo.Report"%>
<%
	ArrayList<Report> reportList = (ArrayList<Report>)request.getAttribute("reportList");
	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

/* div{
 border: 1px solid black;
} */
	.slideMenu{
		padding-top: 8rem;
	    width: 1400px;
	    height: 850px;
	    margin-left: 400px;
		position: relative;
		
		/* border: 1px solid black; */
	}
	.title{
		border-style: none;
		height: 750px;
	}
	.trhead{
		height: 50px;
		
	}
	.contentWrap{
		/* border:1px solid  rgb(57, 109, 219); */
		width:100%;
		height:600px;
		display: none;
		margin: 0;
		background-color: white;
		
	}
	tbody>tr{
		background-color: rgb(57, 109, 219); 
	}
	.deleteBtn{
	
    border-radius: 5px 5px 5px 5px;
    background-color: rgba(0,0,0,0);
    width: 100px;
    height: 40px;
    }
    .reportContent{
    	color:black;
    }
</style>


<body>

	<%@ include file="../ADMINNAV.JSP" %>
	
		<div class = "slideMenu">
		<table class = "title" width="100%">
			<%for(Report r : reportList){ %>
				<tr class = "trhead" heigth="100%">
					<th width="10%"><%=r.getbNo() %></th>
					<th width="70%"><%=r.getRpContent().split(",")[0]%></th>
					<th width="20%"></th>
				</tr>
				<tr class="contentWrap">
					<td class="boardContent">
						<%=r.getRpContent().split(",")[1] %>
					</td>
					
					<td class= "reportContent">
						<%=r.getRpContent().split(",")[2] %>
					</td>
					<td class = "delete">
						<button class="deleteBtn">삭제</button>
					</td>
				</tr>
		<%} %>
		</table>
	</div>
	
	
	<script>
		$(function(){
			$('tr').click(function(){
				if($(this).next("tr").css("display") == "none"){
					$(this).siblings("tr.contentWrap").slideUp();
					$(this).next().slideDown();
				}else{
					$(this).next().slideUp();
				}
			});
		});
	</script>	

</body>
</html>