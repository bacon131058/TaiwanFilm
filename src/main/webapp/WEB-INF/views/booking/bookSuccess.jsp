<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/movie.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/menuStyle.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico" />
<title>Taiwam Films - 訂票成功</title>
<style>
.ticketContent {
	padding: 125px 150px 50px 150px;
}

.ticketOrder {
	width: 80%;
	border: solid;
	padding: 20px;
	margin: 20px 0px 50px 0px;
}

body{
	background-image: url(img/wall1.jpeg);
}  
</style>
</head>
<body>

	<jsp:include page="../fragment/menu.jsp" />

	<div class="ticketContent">
		<!-- 訂位成功提示訊息 -->
		<div>

			<h3>訂票成功！</h3>

			<p>
				請於 <span style="color: red">${ticket.sessionBean.sessionDate.substring(4, 6) }/
					${ticket.sessionBean.sessionDate.substring(6, 8) }&ensp;${ticket.sessionBean.sessionTime.substring(0, 2) - 1 }:${ticket.sessionBean.sessionTime.substring(3, 5) }
					(${ticket.sessionBean.sessionDay })</span> 前完成付款。
			</p>
		</div>

		<!--行程0訂單-->
		<div>
			<div>
				訂票代碼&ensp;<span id="ticketId" style="font-size: 24px">${ticket.ticketId }</span>
			</div>
			<div>
				<!-- 訂票人&ensp;<span style="font-size: 24px">${member.memberName }</span> -->
			</div>
			<!-- 列車資訊表格 -->
			<table class="ticketOrder">
				<tr>
					<th width="25%">電影</th>
					<th width="25%">放映資訊</th>
					<th width="15%">戲院</th>
					<th width="25%">座位</th>
					<th width="10%">狀態</th>
				</tr>
				<tr>
					<td>${ticket.sessionBean.movieBean.movieName }<br>${ticket.sessionBean.movieBean.englishName }</td>
					<td align="center">${ticket.sessionBean.sessionDate.substring(0, 4) }/
						${ticket.sessionBean.sessionDate.substring(4, 6) }/
						${ticket.sessionBean.sessionDate.substring(6, 8) }&emsp;${ticket.sessionBean.sessionTime }</td>
					<td align="center">${ticket.sessionBean.cinemaBean.cinemaName }</td>
					<td align="center">${ticket.seat }</td>
					<td align="center"><span style="color: red">${ticket.status }</span></td>
				</tr>
			</table>
		</div>

		<div class="mart">
			<p>
				<strong>支援以下超商付款:</strong>
			</p>
			<img src="${pageContext.request.contextPath }/img/supermark/ipon.png"
				alt="7-11 ibon" title="7-11 ibon"> <img
				src="${pageContext.request.contextPath }/img/supermark/familymart.png"
				alt="全家 FamiPort" title="全家 FamiPort"> <img
				src="${pageContext.request.contextPath }/img/supermark/ok.png"
				alt="OK OK-go" title="OK OK-go"> <img
				src="${pageContext.request.contextPath }/img/supermark/life.png"
				alt="萊爾富 Life-ET" title="萊爾富 Life-ET">
		</div>
	</div>

	<jsp:include page="../fragment/bottom.jsp" />
</body>
<script>
	var num = ${ticket.ticketId	};
	for (var len = (num + "").length; len < 7; len = num.length) {
		num = "0" + num;
	}
	$("#ticketId").text(num);
</script>
</html>