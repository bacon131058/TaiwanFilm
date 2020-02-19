<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<style>
.whole {
	text-align: center;
	width: 100%
}

.ball-area {
	width: 80%;
	display: inline-block
}

.number {
	position: relative;
	padding-top: 7px;
	color: white;
	font-weight: bold;
}

.Process {
	width: 100%;
}

.Process-area {
	text-align: center;
	width: 100%;
	display: inline-block;
}

.ball1 {
	width: 70px;
	height: 40px;
	display: inline-block;
	font-size: 14px;
}

.ball2 {
	width: 270px;
	display: inline-block;
}

.ball-area1 {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #cccccc;
	display: inline-block
}

.ball-area2 {
	width: 300px;
	height: 5px;
	background: #e9ebec;
	display: inline-block;
}

.area {
	width: 80%;
	display: inline-block;
	text-align: center
}

.process2 {
	background: #9c9c90;
}

.shopping {
	text-align: center;
	display: inline-block;
	width: 80%;
	background: #f6f6f6;
}

.shopping-title {
	text-align: left;
	padding: 20px;
	font-size: 20px;
}

.content {
	width: 100%;
	background: white;
	padding: 10px 0px;
	display: inline-block;
}

.content-area {
	width: 13%;
	display: inline-block;
	padding-top: 15px;
	text-align: center
}

.Information {
	width: 15%;
	text-align: left;
}

.img {
	width: 100%;
	display: inline-block;
	margin-left: -17px;
}

.desc {
	width: 65%;
	display: inline-block;
}

.ball-area {
	width: 80%;
	text-align: center;
}

.ball {
	width: 50px;
	height: 50px;
	margin: 0px 50px;
	border-radius: 50%;
	display: inline-block;
	background: red;
}
</style>
<script type="text/javascript">
	function cancelOrder() {
		if (confirm("確定取消此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "CANCEL";
			document.forms[0].action = "<c:url value='ProcessOrder' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
	function reconfirmOrder() {
		var sa = document.getElementById('ShippingAddress').value;
		if (sa === "") {
			window.alert('出貨地址不能是空白');
			return;
		}
		if (confirm("確定送出此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "ORDER";
			document.forms[0].action = "<c:url value='ProcessOrder' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
</script>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean id="today" class="java.util.Date" scope="session" />
<title>TaiwanFilms</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<c:set var="funcName" value="CHE" scope="session" />

	<jsp:include page="../fragment/menu.jsp" />

	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="whole">
		<div class="ball-area">
			<div class="Process">
				<div class="Process-area">
					<div class="ball-area1  process1">
						<div class="number">1</div>
					</div>
					<div class="ball-area2"></div>
					<div class="ball-area1  process2">
						<div class="number">2</div>
					</div>
					<div class="ball-area2"></div>
					<div class="ball-area1  process3">
						<div class="number">3</div>
					</div>
				</div>
			</div>
			<div class="Process">
				<div class="Process-area">
					<div class="ball1">購物車</div>
					<div class="ball2"></div>
					<div class="ball1">填寫資料</div>
					<div class="ball2"></div>
					<div class="ball1">訂購完成</div>
				</div>
			</div>
		</div>

		<div style="text-align: center">
			<h3>確認訂單：</h3>
			<FORM style="margin: 0 auto; width: 750px;"
				action="<c:url value='ProcessOrder' />" method="POST">
				<TABLE
					style="background: white; border-radius: 6%; border: 0.5px solid #d1d1d1; width: 810; border: ridge; border-collapse: collapse;">
					<TR style="height: 45px; background: bisque;">
						<TD style="text-align: center; border: 0.5px solid #d1d1d1;">
							會員編號：${members.memberId}</TD>
						<TD style="text-align: center; border: 0.5px solid #d1d1d1;">
							客戶姓名：${members.memberName}</TD>
						<TD style="text-align: center; border: 0.5px solid #d1d1d1;">
							訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
						</TD>
					</TR>
					<TR>
						<TD colspan='3'
							style="text-align: left; border: 0.5px solid #d1d1d1; padding-left: 39px; background: floralwhite;">
							會員地址：台北市萬華區長泰街109號4樓</TD>
					</TR>
					<TR>
						<TD colspan='3'
							style="text-align: left; border: 0.5px solid #d1d1d1; padding-left: 39px; background: floralwhite;">
							出貨地址：<Input style="background: #d1d1d1;" size="60" type="text"
							id='ShippingAddress' name="ShippingAddress"
							value="台北市大安區復興南路一段390號2樓"> <font color='red'>${errorMsg.ShippingAddress}</font>
						</TD>
					</TR>
					<TR>
						<TD colspan='3'
							style="text-align: left; border: 0.5px solid #d1d1d1; padding-left: 39px; background: floralwhite;">
							統一編號：<Input style="background: #d1d1d1;" size="10" type="text"
							name="BNO" value="">
						</TD>
					</TR>
					<TR>
						<TD colspan='3'
							style="text-align: left; border: 0.5px solid #d1d1d1; padding-left: 39px; background: floralwhite;">
							發票抬頭：<Input style="background: #d1d1d1;" size="50" type="text"
							name="InvoiceTitle" value="">
						</TD>
					</TR>

					<TR>
						<TD colspan='3'>

							<TABLE border='1' style="border: 0.5px solid #d1d1d1;">

								<TR style="height: 40px; background: turquoise;">
									<TH style="text-align: center; font-size: 12pt;" width="350">商品名稱</TH>
									<!-- <TH style="text-align:center;font-size: 12pt;" width="80">作者</TH> -->
									<TH style="text-align: center; font-size: 12pt;" width="180">廠商名稱</TH>
									<TH style="text-align: center; font-size: 12pt;" width="50">數量</TH>
									<TH style="text-align: center; font-size: 12pt;" width="80">單價</TH>
									<TH style="text-align: center; font-size: 12pt;" width="110">小計</TH>
								</TR>

								<c:forEach varStatus="vs" var="entry"
									items="${ShoppingCart.content}">

									<TR height='16'>
										<TD
											style="text-align: center; font-size: 11pt; background: azure;">${entry.value.title}</TD>
										<%--  <TD style="text-align:center;font-size: 11pt;">
          	${fn:substring(entry.value.author, 0, 3)}
          </TD> --%>
										<TD
											style="text-align: center; font-size: 11pt; background: azure;">
											${fn:substring(entry.value.companyName, 0, 10)}</TD>
										<TD
											style="text-align: center; font-size: 11pt; background: azure;">
											${entry.value.quantity}</TD>
										<TD
											style="text-align: center; font-size: 11pt; background: azure;">
											<!--        entry.value.discount 暫為1 --> <fmt:formatNumber
												value="${entry.value.unitPrice * 1 }" pattern="#,###" />元
										</TD>
										<TD
											style="text-align: center; font-size: 11pt; background: azure;">
											<!--        entry.value.discount 暫為1 --> <fmt:formatNumber
												value="${entry.value.unitPrice * entry.value.quantity}"
												pattern="#,###,###" />元
										</TD>
									</TR>
								</c:forEach>

								<TR height='30'>
									<TD
										style="text-align: right; font-size: 11pt; background: azure;"
										colspan='3'>&nbsp;</TD>
									<TD
										style="text-align: center; font-size: 11pt; background: azure;">總計金額</TD>
									<TD
										style="text-align: center; font-size: 11pt; background: azure;"><fmt:formatNumber
											value="${ShoppingCart.subtotal}" pattern="#,###,###" />元</TD>

								</TR>
								<%--  <TR>
          <TD colspan='5' style="text-align:right;font-size: 11pt;" >營業稅：</TD>
          <c:set var="VAT" value="${ShoppingCart.subtotal*0.05 + 0.0001}"/>
          <TD style="text-align:right;font-size: 11pt;" > 
          <fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</TD>
        </TR>
        <TR> --%>
								<%--        <TD colspan='5' style="text-align:right;font-size: 11pt;" >總計金額：</TD>
          <TD style="text-align:right;font-size: 11pt;color:#AA0200;" >
          <fmt:formatNumber value="${ShoppingCart.subtotal + VAT }" pattern="#,###,###" />元</TD>
        </TR> --%>
							</TABLE>
						</TD>
					</TR>

				</TABLE>
				<P />
				<input type="hidden" name="finalDecision" value=""> <input
					style="font-size: 22px; padding: 5px 10px; font-weight: bold; border-radius: 10px; background: #e266ab; color: white;"
					type="button" name="OrderBtn" value="確定送出"
					onclick="reconfirmOrder()"> <input
					style="font-size: 22px; padding: 5px 10px; font-weight: bold; border-radius: 10px; background: #e266ab; color: white;"
					type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
			</FORM>
		</div>
</body>
</html>