<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean id="today" class="java.util.Date" scope="session" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/favicon.ico" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css">
<title>TaiwanFilms</title>
<style>
.productContent {
	padding: 30px 150px 50px 150px;
}

.productOrder {
	width: 80%;
	border: solid;
	padding: 20px;
	margin: 20px 0px 50px 0px;
}

body {
	background-image: url(img/wall1.jpeg);
}

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

.process3 {
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
</head>
<body>

	<jsp:include page="../fragment/menu.jsp" />


	<div class="ball-area" style="padding-left: 150px; padding-top: 85px;">
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


	<div class="productContent">
		<!-- 訂購成功提示訊息 -->
		<div style="padding-left: 100px;">

			<h3>訂購成功！</h3>

<!-- 					<p> -->
<%-- 				請於 <span style="color: red">${{OrderBean.orderDate.substring(4, 6)}</span> 前完成付款。 --%>
<!-- 			</p>  -->
				<p>請於 7 內完成付款。</p>
		</div>

		<!--行程0訂單-->
		<div>
			<div style="padding-left: 100px;">
				訂票代碼為&ensp;
				<div style="display: inline-block; color: red;">AFEGB10${OrderBean.orderNo}</div>。
			</div>
			<div>
				<!-- 訂票人&ensp;<span style="font-size: 24px">${member.memberName }</span> -->
			</div>


			<br>
			<br>
			<!-- 資訊表格 -->

			<TABLE
				style="margin-left: auto; margin-right: auto; border: 0.5px solid #d1d1d1; border-collapse: collapse;">
				<tr id='borderA' height='50'>
					<th id='borderA' align="center" colspan="7"
						style="background: cadetblue;"><h3>訂單明細</h3></th>
				</tr>
				<tr id='borderA' height='36'>
					<td colspan="7" style="background: #d9dde0;">
						<table>
							<tr id='borderA'>
								<td align="Left" width="350px"><b>出貨地址：</b>${OrderBean.shippingAddress}
								</td>
								<td align="center" width="300px"><b>訂購日期：</b>${OrderBean.orderDate}
								</td>
								<td align="center" width="280px"><b>訂單編號：</b>${OrderBean.orderNo}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id='borderA' height='36'>
					<th id='borderA' width="100px" align="center"
						style="background: burlywood;">商品編號</th>
					<th id='borderA' width="400px" align="center"
						style="background: burlywood;">品名</th>
					<th id='borderA' width="70px" align="center"
						style="background: burlywood;">單價</th>
					<th id='borderA' width="50px" align="center"
						style="background: burlywood;">數量</th>
					<th id='borderA' width="100px" align="center"
						style="background: burlywood;">總價</th>
					<!-- <th id='borderA' width="80px" align="center">折扣</th> -->
					<th id='borderA' width="100px" align="center"
						style="background: burlywood;">售價</th>
				</tr>
				<c:set var="subtotal" value="0" />
				<c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
					<c:choose>
						<c:when test="${ stat.count % 2 == 0 }">
							<c:set var="aColor" value="#E6FFA0" />
						</c:when>
						<c:otherwise>
							<c:set var="aColor" value="#EBFFEB" />
						</c:otherwise>
					</c:choose>
					<tr id='borderA' bgColor="${aColor}" height='30'>
						<td id='borderA' align="center" style="background: #d9dde0;">${aBean.bookId}</td>
						<td id='borderA' align="center" style="background: #d9dde0;">${aBean.title}</td>
						<td id='borderA' align="center" style="background: #d9dde0;">${aBean.unitPrice}&nbsp;</td>
						<td id='borderA' align="center" style="background: #d9dde0;">${aBean.quantity}&nbsp;</td>
						<td id='borderA' align="center" style="background: #d9dde0;">${aBean.unitPrice*aBean.quantity}&nbsp;</td>
						<%-- <td id='borderA' align="center">${aBean.discount}&nbsp;</td> --%>
						<td id='borderA' align="center" style="background: #d9dde0;"><fmt:formatNumber
								value="${aBean.unitPrice*aBean.quantity}" pattern="#,###,###" />元</td>
						<c:set var="subtotal"
							value="${ subtotal + aBean.unitPrice *  aBean.quantity }" />
					</tr>
				</c:forEach>
				<tr height='30'>
					<TD id='borderA' align="center" rowspan="3" colspan="4"
						style="background: #d9dde0;">&nbsp;</TD>
					<TD id='borderA' width="60px" align="center"
						style="background: burlywood;"><b>總金額</b></TD>
					<TD id='borderA' width="100px" align="center"
						style="background: burlywood;"><fmt:formatNumber
							value="${subtotal}" pattern="#,###,###" />元</TD>
				</tr>

			</TABLE>




			<br> <br> <br> <br>

			<div class="mart">
				<p>
					<strong>支援以下超商付款:</strong>
				</p>
				<img
					src="${pageContext.request.contextPath }/img/supermark/ipon.png"
					alt="7-11 ibon" title="7-11 ibon"> <img
					src="${pageContext.request.contextPath }/img/supermark/familymart.png"
					alt="全家 FamiPort" title="全家 FamiPort"> <img
					src="${pageContext.request.contextPath }/img/supermark/ok.png"
					alt="OK OK-go" title="OK OK-go"> <img
					src="${pageContext.request.contextPath }/img/supermark/life.png"
					alt="萊爾富 Life-ET" title="萊爾富 Life-ET">
			</div>
		</div>

		<br> <br> <br> <br>

		
</body>
<script>
	var num = $
	{
		Order.orderNo
	};
	for (var len = (num + "").length; len < 7; len = num.length) {
		num = "0" + num;
	}
	$("#ticketId").text(num);
</script>
</html>