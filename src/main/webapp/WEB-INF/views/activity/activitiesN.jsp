<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous"></link> 

<title>TaiwanFilms</title>
<!-- <link rel='stylesheet' -->
<%-- 	href='${pageContext.request.contextPath}/css/styles.css' --%> 
<!-- 	type="text/css" /> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css"
	type="text/css">
<style>
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
	transform: translateY(-10px);
	box-shadow: 0 15px 25px rgba(0, 0, 0, 0.15);
}

.activityThumb {
	text-align: center;
	background-size: 100%;
	background-position: center;
	background-repeat: no-repeat;
	height: 250px;
	background-size:cover;
	
}

.activity-content {
	padding: 5px;
	height: 150px;
	overflow: hidden;
	text-align: left;
	color: black;

}

.activity-title {
	font-weight: bold;
	font-size: 18px;
}

.activity-author {
	font-weight: lighter;
	font-size: 13px;
}

.activity-maincontent {
	font-weight: 450;
	font-size: 14px;
}

.anchor-style {
	text-decoration: none;
	color: black;
}

.activityContent a:hover {
	color: black;
}

.container h2 {
	font-size: 40px;
	font-weight: bold;
	text-align: center
}

.row img {
	width: 100%;
	height: 100%
}



.showall:hover{
	text-decoration: none;
}

.activityContent{ 
	height: 450px;
	overflow:hidden;
	display: none;
	}
.activity-SignUpActivity{
	width: 30%;
	display: inline-block;
	color: white;
	background: blue;
}
</style>



</head>
<body>
	<jsp:include page="../fragment/menu.jsp" />






	<div class="section" id="popular">
		<div class="section" id="category">
			<div class="width-limit">
				<h1>活動清單</h1>
				<div class="change-category">
					<div class="change-menu">
						<div class="buttonBorder-active buttonBorder" id="new-button">最新發起</div>
						<div class="buttonBorder" id="trend-button">趨勢話題</div>
						<div class="buttonBorder" id="coming-button">即將開始</div>
						<div class="buttonBorder" id="end-button">即將結束</div>
						<a href="allActivity">
							<div style="float: right;width: 10%;color: black; font-weight: bold;">瀏覽全部活動</div>
						</a>
					</div>
				</div>
			</div>
		



			<div class="activityContent active" id="new">
				<c:forEach var='activity' items='${activityList}'>
					<c:if test="${activity.category == '1'}">
						<a href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style">
								<a href="<spring:url value='/queryMyActivity/${activity.activityId}' />"> 
								<div class="activity-inner" id="${activity.activityId}" data-number="${activity.activityWatched}">		
									<div class="activityThumb"
										style="background-image: url('getPicture/${activity.activityId}');	">
									</div>				 
									<div class="activity-content"> 
										<p id="today"></p>
										<p class="activity-title"> ${activity.activityTitle}</p>
										<%-- <p class="activity-author">${activity.activityAuthor}</p> --%>
										<p class="activity-maincontent">${activity.activityMainContent}</p>
										<p class="getvalue"><i class="fas fa-eye"></i>${activity.activityWatched}</p>										
									</div> 
									<a href="<spring:url value='/SignUpActivity/${activity.activityId}' />"
								class="btn btn-primary"> <span
								class="glyphicon-info-sigh glyphicon"></span>報名活動
								</a>   
								</div>
							</a> 
						</a>
					</c:if>
				</c:forEach>
			</div>

			<div class="activityContent" id="trend">
				<c:forEach var='activity' items='${activitiesViews}'>
						<a href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style">
							 <a href="<spring:url value='/queryMyActivity/${activity.activityId}' />">  
							<div class="activity-inner" data-number="${activity.activityWatched}">
								<div class="activityThumb" style="background-image: url('getPicture/${activity.activityId}');background-size:cover	">
								</div>
								<div class="activity-content">
									<p class="activity-title">${activity.activityTitle}</p>
									<%-- <p class="activity-author">${activity.activityAuthor}</p> --%>
									<p class="activity-maincontent">${activity.activityMainContent}</p>
									<p class="getvalue"><i class="fas fa-eye"></i>${activity.activityWatched}</p>							
								</div>
								<a href="<spring:url value='/SignUpActivity/${activity.activityId}' />"
								class="btn btn-primary"> <span
								class="glyphicon-info-sigh glyphicon"></span>報名活動
								</a>   
							</div>
						</a>
					</a>
				</c:forEach> 
			</div>

			<div class="activityContent" id="coming">
				<c:forEach var='activity' items='${activitiesStart}'>
					<c:if test="${activity.category == '3'}">
						<a href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style">
							<div class="activity-inner" data-number="${activity.activityWatched}">
								<div class="activityThumb"
									style="background-image: url('getPicture/${activity.activityId}');	">
								</div>
								<div class="activity-content">
									<p class="activity-title">${activity.activityTitle}</p>
								<%-- 	<p class="activity-author">${activity.activityAuthor}</p> --%>
									<p class="activity-maincontent">${activity.activityMainContent}</p>
									
									<i class="fas fa-eye"></i>${activity.activityWatched}</p>
								</div>

								
								<a href="<spring:url value='/SignUpActivity/${activity.activityId}' />"
								class="btn btn-primary"> <span
								class="glyphicon-info-sigh glyphicon"></span>報名活動
								</a>   
							</div>
						</a> 
					</c:if>
				</c:forEach>
			</div>



 
 			<div class="activityContent" id="end">
				<c:forEach var='activity' items='${activitiesEnd}'>
					<c:if test="${activity.category == '1'}">
						<a
							href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style">
							<div class="activity-inner">
								<div class="activityThumb" style="background-image: url('getPicture/${activity.activityId}');">
								</div>
								<div class="activity-content">
									<p class="activity-title">${activity.activityTitle}</p>
									<%-- <p class="activity-author">${activity.activityAuthor}</p> --%>
									<p class="activity-maincontent">活動內容:
										${activity.activityMainContent}</p>
									
									 <i class="fas fa-eye"></i>${activity.activityWatched}</p>
								</div>
								<a href="<spring:url value='/SignUpActivity/${activity.activityId}' />"
								class="btn btn-primary"> <span
								class="glyphicon-info-sigh glyphicon"></span>報名活動
								</a>   
							</div>
						</a>
					</c:if>
				</c:forEach>
			</div>  





			<script>
				$('#new-button').click(function() {
					$('.activityContent').removeClass("active active-bottom");
					$('#new').addClass("active");

					$('.buttonBorder').removeClass("buttonBorder-active");
					$('#new-button').addClass("buttonBorder-active");

				});
				$('#trend-button').click(function() {
					$('.activityContent').removeClass("active active-bottom");
					$('#trend').addClass("active");
					$('.buttonBorder').removeClass("buttonBorder-active");
					$('#trend-button').addClass("buttonBorder-active");
				}); 
				$('#coming-button').click(function() {
					$('.activityContent').removeClass("active active-bottom");
					$('#coming').addClass("active");
					$('.buttonBorder').removeClass("buttonBorder-active");
					$('#coming-button').addClass("buttonBorder-active");
				});
				$('#end-button').click(function() {
					$('.activityContent').removeClass("active active-bottom");
					$('#end').addClass("active");
					$('.buttonBorder').removeClass("buttonBorder-active");
					$('#end-button').addClass("buttonBorder-active");
				});
				
				
				

			</script>
</body>
</html>
