<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>TaiwanFilms</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css"
	integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1"
	crossorigin="anonymous"></link>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />
<title>allactivity</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css"
	type="text/css">

<style>
body {
	background: #f1f1f1;
}
/* 移動到時的特效  */
.activity-inner{
	padding: 10px;
	vertical-align: top;
	width: 350px;
	display: inline-block;
	margin: 10px;
	text-align: center;
	background: white;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	border-radius: 10px;
}
      
.activity-inner:hover { 
	-webkit-filter:contrast(1.5);
	transform: translateY(-10px);
	box-shadow: 0 15px 25px rgba(0, 0, 0, 0.15);
}

.showall:hover {
	text-decoration: none;
}
/* 活動單頁面的文字效果 */
.activity-title {
	font-weight: bold;
	font-size: 18px;
	color: black;
}

.activity-author {
	font-weight: lighter;
	font-size: 13px;
	color: black;
}

.activity-content {
	padding: 5px;
	height: 150px;
	overflow: hidden;
	text-align: left;
}

.activity-maincontent {
	font-weight: 450;
	font-size: 14px;
	color: black;
}

.activity-Watched {
	color: black;
}

.thumbnail .caption {
	height: 200px;
}

.activity-inner {
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	vertical-align: top;
	width: 350px;
	display: inline-block;
	margin: 10px;
	padding: 10px;
}

.activityThumb {
	text-align: center;
	background-size: 100%;
	background-position: center;
	background-repeat: no-repeat;
	height: 250px;
	background-size: cover;
}

.activity-comingsoon {
	color: white;
	font-weight: bold;
	background: red;
	display: inline-block;
	padding: 3px;
}
</style>

</head>
<body>

	<jsp:include page="../fragment/menu.jsp" />

	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1 id="gginin">全部活動內容</h1>
			</div>
		</div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="category-content">
			<c:forEach var='activity' items='${activities}'>
				<c:if test="${activity.category == '1'}">
					<a
						href="<spring:url value='/activity?id=${activity.activityId}' />"
						class="anchor-style"> <a
						href="<spring:url value='/queryMyActivity/${activity.activityId}' />">
							<div class="activity-inner" data-number="${activity.activityWatched}">
								<div class="activityThumb"
									style="background-image: url('getPicture/${activity.activityId}');background-size:cover	">
								</div>
								<div class="activity-content">
									<p class="activity-title">${activity.activityTitle}</p>
									<%-- <p class="activity-author">${activity.activityAuthor}</p> --%>
									<p class="activity-maincontent">${activity.activityMainContent}</p>
									<p class="activity-Watched">
										<i class="fas fa-eye"></i>${activity.activityWatched}</p>
								</div>
								<div class="downMeta"></div>
							</div>
					</a>
					</a>
				</c:if>
			</c:forEach>

			<c:forEach var='activity' items='${activities}'>
				<c:if test="${activity.category == '3'}">
					<a
						href="<spring:url value='/activity?id=${activity.activityId}' />"
						class="anchor-style"> <a
						href="<spring:url value='/queryMyActivity/${activity.activityId}' />">
							<div class="activity-inner" data-number="${activity.activityWatched}">
								<div class="activityThumb"
									style="background-image: url('getPicture/${activity.activityId}');background-size:cover	">
								</div>
								<div class="activity-content">
									<div class="activity-comingsoon">即將開始</div>
									<p class="activity-title">${activity.activityTitle}</p>
									<%-- <p class="activity-author">${activity.activityAuthor}</p> --%>
									<p class="activity-maincontent">${activity.activityMainContent}</p>
									<p class="activity-Watched">
										<i class="fas fa-eye"></i>${activity.activityWatched}</p>
								</div>
								<div class="downMeta"></div>
							</div>
					</a>
					</a>
				</c:if>
			</c:forEach>
		</div>
	</section>


	<jsp:include page="../fragment/footer.jsp" /> 




</body>
</html>
