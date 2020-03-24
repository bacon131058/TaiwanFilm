<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<title>Taiwam Films - 電影選擇</title>
<style>
.change-menu div {
	cursor: pointer;
}

.list ul li figure img {
	width: 300px;
	height: 420px;
}

/* .hotBox figure { */
/* 	display: inline-block; */
/* } */

/* .hotInfo { */
/* 	width: 60%; */
/* 	display: inline-block; */
/* } */

/* .hotInfo p { */
/* 	font-family: Microsoft JhengHei; */
/* } */
/* .list ul li:first-child { */
/* 	list-style-type: none; */
/* 	text-align: center; */
/* 	border-bottom: solid; */
/* 	margin-bottom: 100px; */
/* 	font-size: 30px; */
/* } */

/* .list ul li:first-child figure { */
/* 	display: inline-block; */
/* } */

/* .list ul li:first-child section { */
/* 	display: inline-block; */
/* 	vertical-align: top; */
/* 	padding: 150px; */
/* } */

/* .list ul li:not(:first-child) { */
.list {
	padding: 0 100px 0 100px;
}

.list ul {
	text-align: left;
}

.list ul li {
	list-style-type: none;
	display: inline-block;
	width: 30%;
	vertical-align: top;
	text-align: center;
}

.hotA:link {
	color: black;
}

.hotA:visited {
	color: black;
}

.hotA:hover {
	color: #4169E1;
}

.ename {
	word-wrap: break-word;
}

#category{
	background-image: url(img/wall1.jpeg);
}  
</style>
</head>
<body>
	<jsp:include page="../fragment/menu.jsp" />


	<div class="section" id="popular">
		<div class="section" id="category">
			<div class="width-limit">
				<h1 style="font-family: Microsoft JhengHei;">電影選擇</h1>
				<div class="change-category">
					<div class="change-menu">
						<div class="buttonBorder-active buttonBorder" id="trend-button">現正熱映</div>
						<div class="buttonBorder" id="end-button">近期下映</div>
					</div>
				</div>
			</div>
			<!-- 	<section class="hotArea"> -->
			<!-- 		<div class="hotBox"> -->
			<!-- 			<figure> -->
			<!-- 				<a href="movieDetail"><img -->
			<!-- 					src="/movieTwProj/img/booking/9thPrecinct.jpg" alt="第九分局" -->
			<!-- 					title="第九分局"></a> -->
			<!-- 			</figure> -->
			<!-- 			<section class="hotInfo"> -->
			<!-- 				<div class="rankArea"> -->
			<!-- 					<h4 class="rank">NO.1</h4> -->
			<!-- 				</div> -->
			<!-- 				<div class="info"> -->
			<!-- 					<h1 style="font-size: 2em"> -->
			<!-- 						<a class="hotA" href="movieDetail.jsp">第九分局</a> -->
			<!-- 					</h1> -->
			<!-- 					<h2>The 9th Precinct</h2> -->
			<!-- 				</div> -->
			<!-- 			</section> -->
			<!-- 		</div> -->
			<!-- 	</section> -->
			<!-- 	<hr> -->
			<div class="list">
				<ul class="hotList">
					<c:set var="count" value="1" scope="page" />
					<c:forEach var='movie' items='${movies }'>
						<li>
							<figure>
								<a
									href="<spring:url value='/movieDetail?id=${movie.movieId}' />"><img
									src="<c:url value='/getPicture/movieBean/${movie.movieId }' />"
									alt="${movie.movieName }" title="${movie.movieName }"></a>
							</figure>
							<section class="infoArea">
								<h2>
									<a class="hotA"
										href="<spring:url value='/movieDetail?id=${movie.movieId}' />">${movie.movieName}</a>
								</h2>
								<h3 class="ename">${movie.englishName}</h3>
								<div class="rankArea">
									<h4 class="rank">
										NO.
										<c:out value="${count}" />
									</h4>
								</div>
							</section>
						</li>
						<c:set var="count" value="${count + 1}" scope="page" />
					</c:forEach>
					<!-- 		<li> -->
					<!-- 			<figure> -->
					<!-- 				<a href="detail.aspx?id=4154"><img -->
					<!-- 					src="/movieTwProj/img/booking/Detention.jpg" alt="返校" title="返校"></a> -->
					<!-- 			</figure> -->
					<!-- 			<section class="infoArea"> -->
					<!-- 				<h2> -->
					<!-- 					<a class="hotA" href="detail.aspx?id=4154">返校</a> -->
					<!-- 				</h2> -->
					<!-- 				<h3>Detention</h3> -->
					<!-- 				<div class="rankArea"> -->
					<!-- 					<h4 class="rank">NO.3</h4> -->
					<!-- 					<p> -->
					<!-- 						排名變動<span class="icon-caret-down"></span> -->
					<!-- 					</p> -->
					<!-- 					<p> -->
					<!-- 						進榜週數<span class="rise">3</span> -->
					<!-- 					</p> -->
					<!-- 				</div> -->
					<!-- 			</section> -->
					<!-- 		</li> -->
					<!-- 		<li> -->
					<!-- 			<figure> -->
					<!-- 				<a href="detail.aspx?id=4154"><img -->
					<!-- 					src="/movieTwProj/img/booking/Gangs.jpg" alt="江湖無難事" title="江湖無難事"></a> -->
					<!-- 			</figure> -->
					<!-- 			<section class="infoArea"> -->
					<!-- 				<h2> -->
					<!-- 					<a class="hotA" href="detail.aspx?id=4154">江湖無難事</a> -->
					<!-- 				</h2> -->
					<!-- 				<h3>The Gangs,the Oscars,and the Walking Dead</h3> -->
					<!-- 				<div class="rankArea"> -->
					<!-- 					<h4 class="rank">NO.4</h4> -->
					<!-- 					<p> -->
					<!-- 						排名變動<span class="icon-caret-down"></span> -->
					<!-- 					</p> -->
					<!-- 					<p> -->
					<!-- 						進榜週數<span class="rise">7</span> -->
					<!-- 					</p> -->
					<!-- 				</div> -->
					<!-- 			</section> -->
					<!-- 		</li> -->
					<!-- 		<li> -->
					<!-- 			<figure> -->
					<!-- 				<a href="detail.aspx?id=4154"><img -->
					<!-- 					src="/movieTwProj/img/booking/Fools.jpg" alt="傻傻愛你，傻傻愛我" -->
					<!-- 					title="傻傻愛你，傻傻愛我"></a> -->
					<!-- 			</figure> -->
					<!-- 			<section class="infoArea"> -->
					<!-- 				<h2> -->
					<!-- 					<a class="hotA" href="detail.aspx?id=4154">傻傻愛你，傻傻愛我</a> -->
					<!-- 				</h2> -->
					<!-- 				<h3>A fool in love, love like a fool</h3> -->
					<!-- 				<div class="rankArea"> -->
					<!-- 					<h4 class="rank">NO.5</h4> -->
					<!-- 					<p> -->
					<!-- 						排名變動<span class="icon-caret-down"></span> -->
					<!-- 					</p> -->
					<!-- 					<p> -->
					<!-- 						進榜週數<span class="rise">1</span> -->
					<!-- 					</p> -->
					<!-- 				</div> -->
					<!-- 			</section> -->
					<!-- 		</li> -->
				</ul>
				<ul class="downList">
					<c:forEach var='movie' items='${downmovies }'>
						<li>
							<figure>
								<a
									href="<spring:url value='/movieDetail?id=${movie.movieId}' />"><img
									src="<c:url value='/getPicture/movieBean/${movie.movieId }' />"
									alt="${movie.movieName }" title="${movie.movieName }"></a>
							</figure>
							<section class="infoArea">
								<h2>
									<a class="hotA"
										href="<spring:url value='/movieDetail?id=${movie.movieId}' />">${movie.movieName}</a>
								</h2>
								<h3 class="ename">${movie.englishName}</h3>
								<div class="rankArea">
									<h4 class="rank">${movie.releaseDate.substring(0, 4) }/
										${movie.releaseDate.substring(5, 7) }/
										${movie.releaseDate.substring(8, 10) }&ensp;~&ensp;2020/0${movie.releaseDate.substring(5, 7) - 6 }/
										${movie.releaseDate.substring(8, 10) }</h4>
								</div>
							</section>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<jsp:include page="../fragment/bottom.jsp" />
</body>
<script>
	$('.downList').hide();
	$('.hotList').show();

	$('#trend-button').click(function() {
		$('.downList').hide();
		$('.hotList').show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#trend-button').addClass("buttonBorder-active");
	});
	$('#end-button').click(function() {
		$('.hotList').hide();
		$('.downList').show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#end-button').addClass("buttonBorder-active");
	});
</script>
</html>