<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/movie.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<title>movie</title>
<style>
.ruleInfo {
	font-family: Microsoft JhengHei;
	padding: 50px 300px;
}

.ruleButton {
	text-align: center;
}

.ruleButton input {
	width: 200px;
	height: 30px;
}
</style>
</head>
<body>

	<jsp:include page="../fragment/top.jsp" />

	<div class="ruleInfo">
		<h1>一、訂票及取票規定[一般票種]</h1>
		<ol>
			<li>每筆訂票張數以 10 張為限。</li>
			<li>iShow會員票種每日訂票張數以 10 張為限。</li>
			<li>各銀行優惠票種之張數與折扣金額，請依各銀行信用卡優惠規則為準。銀行優惠票種預訂以電影播放日期為準，非刷卡日計算。每卡每日購買張數限制依影片版本與觀影日期相關規定限制。</li>
			<li>請注意此交易金額將於購票步驟完成後，即刻於您的信用卡帳戶或儲值金帳戶中進行扣款。</li>
			<li>銀行優惠票種與iShow會員票種無法於同筆訂單中，請分次訂購，唯兩筆訂票無法保證座位。</li>
			<li>完成付款後，請憑「訂票序號」至購票影城進行取票。</li>
			<li>購票完成亦可至超商進行取票，但若交易內含餐飲品項，須至購票影城臨櫃領取電影票與餐點。</li>
			<li>網路訂票每張票需加收NT$20手續費。</li>
			<li>片長 150分鐘(含)以上之電影需加價NT$10，每增加30分鐘需另再加價NT$10。</li>
		</ol>

		<h1>二、退換票規定[一般票種]</h1>
		<ol>
			<li>線上購票後若已領取電影票，因故無法如期觀影，請於開演前 20
				分鐘持未使用之電影票與原訂購之信用卡親至觀影影城辦理退換票。已取票或取餐者，無法進行線上退款。</li>
			<li>線上購票後若尚未領取電影票，因故無法如期觀影，可於威秀影城官網登入會員訂票紀錄中進行線上退票，電影票最遲應於影片開演2小時前完成線上退票程序。</li>
			<li>電影票遺失恕不補發，亦無法辦理退換票。線上購票完成後退、換票，訂票手續費恕不退還，且不保證相同座位。</li>
			<li>因天災或特殊事故取消電影放映時，請於購票場次7日內憑『未使用之原票券』至原購票影城櫃台辦理退換票，影城未營業期間均不收取手續費。</li>
			<li>退、換票注意事項：若是信用卡付款，則需攜帶購票之信用卡辦理退票（如未攜帶原購票信用卡，恕無法辦理退換票）。</li>
			<li>其餘未盡事項依影城現場公告為主。</li>
		</ol>
		<div style="text-align: center;">
			<input type="checkbox" id="agree" />我已閱讀並同意上述規定<br>
		</div>
		<br>
		<div class="ruleButton">
			<input type="button" value="&#060; 返回場次選擇"
				onclick="javascript:location.href='booking'" /> <input
				type="button" value="前往訂票" id="goTo"
				onclick="javascript:location.href='seatChoose'" />
		</div>
	</div>

	<jsp:include page="../fragment/bottom.jsp" />

</body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#goTo').attr('disabled', true);
		var tf = true;
		$('#agree').click(function() {
			tf = !tf;
			$('#goTo').attr('disabled', tf ? true : false);
		});
	});
</script>
</html>