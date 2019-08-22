<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
    
<%
	// 로그인했을 경우 유저정보
	User loginUser = (User)session.getAttribute("loginUser");
	
	String msg = (String)session.getAttribute("msg"); 
	
	// 카카오로그인 app key
	String kakaoKey = "188493ea165a4a41ea7f70b87d9da98c";
	
	// 네이버 로그인 클라이언트ID, callbackURL
	String naverClientID = "TyJHkEkL1q5EMX7mTaF3";
	String naverCallbackUrl = request.getContextPath() + "/views/common/naverLoginCallback.jsp";
	
	
	
	
	
	
	// 이용약관
	String tos = "<노래덕 개인정보 보호정책>\r\n" + 
		"\r\n" + 
		"제 1 조 (총칙)\r\n" + 
		"A. 검은콩나물레시피(이하 ‘회사’’)는 고객의 개인정보를 매우 중요시하며, 법령 및 방송통신위원회의 개인정보보호지침상 개인정보 보호규정을 준수하고 있습니다.\r\n" + 
		"B. 회사는 개인정보취급방침을 통하여 고객의 개인정보가 어떤 용도와 방식으로 이용되고 있으며 개인정보 보호를 위하여 어떤 조치가 취해지고 있는지 알려드립니다.\r\n" + 
		"C. 회사는 개인정보취급방침을 서비스 화면 또는 홈페이지에 공개함으로써 고객이 언제나 쉽게 보고 확인할 수 있도록 조치하고 있습니다.\r\n" + 
		"D. 회사는 개인정보취급방침을 관련 법령 및 방송통신위원회의 개인정보보호지침의 변경 또는 내부 운영규정의 변경에 따라 개정할 수 있으며, 개인정보취급방침을 개정하는 경우 버전번호 등을 부여하여 개정된 사항을 고객이 쉽게 알아볼 수 있도록 하고 있습니다.\r\n" + 
		"\r\n" + 
		"제 2 조 (수집하는 개인정보 항목 및 수집방법)\r\n" + 
		"A. 회사는 고객의 개인정보를 수집하는 경우 관련 법령에 따라 가입신청서 또는 이용약관 등을 통하여 그 수집범위 및 수집 이용 목적을 사전에 고지합니다.\r\n" + 
		"B. 회사가 수집하는 고객의 개인정보는 다음과 같습니다.\r\n" + 
		"1. 서비스 이용시 수집하는 개인정보\r\n" + 
		"성별, 전화번호, 생년월일, 페이스북 고유번호, 구글계정 고유번호, 이메일, 서비스 이용내역, 프로필 등 가입정보, 스마트폰, 통계데이터, 서비스 설정정보, 접속로그 등\r\n" + 
		"2. 유료서비스 이용 관련 수집하는 개인정보(복구 및 환불 등)\r\n" + 
		"이메일, 구매내역 확인내용(구매일, 주문번호, 주문 내역 등), 본인이 아닌 타인에 의한 결제사실 확인을 위한 실명 및 가족관계 증명\r\n" + 
		"C. 회사는 다음과 같은 방법으로 개인정보를 수집합니다.\r\n" + 
		"- 서비스 내 입력, 서면양식, 전화, 팩스를 통한 회원가입, 상담게시판, 경품 행사 응모, 배송 요청, 생성정보수집 툴 등\r\n" + 
		"D. 회사는 법령의 규정 또는 고객의 동의 없이는 사상, 신념, 과거의 병력 등 고객의 권리 또는 이익이나 사생활을 뚜렷하게 침해할 우려가 있는 개인정보를 수집하지 않습니다.\r\n" + 
		"\r\n" + 
		"제 3 조 (개인정보의 수집 및 이용목적)\r\n" + 
		"회사가 고객의 개인정보를 수집 및 이용하는 목적은 다음과 같습니다.\r\n" + 
		"A. 서비스 제공에 관한 계약 이행 및 유료 서비스 제공에 따른 요금정산\r\n" + 
		"콘텐츠 제공, 유료 서비스 이용에 대한 과금, 본인인증\r\n" + 
		"B. 이용자관리\r\n" + 
		"개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 중복가입확인, 가입의사 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달\r\n" + 
		"\r\n" + 
		"제 4 조 (개인정보의 이용 및 제공)\r\n" + 
		"A. 회사는 고객의 개인정보를 이용약관, 개인정보취급방침의 “개인정보 수집 및 이용 목적상 고지한 범위 내에서 이용 및 제공하며, 그 범위를 넘어서 이용하거나 제공하지 않습니다. 특히, 다음의 경우는 주의를 기울여 개인정보를 이용 및 제공할 것입니다.\r\n" + 
		"1. 서비스 내에서 본인의 프로필 정보 및 본인이 업로드한 악보파일은 다른 회원에게 공유됩니다.\r\n" + 
		"2. 매각•인수합병 등 회사의 서비스제공자로서의 권리와 의무가 완전 승계 또는 이전되는 경우 사전에 개인정보를 이전하려는 사실, 개인정보의 이전을 받는 자(이하 “영업양수자등”)의 성명(법인인 경우 법인의 명칭)•주소•전화번호 그 밖에 연락처, 고객이 개인정보의 이전을 원하지 아니하는 경우 그 동의를 철회할 수 있는 방법과 절차에 대해 상세하게 고지할 것이며 고객의 개인정보에 대한 동의 철회의 선택권을 부여합니다.\r\n" + 
		"B. 고객의 동의가 있거나, 고객의 동의가 없더라도 요금정산을 위하여 필요한 경우, 국세기본법, 지방세법, 통신비밀보호법, 금융실명거래 및 비밀보장에 관한 법률, 신용정보의 이용 및 보호에 관한 법률, 전기통신기본법, 전기통신사업법, 소비자기본법, 한국은행법, 형사소송법 등 관련 법령에 특별한 규정이 있는 경우에는, 제(1)항의 규정에도 불구하고 회사는 고객의 개인정보 수집 시에 고객에게 고지한 범위 또는 이용약관에 명시한 범위를 넘어서 이용하거나 제3자에게 제공할 수 있습니다. 다만, 관련 법령에 의한 경우에도 고객의 개인정보를 무조건 제공하는 것은 아니며 법령에 정해진 절차와 방법에 따라 제공합니다.\r\n" + 
		"C. 회사는 서비스의 제공에 관한 계약을 이행하기 위하여 필요한 개인정보로서 경제적•기술적인 사유로 통상적인 동의를 받는 것이 뚜렷하게 곤란한 경우에는 고객의 동의가 없더라도 개인정보를 수집•이용할 수 있습니다.\r\n" + 
		"\r\n" + 
		"제 5 조 (수집한 개인정보의 보유 및 이용기간)\r\n" + 
		"A. 회사는 이용자가 회사가 제공하는 서비스를 이용하는 동안 이용자의 개인정보를 보유합니다.\r\n" + 
		"B. 이용자의 개인정보는 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 이용자가 회원탈퇴를 하거나 개인정보 허위기재로 인해 회원 ID 삭제 처분을 받은 경우 수집된 개인정보는 삭제되며 어떠한 용도로도 이용할 수 없도록 처리됩니다. 다만, 이용 해지 후 도용 등의 피해가 발생할 우려가 있으므로 개인정보를 7일간 임시 보관하게 됩니다. 7일 후에는 회원 DB에서 완전히 삭제됩니다.\r\n" + 
		"C. 또한 명의도용 분쟁 발생시 본인확인을 위해 제출 받은 신분증 사본은 본인확인 후 즉각 폐기됩니다.\r\n" + 
		"D. 이용자의 개인정보는 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기되나, 다음 각호의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존하며, 그 외 다른 목적으로는 사용하지 않습니다.\r\n" + 
		"1. 불건전한 서비스 이용으로 서비스에 물의를 일으킨 이용자의 경우 사법기관 수사의뢰를 하거나 다른 이용자를 보호할 목적으로 1년간 해당 개인정보를 보관할 수 있습니다\r\n" + 
		"2. 전자상거래 등에서의 소비자보호에 관한 법률, 통신비밀보호법, 정보통신망 이용촉진 및 관계법령에서 정한 일정 기간 동안 이용자의 개인정보를 보관할 수 있습니다.\r\n" + 
		"가. 계약 또는 청약철회 등에 관한 기록 : 5년\r\n" + 
		"나. 대금결제 및 재화의 공급에 관한 기록 : 5년\r\n" + 
		"다. 소비자의 불만 또는 분쟁 처리에 관한 기록 : 3년\r\n" + 
		"라. 표시, 광고에 관한 기록 : 6개월\r\n" + 
		"마. 접속로그, 서비스 이용기록 : 3개월\r\n" + 
		"바. 본인확인에 관한 기록 : 6개월\r\n" + 
		"\r\n" + 
		"제 6 조 (개인정보의 파기)\r\n" + 
		"A. 회사는 수집한 개인정보의 수집 및 이용 목적이 달성되거나 그 보유•이용기간이 종료되는 경우 고객의 동의, 이용약관, 관련 법령에 따라 보관이 필요한 경우를 제외하고 해당 정보를 지체 없이 파기합니다.\r\n" + 
		"B. 회사는 서면에 기재된 개인정보의 경우에는 분쇄기로 분쇄하거나 소각하며 전자적 방법으로 저장된 개인정보의 경우에는 그 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.\r\n" + 
		"\r\n" + 
		"제 7 조 (고객의 권리와 그 행사방법)\r\n" + 
		"A. 고객은 언제든지 회사가 보유하는 개인정보, 개인정보의 이용•제공내역, 수집•이용•제공에 대한 동의내역을 열람하거나 정정할 수 있습니다. 해당 개인정보에 오류가 있거나 보존기간이 경과한 것으로 판명되는 등 정정•삭제를 할 필요가 있다고 인정되는 경우에는 회사는 지체 없이 이를 수정합니다.\r\n" + 
		"B. 온라인 가입정보의 열람 및 정정을 하고자 하는 고객의 경우에는 사이버 고객센터 온라인 문의 또는 웹마스터에게 이메일로 연락하는 경우에도 회사는 지체 없이 필요한 조치를 취합니다.\r\n" + 
		"C. 회사는 대리인이 방문하여 열람증명을 요구하는 경우에는 적법한 위임을 받았는지 확인할 수 있는 위임장 및 본인의 인감증명서와 대리인의 신분증 등을 제출 받아 정확히 대리인 여부를 확인합니다.\r\n" + 
		"D. 고객이 개인정보의 오류에 대한 정정을 요청한 경우, 정정이 완료되기 전까지 개인정보를 이용 또는 제공하지 않습니다.\r\n" + 
		"E. 회사는 잘못된 개인정보를 이미 제3자에게 제공한 경우 그 정정 처리결과를 제3자에게 지체 없이 통지하여 정정하도록 합니다.\r\n" + 
		"F. 고객은 개인정보를 최신의 상태로 정확하게 입력하고 변동 사항이 있는 경우, 이를 회사에 통보하여야 하며, 스스로 부정확한 정보를 입력하거나, 회사에 통보하지 않아서 회사가 알 수 없는 고객정보의 변동으로 인한 책임은 고객 자신에게 귀속됩니다.\r\n" + 
		"G. 고객이 타인 정보의 도용이나 침해, 허위정보를 입력하는 경우 서비스 해지 및 회원자격이 상실될 수 있으며 법 등 관련 법령에 따라 처벌받을 수 있습니다.\r\n" + 
		"H. 고객이 개인정보의 열람•제공을 반복적으로 요구하는 등 업무에 지장을 줄 우려가 있거나 그 분량이 상당하여 비용이 드는 경우, 회사는 고객의 요구를 연기 또는 거절하거나 업무처리에 따른 실비(복사비 등)를 고객에게 청구할 수 있습니다.\r\n" + 
		"\r\n" + 
		"제8조(개인정보 자동 수집 장치의 설치·운영 및 거부) \r\n" + 
		"회사는 이용자 개개인에게 개인화되고 맞춤화된 서비스를 제공하기 위해 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다.\r\n" + 
		"1. 쿠키의 사용 목적\r\n" + 
		"   회원과 비회원의 접속 빈도나 방문 시간 등의 분석, 이용자의 취향과 관심분야의 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공 \r\n" + 
		"2. 쿠키 설정 거부 방법\r\n" + 
		"   이용자는 쿠키 설치에 대해 거부할 수 있습니다. 단, 쿠키 설치를 거부하였을 경우 로그인이 필요한 일부 서비스의 이용이 어려울 수 있습니다.\r\n" + 
		"   (설정방법, IE 기준)웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 > 사이트 차단\r\n" + 
		"\r\n" + 
		"제 9 조 (개인정보 수집•이용•제공에 대한 동의철회)\r\n" + 
		"A. 개인정보의 수집•이용•제공에 대해 고객은 동의한 내용을 언제든지 철회할 수 있습니다. 개인정보관리책임자 및 담당자에게 서면, 전화, 이메일 등으로 연락하면 하실 수 있으며 회사는 지체 없이 개인정보의 삭제 등 필요한 조치를 합니다.\r\n" + 
		"B, 회사는 고객이 동의철회를 하여 개인정보를 파기하는 등의 조치를 취한 경우 고객의 요청에 따라 그 사실을 고객에게 통지합니다.\r\n" + 
		"\r\n" + 
		"제 10 조 (개인정보보호를 위한 기술적/관리적 대책)\r\n" + 
		"A. 기술적 대책 회사는 개인정보를 취급함에 있어 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.\r\n" + 
		"1. 접속기록의 위/변조 방지 조치를 취하고 있습니다.\r\n" + 
		"2. 개인정보는 그 종류에 따라 관련 법령이 요구하는 수준의 암호화 저장 또는 전송 시 암호화 기술의 적용하여 관리합니다.\r\n" + 
		"3. 백신프로그램을 이용하여 컴퓨터 바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있으며, 백신프로그램을 주기적으로 업데이트하고 갑작스러운 바이러스 출현 시에 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.\r\n" + 
		"4. 암호알고리즘을 이용하여 네트워크상 개인정보를 안전하게 전송하는 보안장치를 채택하고 있습니다.\r\n" + 
		"5. 해킹 등 외부 침입에 대비하여 각 서버마다 침입차단시스템 및 취약점분석시스템을 이용하여 보안에 최선을 다하고 있습니다.\r\n" + 
		"B. 관리적 대책\r\n" + 
		"1. 회사는 개인정보 보호에 관한 내부관리계획을 수립, 시행하고 있습니다. \r\n" + 
		"2. 회사는 개인정보에 대한 접근권한을 필요 최소한의 인원으로 제한하고 있습니다.\r\n" + 
		"3. 회사는 개인정보를 취급하는 직원을 대상으로 새로운 보안기술 습득 및 개인정보 보호의무 등에 관해 정기적인 사내 교육 및 외부 위탁 교육을 실시합니다.\r\n" + 
		"4. 회사는 직원 입사 시 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고 개인정보취급방침에 대한 이행사항 및 직원의 준수 여부를 감사하기 위한 내부절차를 마련하고 있습니다.\r\n" + 
		"5. 개인정보 취급자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이루어지도록 하며 입사 및 퇴사 후 개인정보 사고에 관한 책임을 명확히 합니다.\r\n" + 
		"6. 개인정보와 일반 데이터는 혼합하여 보관하지 않고 분리하여 보관합니다.\r\n" + 
		"7. 전산실 및 자료 보관실 등을 특별 보호구역으로 설정하여 출입을 통제합니다.\r\n" + 
		"8. 회사는 고객의 실수나 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다. 고객 스스로가 본인의 개인정보를 보호하기 위해서 자신의 아이디와 패스워드를 적절하게 관리하고 스스로 책임을 져야 합니다.\r\n" + 
		"9. 회사는 내부 관리자의 실수나 기술관리상 사고로 인하여 개인정보의 도난, 유출, 변조, 훼손이 유발될 경우 적절한 대책과 보상을 강구합니다.\r\n" + 
		"\r\n" + 
		"제 11 조 (개인정보 관리책임자 및 상담신고)\r\n" + 
		"A. 고객의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위하여 당사는 개인정보 관리책임자를 두고 있습니다.고객의 개인정보와 관련한 문의사항이 있으시면 아래의 개인정보 관리책임자 또는 개인정보 관리담당자에게 연락 주시기 바랍니다.\r\n" + 
		"\r\n" + 
		"[개인정보관리 책임자/담당자]\r\n" + 
		"이름 : 장혜지\r\n" + 
		"연락처 : 010-9777-9444\r\n" + 
		"이메일 :	admin@naver.com\r\n" + 
		"\r\n" + 
		"B. 기타 개인정보에 관한 상담이 필요한 경우에는 아래 기관으로 문의하실 수 있습니다.\r\n" + 
		"– 개인정보침해신고센터: 전화 118 / 이메일 118@kisa.or.kr / 홈페이지 http://www.118.or.kr\r\n" + 
		"– 정보보호마크 인증위원회: 전화 02-580-0533 / 홈페이지 http://www.privacymark.or.kr\r\n" + 
		"– 대검찰청 인터넷범죄수사센터: 전화 02-3480-3600 / 홈페이지 http://icic.sppo.go.kr\r\n" + 
		"– 경찰청 사이버테러 대응센터: 전화 02-392-0330 / 홈페이지 http://www.police.go.kr\r\n" + 
		"\r\n" + 
		"부칙\r\n" + 
		"제1조 시행일\r\n" + 
		"본 취급방침은 2019년 8월 23일부터 시행합니다.";

	tos = tos.replaceAll("\r\n", "&#10;");
	tos = tos.replaceAll("<", "&lt;");
	tos = tos.replaceAll(">", "&gt;");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Insert title here</title>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/bootstrap.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <style>
        html{
            resize: both;
            width: 1910px;            
        }
        .navbar{
            font-size: 1.2rem;
            padding: 0rem 3rem;
        }
        .bg-primary{
            z-index: 2;
            position: fixed !important;
            width: 1910px;
            background-color: rgb(1,11,20) !important;
            top: 0;
        }
        
        .sign_in_btndiv {
        	width: 10%;
            float: right;
            /* margin-right: 2rem; */
            
        }
        .sign_in_btn{
            margin: 0 auto;
            display: inline-block;
            font-weight: 600;
            color: #919aa1;
            text-align: center;
            vertical-align: middle;
            width: 74px;
            background-color: transparent;
            border: 0px solid transparent;
            padding: 0.4rem 1.0rem;
            font-size: 0.875rem;
            line-height: 1.5rem;
            border-radius: 0;
            color: rgb(1,11,20);
            background-color: #fff;
            border-color: #fff;
            
        }
        
        .userFuncArea {
			width: 50px;
			height: 50px;
			float: left;
			margin-left: 10%;
			
		}
		
		.userFuncArea img {
			width: 100%;
			height: 100%;
			cursor:pointer;
		}
		
        footer{
            background-color: rgb(1,11,20);
            width: 100%;
            height: 3rem;
            bottom: 0;
            position: fixed;
            z-index: 2;
        }
        
        .form-control{
            width: 5rem;
        }
        .nav-hover{
            border-bottom: 4px solid rgb(1,11,20);
            border-top: 4px solid rgb(1,11,20);
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
        .detailList>li a{
            color: rgb(1,11,20);
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
	
        </style>


<!-- 모달설정 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<!-- 로그인 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/loginModal.css"></link>

<!-- 이용약관&동의 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/join_agree.css"></link>

<!-- 회원가입 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/joinForm.css"></link>

<!-- 아이디/비번 찾기 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/idPwdSearch.css"></link>

<!-- 소셜아이디로 로그인시 추가정보 입력폼 스타일-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/addInfoForm.css"></link>
	


<script>
	var msg = "<%= msg%>";
	
	if(msg != "null") { // msg 값이 있을 경우
		alert(msg);	
		<% session.removeAttribute("msg"); %>
	}
</script>



</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="<%=request.getContextPath()%>">로고자리</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor01">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover " href="#">악보공유</a>
                    <ul class="detailList">
                        <li><a href="#">피아노</a></li>
                        <li><a href="#">기타</a></li>
                        <li><a href="#">바이올린</a></li>
                        <li><a href="#">플루트</a></li>
                        <li><a href="#">하모니카</a></li>
                        <li><a href="#">etc</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover" href="<%=request.getContextPath()%>/sheetapplyWrite.li">악보신청</a>
                    <ul class="detailList">
                        <li><a href="<%=request.getContextPath()%>/sheetapplyWrite.li">피아노</a></li>
                        <li><a href="#">기타</a></li>
                        <li><a href="#">바이올린</a></li>
                        <li><a href="#">플루트</a></li>
                        <li><a href="#">하모니카</a></li>
                        <li><a href="#">etc</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover" href="#">커뮤니티</a>
                    <ul class="detailList detailList2">
                        <li><a href="<%= request.getContextPath() %>/notice.me">공지사항</a></li>
                        <li><a href="<%= request.getContextPath() %>/freeBoard.bo">자유게시판</a></li>
                        <li><a href="#">Q&A</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover" href="<%=request.getContextPath()%>/playgroupSearch.bo">연주모임</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
            </form>
                    <div class="sign_in_btndiv">
        	<!-- 로그인 안했을 경우 -->
        	<% if(loginUser == null) { %>
            	<button class="sign_in_btn">sign in</button>
            <% } else { %>
            	<!-- 로그인 했을 경우. 마이페이지 이동, 로그아웃 가능  -->
            	<div id="mypageDiv" class="userFuncArea" 
            		onclick="location.href='<%=request.getContextPath()%>/myPage.me'">
            		<img src="<%=request.getContextPath() %>/views/image/mypage_w.png"/>	
            	</div>
            	<div id="logoutDiv" class="userFuncArea" onclick="logout()">
            		<img src="<%=request.getContextPath() %>/views/image/logout_w.png"/>
            	</div>
            
            <% } %>
        </div>
        </div>

    </nav>


    <footer>

    </footer>
    <script>
            $(window).scroll(function(){
                $(".navbar").css("left", 0-$(this).scrollLeft());
            })
        </script>


	<!--로그인 버튼을 눌렀을 때의 모달. -->
	<div id="login-modal" class="all-area-modal">
	
	
		<!-- 로그인 창 -->
	    <div id="login-form" class= "animate-top">
        	<div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
	        <div id="login-input-email-pwd">
               <form method="post" id="login-form-input" action="<%=request.getContextPath() %>/loginUser.us">
               		<input type="hidden" name="thisUrl" value="" id="thisUrl"></input>
               		<!-- 이메일로 로그인. loginWay -->
               		<input type="hidden" name="loginWay" value="E"></input>
                   <div id="email_label" class="login_input_label">EMAIL</div>
                   <div id="login-input-email">
                       <input type="text" id="input-email" name="inputEmail" required>
                   </div>
                   <di id="pwd_label" class="login_input_label">PASSWORD</di>
                   <div id="login-input-pwd">
                       <input type="password" id="input-pwd" name="inputPwd" required>
                   </div>
                   <div id="login-input-btn" class="login_btn_area">
                       <button type="submit" id="go-login" class="center login_btn">로그인</button>
                   </div>
               </form>
           </div>
	        
			<!-- 소셜로그인 영역. 카카오, 네이버 -->
	        <div id="social_login">
	            <div id="kakao_area" class="login_btn_area">
	                <img class="kakaoCreateBtn" src="<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png"
	                	onmouseover="this.src='<%=request.getContextPath() %>/views/image/createKakaoBtn_p.png'"
	                		onmouseout="this.src='<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png'">
	            </div>
	            <div id="naver_area" class="login_btn_area">
	            	<img id="naverCreateBtn" src="<%=request.getContextPath() %>/views/image/createNaverBtn_m.PNG"
	            	onmouseover="this.src='<%=request.getContextPath() %>/views/image/createNaverBtn_p.PNG'"
	                		onmouseout="this.src='<%=request.getContextPath() %>/views/image/createNaverBtn_m.PNG'"></img>
	            </div>
	        </div>
	       
	        <!-- 회원가입, id/pwd 찾기 버튼 영역 -->
	        <div id="login_form_footer">
	            <span id="join_search_btn_area">
	                <button id="btn-join">회원가입</button>
	                <button id="btn-id-pwd-search">ID / PASSWORD 찾기</button>
	            </span>
	        </div>
	    </div>
	    
	    
	    
	    <!-- 회원가입 눌렀을 때 -->
        <div id="agree-form" class="animate-top">
            <div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
            
            <div id="terms-of-service">
                <span class="tos_label">이용약관</span>
                <div id="tos_content_area">
                    <textarea id="tos_content" readonly style="resize:none"></textarea>
                </div>
                <div id="tos_agree_area">
                    <input type="radio" name="agree" value="true"> 동의합니다.
                </div>
            </div>

            <div id="join_way">
                <span class="join_way_label">가입수단</span>
                <div id="email_area" class="join_btn_area">
                    <button id="join_email" class="join_btn">이메일</button>
                </div>
                <div id="kakao_area" class="join_btn_area">
                    <img class="kakaoCreateBtn" src="<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png"
	                	onmouseover="this.src='<%=request.getContextPath() %>/views/image/createKakaoBtn_p.png'"
	                		onmouseout="this.src='<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png'">
                </div>
                <div id="naver_area" class="join_btn_area">
                    <img id="naverCreateBtn" src="<%=request.getContextPath() %>/views/image/createNaverBtn_m.PNG"
	            	onmouseover="this.src='<%=request.getContextPath() %>/views/image/createNaverBtn_p.PNG'"
	                		onmouseout="this.src='<%=request.getContextPath() %>/views/image/createNaverBtn_m.PNG'"></img>
                </div>
            </div>
            
        </div>
        
        
		<!-- (이메일로) 회원가입 모달 -->
        <div id="join_form" class="animate_top">
            <div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
            <form method="post" action="<%=request.getContextPath() %>/emailJoin.do" id="join_form_input">
                <input type="hidden" name="thisUrl" value="" id="thisUrl"></input>
                <div id="join_input_info">
                    <span id="email_label" class="join_label">EMAIL</span>
                    <span class="chkMsg" id="emailChkMsg"></span>
                    <div id="join_input_pwd" class="join_input_area">
                        <input type="email" class="verify" id="joinEmail" name="joinEmail" required>
                        <button type="button" id="emailChk" class="chkBtn" disabled>인증</button>
                    </div>
                    
                    <span id="pwd_label" class="join_label">PASSWORD</span>
                    <span class="chkMsg" id="pwdRegMsg"></span>
                    <div id="join-input-pwd" class="join_input_area">
                        <input type="password" class="info" id="joinPwd" name="joinPwd" required>
                    </div>
                    
                    <span id="pwd_chk_label" class="join_label">PASSWORD 확인</span>
                    <span class="chkMsg" id="pwdChkMsg"></span>
                    <div id="join-input-pwd" class="join_input_area">
                        <input type="password" class="info" id="pwdChk" name="pwdChk" required>
                    </div>
                    
                    <span id="name_label" class="join_label">이름</span>
                    <div id="join_input_name" class="join_input_area">
                        <input type="text" class="info" id="joinName" name="joinName" required>
                    </div>
                    
                    
                    <span id="nickName_label" class="join_label">닉네임</span>
                    <span class="chkMsg" id="nickNameChkMsg"></span>
                    <div id="join_input_nickName" class="join_input_area">
                        <input type="text" class="verify" id="nickName" name="nickName" required>
                        <button type="button" id="nickNameChk" class="chkBtn">중복확인</button>
                    </div>

                    <div id="join_btn_area" class="login_btn_area">
                        <button type="submit" id="go_join" class="join_btn">가입하기</button>
                    </div>
                </div>
            
            </form>
        </div>
        
        <!-- ID/PWD 찾기 모달  -->
	    <!-- ID 찾기 창 -->
	    <div class="id_pwd_search_area animate_top">
	        <div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
	        <span class="id_pwd_search_header">ID 찾기</span>
	        
	        <div class="id_pwd_search_form">
	            
	            <span class=" id_pwd_search_label">이메일</span>
	            <div id="email_input_area" class="input_area">
	                <input type="text" class="info" id="email" name="id">
	            </div>
	            
	            <div class="verify_area">
	                <span class="msg">메일이 발송되었습니다.</span>
	                <button class="send_mail">메일 발송</button>
	            </div>
	            
	        </div>
	
	        <div class="id_pwd_search_footer">
	            <span class="middle_line"><hr></span>
	            <button id="id_go_loin" class="login_btn">로그인</button>
	        </div>
	        
	    </div>
	    
	    <!-- PASSWORD 찾기 창 -->
	    <div class="id_pwd_search_area animate_top">
	        <div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
	        <span class="id_pwd_search_header">PASSWORD 찾기</span>
	        
	        <div class="id_pwd_search_form">
	            
	            <span class=" id_pwd_search_label">ID</span>
	            <div id="id_input_area" class="input_area">
	                <input type="text" class="info" id="id" name="id">
	            </div>
	
	            <span class=" id_pwd_search_label">이메일</span>
	            <div id="email_input_area" class="input_area">
	                <input type="text" class="info" id="email" name="id">
	            </div>
	            
	            <div class="verify_area">
	                <span class="msg">메일이 발송되었습니다.</span>
	                <button class="send_mail">메일 발송</button>
	            </div>
	            
	        </div>
	
	        <div class="id_pwd_search_footer">
	            <span class="middle_line"><hr></span>
	            <button id="pwd_go_loin" class="login_btn">로그인</button>
	        </div>
	        
	    </div>
	    
	    
	</div>
	
	
   <div id="addInfoModal" class="all-area-modal2"> 
    
       <!-- 소셜로그인시 추가정보 입력 모달 -->
		<div class="addInfoPositon">
			<span id="addInfoMsg"> 가입된 카카오 아이디가 없습니다.<br> 정보를 추가로 입력하면 가입이 완료됩니다.</span>
			<div id="addInfoWrap" class="animate-top">
				<!-- 추가정보 입력폼 닫기 버튼 -->
				<div id="addInfoHeader"><span id="addInfoClose" onclick="exitAddInfoModal();">x</span></div>
				
				<div id="addInfoForm">
					<!-- 추가정보 입력폼 -->
					<form id="addForm" method="post" action="<%=request.getContextPath() %>/kakaoJoin.us">
						<input type="hidden" name="thisUrl" value="" id="thisUrl"></input>
						<input type="hidden" name="socialUserId" value=""></input>
						<input type="hidden" name="socialUserName" value=""></input>
						<span id="add_email_label" class="addInfoLabel">EMAIL</span>
						<span class="addChkMsg" id="addEmailChkMsg">중복 x</span>
						<div id="join_input_pwd" class="add_input_area">
						   <input type="email" class="verify" id="addJoinEmail" name="addJoinEmail" required>
						   <button type="button" id="addEmailChk" class="addChkBtn" disabled>인증</button>
						</div>
						 
						<span id="add_nickName_label" class="addInfoLabel">닉네임</span>
						<span class="addChkMsg" id="addNickNameChkMsg">중복 x</span>
						<div id="join_input_nickName" class="add_input_area">
						   <input type="text" class="verify" id="addNickName" name="addNickName" required>
						   <button type="button" id="addNickNameChk" class="addChkBtn">중복확인</button>
						</div>
						
						<div id="addInfoFooter">
						   <span id="addMiddleLine"><hr></span>
						   <button type="submit" class="addJoinBtn">가입하기</button>  
						</div>
					</form>
				</div>
			  

         </div>
       </div>
    
    </div>
	
	<script>
	
	/* 
    // 모달 실행시 모달폼 이외의 영역 클릭하면 폼 닫기. 폼 데이터 리셋 
	$(document).on("click", function(e) {
		if($("#login-modal").is(e.target)) {
			$("#login-modal").css("display","none");
			$("#login-modal form").each(function() {
				this.reset();
			});
			$(".chkMsg, .msg, .addChkMsg").text("");
		}
	}); */
	
	
	// 로그아웃 함수
	function logout() {
		<% if(loginUser != null) {
			if(loginUser.getSign().equals("E"))  { %>
				location.href = "<%=request.getContextPath()%>/logout.me";
			<% } else if(loginUser.getSign().equals("K")) { %>
				Kakao.Auth.logout();
				location.href = "<%=request.getContextPath()%>/logout.me";
			<% } else{ %>
				location.href = "<%=request.getContextPath()%>/logout.me";			
			<% } %>
		<% } %>
	}
	// 로그인 버튼을 누르거나 x를 누르면 모달 닫기.
    function exitLoginModal() {
    
        $("#login-modal").css("display","none");
		$("#login-modal form").each(function() {
			this.reset();
		});
		$(".chkMsg, .msg, .addChkMsg").text("");
	}
	
	// 소셜로그인시 추가정보 입력 모달. x를 누르면 모달 닫기.
    function exitAddInfoModal() {
        document.getElementById('addInfoModal').style.display = 'none';
        $(".addChkMsg").text("");
        $("#addInfoModal form").each(function() {
			this.reset();
		});
	}

	$(function() {
		$("#login-modal form").submit(function() {
			$("#thisUrl").val($(location).attr('href'));
		});
		
		
		// 로그인 버튼 누르면 모달 실행. 
		$(".sign_in_btn").click(function() {
		   	$("#login-modal").css("display", "block");
		   	$("#login-form").css("display", "block");
		    $("#agree-form").css("display", "none");
		    $("#join_form").css("display", "none");
		    $(".id_pwd_search_area").css("display", "none");
		    $("#login-modal form").each(function() {
				this.reset();
			});
		    $(".chkMsg, .msg, .addChkMsg").text("");
	    });
		 
		 
	    // 회원가입 버튼 누르면 로그인 화면 사라지고 동의창 나옴. 
	    $("#btn-join").click(function() {
	    	$("#login-form").css("display", "none");
	    	$("#agree-form").css("display", "block");
	    	$("#tos_agree_area").css("color", "gray");
	    });
	    
	    // 이메일로 회원가입 버튼 누르면 동의창 사라지고 이메일 회원가입창 나옴.
	    $("#join_email").click(function() {
	    	var doAgree = $("#tos_agree_area input").is(':checked');
	    			
	    	if(doAgree) {
		    	$("#agree-form").css("display", "none");
		    	$("#join_form").css("display", "block");
		    	$("#emailChk").attr("disabled", true).css("border-style", "none");
	    	} else {
	    		$("#tos_agree_area").css("color", "red");
	    	}
	    });
	    
	    //id/pwd찾기 버튼 눌렀을 때 로그인 창 사라지고 id/pwd 찾기 모달 나옴.
	    $("#btn-id-pwd-search").click(function() {
	    	$("#login-form").css("display", "none");
	    	$(".id_pwd_search_area").css("display", "inline-block");
	    });
	    
	    // id/pwd 찾기 창에서 로그인 버튼 눌렀을 때 찾기 모달 사라지고 로그인 모달 나옴.
	    $(".login_btn").click(function() {
		   	$("#login-form").css("display", "block");
		    $(".id_pwd_search_area").css("display", "none"); 
	    });
   
	    // 카카오로그인 이미지 누르면 카카오 api 실행
    	/* $("#kakaoCreateBtn").click(function() {
    		$("#kakao-login-btn img").click();
    	}); */
    	// 카카오로그인 이미지 누르면 카카오 api 실행
		$(".kakaoCreateBtn").click(function() {
			kakaoLogin();
		});
    	
    	
    	
    	
	    // 네이버로그인 이미지 누르면 네이버 api 실행
    	$("#naverCreateBtn").click(function() {
    		$("#naverIdLogin_loginButton img").click();
    	});
	    
	    
	/* ---------- 이메일로 회원가입 시 필요한 function ----------- */
	    // 회원가입시 필요한 플래그 변수
    	var emailC = false;
		var pwdC = false;
		var pwd2C = false;
		var nickNameC = false;
    	
		// 이메일 입력하면 ajax로 체크 실행.
   		$("#join_form input[name=joinEmail]").on("input", function() {
   			
   			$("#emailChk").attr("disabled", true);
   			// 이메일 형식검사
   			regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
			var joinEmail = $("#joinEmail").val().trim();
		
			if(regExp.test(joinEmail)) {
				
				$.ajax({
					url: "<%=request.getContextPath()%>/emailCheck.do",
	    			data: {joinEmail : joinEmail},
	    			type: "get",
					success : function(result) {
						if(result == 0) {
							$("#emailChkMsg").text("사용가능한 아이디입니다.").css({"color":"green", "font-weight":"bold"});
							$("#emailChk").attr("disabled", false).css("border","1px solid yellowgreen");
							emailC = true;
						} else {
							$("#emailChk").attr("disabled", true).css("border-style", "none");
							$("#emailChkMsg").text("중복되었습니다.").css({"color":"red", "font-weight":"bold"});
							emailC = false;
						}
					},
					error : function() {
						console.log("aJax 통신 오류");
					}
				});
			} else {
				emailC = false;
				$("#emailChkMsg").text("이메일을 올바르게 기입해주세요.").css({"color":"red", "font-weight":"bold"});
			}
		});
	
   		// 비밀번호 형식 검사
		$("#join_form input[name=joinPwd]").keyup(function() {
			var value = $("#joinPwd").val().trim();
		
			// 숫자, 문자(영어) 포함 형태
			// 6~12 자리 이내
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			
			if(regExp.test(value)) {
				$("#pwdRegMsg").text("비밀번호 형식 O").css("color", "green");
				pwdC = true;
			} else {
				$("#pwdRegMsg").text("비밀번호 형식 X").css("color", "red");
				pwdC = false;
			}
		
		});
	    
   		// 비밀번호 일치 여부 검사
		$("#join_form input[name=joinPwd], input[name=pwdChk]").keyup(function() {
			var pwd = $("#joinPwd").val().trim();
			var pwd2 = $("#pwdChk").val().trim();
			pwd2C = false;
			if(pwd == pwd2) {
				$("#pwdChkMsg").text("비밀번호 일치").css({"color":"green", "font-weight":"bold"});
				pwd2C = true;
			} else {
				$("#pwdChkMsg").text("비밀번호 불일치").css({"color":"red", "font-weight":"bold"});
				pwd2C = false;
			}
		});
   		
   		// 닉네임 중복확인 검사 
   		$("#nickName").keyup(function() {
   			nickNameC = false;
   			$("#nickNameChk").click(function() {
	   			nickNameC = false;
	   			
	   			var value = $("#nickName").val().trim();
	   			
	   			$.ajax({
					url : "<%=request.getContextPath()%>/nickNameCheck.do",
					type : "get",
					data : {nickName : value},
					success : function(result) {
						if(result == 0) {
							$("#nickNameChkMsg").text("사용가능한 닉네임입니다.").css({"color":"green", "font-weight":"bold"});
							nickNameC = true;
						} else {
							$("#nickNameChkMsg").text("중복되었습니다.").css({"color":"red", "font-weight":"bold"});
							nickNameC = false;
						}
					},
					error : function(e) {
						console.log("Ajax 통신 실패");
					}
				});
	   		});
   		});
   		
   		// 회원가입 버튼 클릭시 검사
		$("#go_join").click(function() {
			
			// 아이디 형식 검사
			if(!emailC) {
				$("#joinEmail").focus();
				return false;
			}
			if(!pwdC) {
				alert("비밀번호 형식에 맞게 입력해주세요.");
				$("#joinPwd").focus();
				return false;
			}
			if(!pwd2C) {
				$("#pwdChk").focus();
				return false;
			}
			if(!nickNameC) {
				$("#nickName").focus();
				return false;
			}
		});
   		
	
	
    
	/* ---------- 소셜아이디로 회원가입 시 필요한 function ----------- */
	    // 회원가입시 필요한 플래그 변수
		var addEmailC = false;
		var addNickNameC = false;
	    // 이메일 입력하면 ajax로 체크 실행.
		$("#addForm input[name=addJoinEmail]").on("input", function() {
	         
			$("#addEmailChk").attr("disabled", true);
	         // 이메일 형식검사
			regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   
			var addJoinEmail = $("#addJoinEmail").val().trim();
	
			if(regExp.test(addJoinEmail)) {
				$.ajax({
					url: "<%=request.getContextPath()%>/emailCheck.do",
					data: {joinEmail : addJoinEmail},
					type: "get",
					success : function(result) {
						if(result == 0) {
							$("#addEmailChkMsg").text("사용가능한 이메일입니다.").css({"color":"green", "font-weight":"bold"});
							$("#addEmailChk").attr("disabled", false).css("border","1px solid yellowgreen");
							addEmailC = true;
						} else {
							$("#addEmailChk").attr("disabled", true).css("border-style", "none");
							$("#addEmailChkMsg").text("이미 가입된 이메일입니다.").css({"color":"red", "font-weight":"bold"});
							addEmailC = false;
						}
					},
					error : function() {
						console.log("aJax 통신 오류");
					}
				});
			} else {
				addEmailC = false;
				$("#addEmailChkMsg").text("이메일을 올바르게 기입해주세요.").css({"color":"red", "font-weight":"bold"});
			}
		});
	
	   // 닉네임 중복확인 검사 
	   $("#addNickName").keyup(function() {
	      addNickNameC = false;
	      $("#addNickNameChkMsg").text("");
	      
	      $("#addNickNameChk").click(function() {
	         
	         var addValue = $("#addNickName").val().trim();
	         
	         $.ajax({
		         url : "<%=request.getContextPath()%>/nickNameCheck.do",
		         type : "get",
		         data : {nickName : addValue},
		         success : function(result) {
		            if(result == 0) {
		               $("#addNickNameChkMsg").text("사용가능한 닉네임입니다.").css({"color":"green", "font-weight":"bold"});
		               nickNameC = true;
		            } else {
		               $("#addNickNameChkMsg").text("중복되었습니다.").css({"color":"red", "font-weight":"bold"});
		               nickNameC = false;
		            }
		         },
		         error : function(e) {
		            console.log("Ajax 통신 실패");
		         }
		      });
	      });
	   });
	   
	   // 가입 버튼 클릭시 검사
		$("#addJoinBtn").click(function() {
		   
		   // 이메일 형식 검사
		   if(!addEmailC) {
		      $("#addJoinEmail").focus();
		      return false;
		   }
		   
		   // 닉네임 중복검사
		   if(!addNickNameC) {
		      $("#addNickName").focus();
		      return false;
		   }
		});
		   
		/* -------------- 카카오로그인, 회원가입시 필요한 스크립트 ----------------- */
	   //<![CDATA[
	   // 사용할 앱의 JavaScript 키를 설정해 주세요.
	   Kakao.init('<%=kakaoKey%>');
	   function kakaoLogin() {
		
		   Kakao.Auth.loginForm({
		      success : function(authObj) {
		         // 로그인 성공시, API를 호출합니다.
		         Kakao.API.request({
		            url : '/v2/user/me',
		            success : function(res) {
		               
		               var userId = res.id;
		               var userName = res.properties.nickname
		               console.log("userId / " + userId);
		               $.ajax({
		                  url :'<%=request.getContextPath()%>/isSocialUser.us',
		               data : {userId: userId, sign: "K"},
		               type: 'post',
		               success: function(result) {
		                  console.log("회원가입여부 / " + result);
		                  if(result > 0) {
		                	 var thisUrl = $(location).attr('href');
		                     location.href="<%=request.getContextPath()%>/socialLogin.us?userId="+userId+"&sign=K&thisUrl="+thisUrl;
		                     } else {
		                        console.log("모달 나오냐 / " + result);
		                        $("#addInfoModal").css("display", "block");
		                        $("input[name=socialUserId]").val(userId);
		                        $("input[name=socialUserName]").val(userName);
		                        console.log("userId: " + userId + " / userName: " + userName)
		                       
		                        if(res.kakao_account.email_needs_agreement == "true" && 
		                              res.kakao_account.email.is_email_verified == "true") {
		                           $("#addJoinEmail").val(res.kakao_account.email).attr("readonly");
		                        }
		                        
		                        
		                     }
		                  }, 
		                  fail: function(err) {
		                     console.log("카카오유저 확인 실패");
		                     console.log(err);
		                  }
		                  
		               });
		               
		            },
		            fail: function(err) {
		               console.log(err);
		            }
		         });
		      },
		      
		      fail: function(err) {
		         console.log(err);
		      }
		        
		   
		   });
		}

	   
	   var naverLogin = new naver.LoginWithNaverId({
	   	clientId : "TyJHkEkL1q5EMX7mTaF3",
	   	callbackUrl : "http://localhost:8080/NORE_DUCK/views/common/naverLoginCallback.jsp"+"?thisUrl="+$(location).attr('href'),
	   	isPopup : false, /* 팝업을 통한 연동처리 여부 */
	   	loginButton : {
	   		color : "green",
	   		type : 3,
	   		height : 60
	   	}
	   /* 로그인 버튼의 타입을 지정 */
	   });
	   /* 설정정보를 초기화하고 연동을 준비 */
	   naverLogin.init();
	   
		$("#tos_content").html("<%=tos%>").attr("overflow", "auto");
		
		
	   
	});
	
</script>

    
			<!-- 카카오 api로 생성한 로그인 버튼. 보이지 않게 설정. -->
			<a id="kakao-login-btn" class="login_btn"></a>
			<!-- 네이버 api로 생성한 로그인 버튼. 보이지 않게 설정. -->
			<div id="naverIdLogin" class="api_login login_btn" style="display:none"></div>
  
  <%-- <script src="<%=request.getContextPath() %>/views/script/login.js"></script>    
  --%>

</body>
</html>