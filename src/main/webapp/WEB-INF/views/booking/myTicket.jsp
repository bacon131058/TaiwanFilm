<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/movie.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/menuStyle.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico" />
<title>Taiwam Films - 查看訂票</title>
<style>
body {
	background: #f1f1f1;
}

#category {
	background-image: url(img/wall1.jpeg);
}

fieldset {
	background: white;
	margin-bottom: 70px;
}
</style>
</head>
<body>
	<jsp:include page="../fragment/menu.jsp" />

	<div class="section" id="popular">
		<div class="section" id="category">
			<div class="width-limit">
				<h1 style="font-family: Microsoft JhengHei;">查看訂票</h1>
			</div>

			<section class="container">
				<c:forEach var='ticket' items='${tickets }'>
					<fieldset class='form-horizontal'>
						<div class="form-group">
							<h4>
								<label class="control-label col-lg-2">電影名稱 </label>
							</h4>
							<h4>
								<label class="control-label col-lg-2" style="width: 17%;">放映資訊
								</label>
							</h4>
							<h4>
								<label class="control-label col-lg-2" style="width: 13%;">戲院</label>
							</h4>
							<h4>
								<label class="control-label col-lg-2 col-lg-2"
									style="width: 30%;">座位</label>
							</h4>
							<h4>
								<label class="control-label col-lg-2" style="width: 10%;">狀態</label>
							</h4>
							<h4>
								<label class="control-label col-lg-2" style="width: 10%;">編輯</label>
							</h4>
						</div>

						<div class="form-group">
							<label class="control-label col-lg-2 col-lg-2">
								${ticket.sessionBean.movieBean.movieName}<br>${ticket.sessionBean.movieBean.englishName}
							</label> <label class="control-label col-lg-2 col-lg-2"
								style="width: 17%;"> ${ticket.sessionBean.sessionDate.substring(0, 4) }/
								${ticket.sessionBean.sessionDate.substring(4, 6) }/
								${ticket.sessionBean.sessionDate.substring(6, 8) }&emsp;${ticket.sessionBean.sessionTime } </label>
							<label class="control-label col-lg-2 col-lg-2"
								style="width: 13%;"> ${ticket.sessionBean.cinemaBean.cinemaName} </label> <label
								class="control-label col-lg-2 col-lg-2" style="width: 30%;">
								${ticket.seat} </label> <label
								class="control-label col-lg-2 col-lg-2 status"
								style="width: 10%;"> ${ticket.status} </label>
							<div align="center" class="deleteBtn">
								<a
									href="<spring:url value='/deleteTicket?ticketid=${ticket.ticketId}' />"
									class="btn btn-primary">取消</a>
							</div>
						</div>
						<br>
					</fieldset>
				</c:forEach>
			</section>
		</div>
	</div>

	<jsp:include page="../fragment/bottom.jsp" />
</body>
<script>
	$(".deleteBtn a").click(function() {
		if (!confirm("確定要刪除嗎?")) {
			return false;
		}
	});

	$(".status").css("color", "red");

	$(".status").css("color", function() {
		if ($(this).text().indexOf("已付款") != -1) {
			return "green";
		}
	})
</script>
</html>