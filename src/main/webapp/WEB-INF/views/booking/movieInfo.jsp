<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/movie.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/menuStyle.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico" />
<title>Taiwam Films - ${movie.movieName }</title>
<style>
.movieImage img {
	width: 300px;
	height: 420px;
}

.movieMain {
	text-align: left;
	padding: 50px 10%;
	/* 	height: 550px; */
	margin-bottom: 50px;
}

.movieMain figure {
	display: inline-block;
	margin: 0px 10%;
}

.movieInfo {
	padding-left: 5%;
	display: inline-block;
	vertical-align: text-bottom;
	width: 45%;
}

.infoArea {
	font-family: Microsoft JhengHei;
}

.infoArea td {
	min-width: 50px;
}

.movieVideo {
	height: 550px;
	text-align: center;
	background: LightGrey;
}

.movieVideo iframe {
	padding-top: 40px;
}

.movieStory {
	text-align: left;
	font-family: Microsoft JhengHei;
	padding: 50px 300px;
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
				<h1 style="font-family: Microsoft JhengHei;">電影資訊</h1>
			</div>

			<div class="movieMain">
				<figure class="movieImage">
					<img
						src="<c:url value='/getPicture/movieBean/${movie.movieId }' />"
						alt="${movie.movieName }" title="${movie.movieName }">
				</figure>
				<section class="movieInfo">
					<div class="markArea">
						<img width="45px" height="35px"
							src="${pageContext.request.contextPath }/img/rate/${movie.rate }.jpg"
							alt="${movie.rate }" title="${movie.rate }">
					</div>
					<div class="titleArea">
						<h1>${movie.movieName }</h1>
						<h2 style="width: 600px;">${movie.englishName }</h2>
						<time>上映日期：${movie.releaseDate }</time>
					</div>
					<div class="infoArea">

						<h3>MOVIE INFO</h3>
						<table>
							<tr>
								<td>導演：</td>
								<td>${movie.director }</td>
							</tr>
							<tr>
								<td style="vertical-align: text-top;">演員：</td>
								<td width="500px">${movie.actor }</td>
							</tr>
							<tr>
								<td>類型：</td>
								<td>${movie.type }</td>
							</tr>
							<tr>
								<td>片長：</td>
								<td>${movie.movieLength }</td>
							</tr>
						</table>
						<br> <input type="button" style="width: 200px; height: 30px;"
							value="前往訂票"
							onclick="javascript:location.href='<spring:url value='/cinema?movieid=${movie.movieId}' />'" />
					</div>
				</section>
			</div>

			<div class="movieVideo">${movie.youtube }</div>

			<div id="info" class="movieStory">
				<article class="article">
					<h2>
						劇情簡介<span>ABOUT THE STORY</span>
					</h2>
					<div class="bbsArticle">
						<p>${movie.movieStory }</p>
						<p></p>
					</div>
				</article>
			</div>

		</div>
	</div>

	<jsp:include page="../fragment/bottom.jsp" />
</body>
</html>