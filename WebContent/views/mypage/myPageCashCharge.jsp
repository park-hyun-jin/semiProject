<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시 충전</title>
<style>
	.cash{
        position: relative;
        font-size: 23px;
        width: 100%;
        height: 100%;
        border: 2px solid black;
    }

    .cash-form{
        position: relative;
        top: 20%;
        height: 80%;
    }

    .cash-div{
        float: left;
        width: 33.33%;
        height: 40%;
        margin: 0;
        text-align: center;
    }

    .charge-div{
        text-align: center;
    }

</style>
</head>
<body>
	<%@ include file="../common/nav.jsp"%>

	<section>
		<%@ include file="myPage.jsp"%>
		<div class="content">
            <div class="cash">
                <form action="cashChargeForm.me" method="POST" class="cash-form" onsubmit="return checkConfirm();"> 
                <div class="cash-div">
                    <input type="radio" name="cash-charge" value="2000" id="2500cash">&nbsp;&nbsp;<label for="2500cash">2500캐시</label>
                </div>
                <div class="cash-div">
                    <input type="radio" name="cash-charge" value="5000" id="5000cash">&nbsp;&nbsp;<label for="5000cash">5000캐시</label>
                </div>
                <div class="cash-div">
                    <input type="radio" name="cash-charge" value="10000" id="10000cash">&nbsp;&nbsp;<label for="10000cash">10000캐시</label>
                </div>
                <div class="charge-div">
                    <input type="submit" value="충전">
                </div>
                </form>    
            </div>
        </div>
		
	</section>

	<script>
	$(document).ready(function(){
		$(".absence").addClass("cashCharge");
	});
	
	function checkConfirm(){
		if($("input[type=radio]").is(":checked")){
			return true;
		}else{
			return false;
		}
	}
	</script>


</body>
</html>