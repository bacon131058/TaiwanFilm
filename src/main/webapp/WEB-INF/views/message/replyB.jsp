<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>   
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />
<title>TaiwanFilms</title>

<style>
body {
	background: white;
}

.activity-content {
	width: 100%;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
	font-weight: bold;
	background: white;
	display: inline-block;
	height: 100px;
}

.activity-content-show {
	width: 100%;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
	font-weight: bold;
	display: inline-block;
}

.allActivityM-width {
	width: 25%;
	height: 200px;
	display: inline-block;
}

.acitivityUpdateWidth {
	width: 21%;
	padding: 20px;
	display: inline-block;
	vertical-align: top;
	text-align: center;
	color: black;
}

.activityUpdateButton {
	width: 17%;
	display: inline-block;
	margin-top: 12px;
	text-align: center;
	vertical-align: top;
	padding-top: 5px;
}

.activityUpdateButtonStyle {
	width: 50%;
	display:inline-block;
	color: white;
	background-color: red;
	padding: 3px;
	border-radius: 3px
}
</style>
</head>
<body>
	<jsp:include page="../backstage.jsp" />

	<section class="container"
		style="position: absolute; left: 17%; width: 80%; padding-top: 100px">
		<div class="category-content">
			<h1 style="text-align: center; margin: 0">檢舉留言(員工後台)</h1>
			<a href="activitiesM">
				<div
					style="position: relative; width: 100%; font-weight: bold; color: black; display: inline-block; text-align: right">回到分類頁面</div>
			</a>
			<div class="activity-content-show">
				<div class="acitivityUpdateWidth">留言人</div>
				<div class="acitivityUpdateWidth">留言內容</div>
				<div class="acitivityUpdateWidth">留言時間</div>
					<div class="activityUpdateButton">
						<div class="activityUpdateButtonStyle">復原</div>
					</div>
				<div class="activityUpdateButton">
					<div class="activityUpdateButtonStyle">刪除</div>
				</div>
			</div>
			<c:forEach var='reply' items='${replys}'>
				<c:if test="${reply.replyReport == '2'}">
					<div class="activity-inner" data-number="${reply.replyId}">
						<div class="activity-content">
							<div class="activityThumb"
								style="background-image: url('getPicture/${activity.activityId}');background-size:cover;height: 80px;width:20%;display: inline-block;	text-align: center;    padding-top: 23px;font-size: 18px;">
								${reply.membersBean.memberName }</div>
							<div class="acitivityUpdateWidth" style="font-size: 15px;">${reply.replyContent}</div>
							<div class="acitivityUpdateWidth">${reply.replyDate}</div>
							<div class="activityUpdateButton">
								<form method="GET"
									action="${pageContext.request.contextPath}/resetReplyB">
									<input type="hidden" name="replyId" value="${reply.replyId }">
									<button type="submit" onclick="reset()"
										style="background: #428bca; background-image: none; color: white; padding: 5px 10px; font-weight: bold;">復原</button>
								</form>
							</div>
							<div class="activityUpdateButton">
								<form method="GET"
									action="${pageContext.request.contextPath}/deleteReplyB">
									<input type="hidden" name="replyId" value="${reply.replyId }">
									<button type="submit" onclick="del()"
										style="background: #428bca; background-image: none; color: white; padding: 5px 10px; font-weight: bold;">刪除</button>
								</form>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>




</body>
</html>
