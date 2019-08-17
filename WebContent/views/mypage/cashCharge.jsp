<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.model.vo.User"%>
<%

	User user = (User)request.getAttribute("user");
	int cash = (int)request.getAttribute("cash");
	String userName = user.getUserName();
	String email = user.getEmail();
	int uNo = user.getuNo();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시충전</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
</head>
<body>

	<script>
            IMP.init('imp14544729');
            
            IMP.request_pay({
                pg : 'inicis', // version 1.1.0부터 지원.
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '악보캐시충전',
                amount : <%=cash%>, //판매 가격
                buyer_email : '<%=email%>',
                buyer_name : '<%=userName%>',
                buyer_tel : '010-5104-9928',
                buyer_addr : '허리도 가늘군 만지면 부러지리',
                buyer_postcode : '231-102'
                
            }, function(rsp) {
                if ( rsp.success ) {
                	$.ajax({
                		url: "cashCharge.me",
                		type: "POST",
                		dataType: "json",
                		data: {
                			imp_uid : rsp.imp_uid,
                			merchant_uid : rsp.merchant_uid,
                			receipt_url : rsp.receipt_url,
                			amount : '<%=cash%>',
                			uNo : '<%=uNo%>'
                		}
                	}).done(function(data){
                		if(everythings_fine){
                			var msg = '결제가 완료되었습니다.' + '\n';
                            msg += '결제 금액 : ' + rsp.paid_amount+ '원\n';
                            
                		}else{
                			
                		}
                	});
                	alert(msg);
                    
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
            
	</script>

</body>
</html>