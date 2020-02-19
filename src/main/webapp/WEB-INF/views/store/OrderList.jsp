<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<title>訂單列表</title>
<style type="text/css">
#borderA {
	border: 1px solid #5fbf78;
}

body {
	/* background-color: white; */
	/* background-image: url(img/wall1.jpeg); */
	
}

fieldset {
	background: white;
	margin-bottom: 70px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body style="background-color: #f9f9f9;">
	<!-- 引入共同的頁首 -->
	<jsp:include page="../fragment/menu.jsp" />

	<c:set var="funcName" value="ORD" scope="session" />


	<div class="width-limit">
		<h1
			style="font-family: Microsoft JhengHei; margin-left: 300px; padding-top: 67px;">購物訂單</h1>
	</div>
	<hr
		style="margin-top: -20px; margin-right: 295px; margin-left: 297px; margin-bottom: 20px;">
	<table
		style="margin-left: auto; margin-right: auto; width: 810; border-collapse: collapse;">

		<%-- 	<tr id='borderA' height='50'>
			<th id='borderA' colspan="4" align="center">${members.memberName}的訂購紀錄</th>
		</tr> --%>
		<tr id='borderA' height='60'>
			<th id='borderA' style="background: cadetblue;">訂單編號</th>
			<th id='borderA' style="background: cadetblue;">訂購日期</th>
			<th id='borderA' style="background: cadetblue;">總金額</th>
			<th id='borderA' style="background: cadetblue;">送貨地址</th>
		</tr>
		<c:forEach var="anOrderBean" varStatus="stat" items="${memberOrders}">
			<TR id='borderA' style="height: 50">
				<TD id='borderA' height="40" width="90" align="center"><a
					href='<c:url value='orderDetail.do?memberId=${members.memberId}&orderNo=${anOrderBean.orderNo}' />'>
						A000${anOrderBean.orderNo} </a></TD>
				<TD id='borderA' height="40" width="250" align="center">${anOrderBean.orderDate}</TD>
				<TD id='borderA' height="40" width="100" align="center">${anOrderBean.totalAmount}</TD>
				<TD id='borderA' height="40" width="400" align="center">&nbsp;${anOrderBean.shippingAddress}</TD>

			</TR>
		</c:forEach>
		<tr height='36' id='borderA' style="background: #76d293;">
			<td id='borderA' align="center" colspan="4" ><a style="text-decoration:blink;"
				href="<c:url value='products' />">再去逛逛</a></td>
		</tr>
	</TABLE>
	</center>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<jsp:include page="../fragment/bottom.jsp" />

</body>
</html>